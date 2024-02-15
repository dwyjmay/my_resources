<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <c:import url="/include/head.jsp" />
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <style>
        .modal1,.modal2{background: rgba(0,0,0,0.5); position: fixed; top:0; left:0; width: 100%; height: 100%;}
        .white-bg{position: absolute; top:50%; left:50%; transform:translate(-50%,-50%); width: 50%; min-height: 400px; padding:24px; background: #fff;}
    </style>
</head>
<body>
<div class="container">
    <input type="text" id="search" placeholder="검색어 입력">
</div>

<div class="container">
    <div class="row product-list">

    </div>
</div>

<div class="container basket-wrap" style="background: #e2e2e2"  ondrop="drop(event)" ondragover="allowDrop(event)">
    <h4>장바구니(드래그 가능)</h4>
    <div class="row basket"></div>
</div>

<div class="container my-3">
    <h4>최종가격</h4>
    <p class="final-price">합계 : 0</p>
    <button class="buy">구매하기</button>
</div>

<div class="modal1" style="display: none;">
    <div class="white-bg">
        <h4>성함</h4>
        <input type="text" id="name">
        <h4>연락처</h4>
        <input type="text" id="phone">
        <button class="show-receipt">입력완료</button>
        <div>
            <button class="close">닫기</button>
        </div>
    </div>
</div>

<div class="modal2" style="display: none;">
    <div class="white-bg">
        <h4>영수증</h4>
        <canvas id="canvas" width="350" height="350"></canvas>
        <div>
            <button class="close">닫기</button>
        </div>
    </div>
</div>

<script>
    let productsCopy = [];
    let cartList = [];

    //======= json불러오기 =========
    $.get('file/store.json').then((data)=>{
        productsCopy = data.products;
        data.products.forEach((a,i)=>{
            makeprdList(a);
        })
    })

    //========상품 목록 만들기=============
    function makeprdList(tgt){
        var prdList = `<div class="col-md-3">
                                <div class="item" draggable="true" ondragstart="drag(event)" data-id="\${tgt.id}">
                                    <img src="file/\${tgt.photo}" alt="">
                                    <h4>\${tgt.title}</h4>
                                    <h4>\${tgt.brand}</h4>
                                    <p>\${tgt.price}</p>
                                    <button class="add" onclick="addCart(this.parentElement);">담기</button>
                                </div>
                            </div>`
        document.querySelector('.product-list').insertAdjacentHTML('beforeend',prdList);
    }

    //=====검색어 일치하는 상품 목록만 보여주기=====
    document.querySelector('#search').addEventListener('input',function(){
        var searchText = document.querySelector('#search').value;
        var newArr = productsCopy.filter(function(a){
            return a.brand.includes(searchText) || a.title.includes(searchText)
        })
        document.querySelector('.product-list').innerHTML='';
        newArr.forEach((a,i)=>{
            makeprdList(a);
        })

        /* each 메서드 */
        // $.each(object,function(index,item){})   :: jQuery 유틸리티 메서드
        // $(selector).each(function(index,item){}) :: jQuery 일반 메서드

        $('.product-list h4').each(function(i,item){
            var getText = item.innerHTML;
            getText = getText.replace(searchText,'<span style="background:yellow;">'+searchText+'</span>')
            //$(this).html(getText.replace(searchText,'<span style="background:yellow;">'+searchText+'</span>'))
            item.innerHTML= getText;
        })
    })

    //===== 최종가격 =====
    function getTotalPrice(arr){
        var totalPrice = 0;
        arr.forEach((a)=>{
            totalPrice += a.price * a.count;
        })

        return totalPrice;
    }

    //=====담기 버튼동작 ====
    function addCart(obj){
        var prdId= obj.dataset.id
        var onCart = cartList.findIndex((item) => {return item.id == prdId}) // 누른 상품이 몇번째의 cartList의 요소인지!  (없으면 -1 반환)

        if (onCart == -1){ //장바구니에 현재 없는 상품이면
            var target = productsCopy.find((item)=>{return item.id == prdId});
            target.count=1; //count name 추가~!!~~!~~~~~~!
            cartList.push(target);
        } else{
            cartList[onCart].count++;

        }

        document.querySelector('.basket').innerHTML='';
        cartList.forEach((a,i)=>{
            var makeCart = `<div class="col-md-3 bg-white">
                            <img src="file/\${cartList[i].photo}" alt="카트">
                            <h4>\${cartList[i].title}</h4>
                            <h4>\${cartList[i].brand}}</h4>
                            <p>\${cartList[i].price}</p>
                            <input type="number" value="\${cartList[i].count}" class="item-count w-100">
        </div>`
            document.querySelector('.basket').insertAdjacentHTML('beforeend',makeCart)
        })

        document.querySelector('.final-price').innerHTML=`합계 : \${getTotalPrice(cartList)}`;

        var inputControl = document.querySelectorAll('.item-count');
        inputControl.forEach((a,i)=>{
            a.addEventListener('input',function(){
                cartList[i].count++;
                document.querySelector('.final-price').innerHTML=`합계 : \${getTotalPrice(cartList)}`;
            })
        })
    }

    //==== 드래그앤드롭 =====
    /* 요소의 속성에 draggable = "true" 추가
    * 어떤 요소 드래그 시작 : dragstart 이벤트 발동
    * 어떤 요소 드롭       : drop 이벤트 발동
    * !! 드랍할 곳에 dragover 이벤트리스너를 붙여 e.preventDefault() 실행해주어야 drop이벤트리스너가 잘 실행 된다.
    * */

    function allowDrop(ev){
        ev.preventDefault();
    }

    function drag(ev){

        //내가 생각한 몇번째 요소인지 알아내는 방법
        /*var ind = $(ev.target).parents('.col-md-3').index()+1;
        console.log(ind);*/

        //방법2. 드래그한 요소에 상품번호데이터를 숨겨놓는다 => 속성에 data-id = ??.id
        //방법3. 미지의 세계에 저장
        // ex) e.dataTransfer.setData('작명','저장할데이터')       e.dataTransfer.getData('작명');
        //!! jQuery 이벤트리스너 안에서는 e.originalEvent.dataTransfer.setData()해야함


        //console.log(ev.currentTarget.dataset.id);
        ev.dataTransfer.setData('id', ev.currentTarget.dataset.id)
    }

    function drop(ev){
        document.querySelectorAll('.add')[ev.dataTransfer.getData('id')].click();
    }

    var getName;
    var getPhone;
    //==== 구매하기 버튼  모달창1 ======
    document.querySelector('.buy').addEventListener('click',function(){
        document.querySelector('.modal1').style.display='block';

        /* 성함 입력시 저장*/
        document.getElementById('name').addEventListener('input',function(){
            //getName = e.currentTarget.value;
            getName = this.value;
        })

        /* 연락처 입력시 저장장 */
        document.getElementById('phone').addEventListener('input',function(){
            getPhone = this.value;
        })
    })

    document.querySelectorAll('.close')[0].addEventListener('click',function(){
        document.querySelector('.modal1').style.display='none';
    })

    //===== 모달창1내 입력완료버튼 모달창2 =====
    document.querySelector('.show-receipt').addEventListener('click',function(){
        if((document.getElementById('name').value=='')  || (document.getElementById('phone').value=='')){
            alert('성함과 연락처를 모두 작성해주세요.');
            document.getElementById('name').focus();
        }else{
            document.querySelector('.modal1').style.display='none';
            document.querySelector('.modal2').style.display='block';

            //==== 모달창2의 canvas 이미지 사용 방법 ====
            var canvas = document.querySelector('#canvas');
            var c = canvas.getContext('2d');
            c.font='20px dotum'
            c.fillText(`구매자 : \${getName}`,30,20);
            c.fillText(`연락처 : \${getPhone}`,30,50);
            for(var i = 0; i<cartList.length;i++){
                c.font='14px dotum';
                var itemPrice = cartList[i].price*cartList[i].count;

                c.fillText(`상품명 : \${cartList[i].title}`, 30, (100*i)+(i*20)+100);
                c.fillText(`상호명 : \${cartList[i].brand}`, 30, (100*i)+((i+1)*20)+100);
                c.fillText(`가격  : \${cartList[i].price}`, 30, (100*i)+((i+2)*20)+100);
                c.fillText(`수량  : \${cartList[i].count}`, 30, (100*i)+((i+3)*20)+100);
                c.fillText(`합계  : \${itemPrice}`, 30, (100*i)+((i+4)*20)+100);
            }
        }
    })

    document.querySelectorAll('.close')[1].addEventListener('click',function(){
        document.querySelector('.modal2').style.display='none';
    })
</script>
</body>
</html>


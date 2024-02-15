<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <c:import url="/include/head.jsp" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
<div class="container">
    <div class="row"></div>
</div>
<script>
    /* 개발자도구 - application탭 - 여러가지 저장소 有*/
    //localStorage, sessionStorage는  이름:값 (key:value) 형태로 저장 , 용량은 5mb, 문자/숫자만 저장 가능(array,object 못 넣음) :: 범용적으로 사용 가능
    //localStorage : 사이트 재접속해도 유지 됨
    //sessionStorage : 사이트 나가면 자동 삭제 (휘발성)
    //indexedDB는 구조화된 대용량 데이터 저장 시 사용

    var products = [
        { id : 0, price : 70000, title : 'Blossom Dress' },
        { id : 1, price : 50000, title : 'Springfield Shirt' },
        { id : 2, price : 60000, title : 'Black Monastery' }
    ];
    resultWrite(products);

    /* 카드 새로 쓰기 */
    function resultWrite(arrayName){
        document.querySelector('.row').innerHTML='';
        arrayName.forEach((dataName, i)=> {
            var cardBody = '<div class="col-sm-4"><img src="https://via.placeholder.com/600" class="w-100"><h5>'
                + dataName.title
                + '</h5><p>'
                + dataName.price
                + '</p><button class="buy">구매</button></div>';
            document.querySelector('.row').insertAdjacentHTML('beforeend', cardBody)
        })
    }

    //만약 array를 저장하려한다면?
/*
    localStorage.setItem('num',[1,2,3]);  →  문자로 강제 변환되어  '1,2,3'으로 저장이 됨

    ::편법:: - array를 저장하고싶다면
    array/object를 JSON으로 바꾸어 저장  (JSON : array, object 자료형을 ''따옴표를 쳐서 문자취급을 해줌)
    array/object → JSON    :: JSON.stringify()
    array/object ← JSON    :: JSON.parse()

    var arr = [1,2,3];
    var newArr = JSON.stringify(arr);
    localStorage.setItem('num',newArr);
    var jsonCont = localStorage.getItem('num');
    //console.log(jsonCont)  → array가 아니라!!! 문자로 출력되는 것! :: jsonCont[0] 을 출력하면  '['가 나옴
    console.log(JSON.parse(jsonCont));    // →  console.log(JSON.parse(jsonCont)[1]); 인덱싱 가능!!
*/
    //sessionStorage 사용법 똑같!
    //localStorage 의 데이터 수정
    //1. 수정하려는 자료를 꺼냄
    //2. 수정
    //3. 다시 넣음

    //숙제1   힌트 : siblings 요소 /   저장소에 아무것도 없을 때 , 뭐가 있을 때
    //숙제2 cart.html방문 시 localStorage에 저장된 상품명들 다 보여주기

    var btn = document.querySelectorAll('.buy');
    var arr = new Array();
    btn.forEach(function(userItem){
        userItem.addEventListener('click',function(e){
            var val = e.currentTarget.previousElementSibling.previousElementSibling.innerText;//이전형제요소의 이전형제요소를 선택하는 법
            if((localStorage.getItem('cart')==null)){
                arr.push(val);
                localStorage.setItem('cart', JSON.stringify(arr));
            }else{
                if(arr.includes(val)){
                    alert('이미 담은 상품입니다');
                }else{
                    arr.push(val);
                    localStorage.setItem('cart',JSON.stringify(arr));
                }
            }
        })
    })
    localStorage.removeItem('cart')

    /*강의 숙제 피드백*/

    // 자바스크립트는  한 요소에만 이벤트리스너를 부착할 수 있기 때문에 document.querySelectorAll('.buy')[0] 부터 하나 하나 이벤트를 만들어줘야 함 => 이벤트 버블링 이용해 하나에만 부착할수도있겠죠..?
    //e.currentTarget.previousSibling.previousSibling.innerText;   대신  e.currentTarget.previousElementSibling.previousElementSibling.을 사용 ::previousSibling 은 element는 물론, #text와 주석까지 포함시킴

    /*
    *  ::숙제1 정답::
    * userItem.addEventListener('click',function(e){
            var val = e.currentTarget.previousElementSibling.previousElementSibling.innerText;//이전형제요소의 이전형제요소를 선택하는 법
            if(localStorage.getItem('cart')==null){
                localStorage.setItem('cart', JSON.stringify([val]));
            }else{
                var arr = JSON.parse(localStorage.getItem('cart'));
                if(arr.includes(val)){
                    alert('이미 담은 상품입니다.')
                }else{
                    arr.push(val);
                    localStorage.setItem('cart',JSON.stringify(arr));
                }
            }
        })
    * */
</script>
</body>
</html>
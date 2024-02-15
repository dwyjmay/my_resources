<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <c:import url="/include/head.jsp" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
<div class="container">
    <div class="row">

    </div>
</div>
<div class="container">
    <button class="btn btn-danger">더보기</button>
</div>

<div class="container my-3">
    <button class="btn btn-danger" id="priceOrder">가격순정렬</button>
</div>
<div class="container my-4">
    <button class="btn btn-danger" id="nameOrder1">가나다순정렬</button>
</div>
<div class="container my-4">
    <button class="btn btn-danger" id="nameOrder2">다나가순정렬</button>
</div>
<div class="container my-4">
    <button class="btn btn-danger" id="underSixOrder">6만원이하만</button>
</div>
<div class="container my-4">
    <label for="pFilter">가격 필터링</label><input type="text" id="pFilter">
    <button class="btn btn-danger" id="customFilter">결과보기</button>
</div>
<div class="container my-4">
    <button class="btn btn-danger" id="originBtn">되돌리기</button>
</div>

<%--<script>
    /* 1. sort()함수  - 문자순 정렬 이뤄짐 */
    var arr = [7,3,5,2,40];

    //숫자순 정렬(오름차순)을 위해서는 ↓
    arr.sort(function(a,b){
        return a-b;
        /*
        a,b는 array 안의 자료
        return 오른쪽이 양수면 a를 오른쪽으로
        return 오른쪽이 음수면 b를 오른쪽으로
        따라서
        7,3
        7-3==4 > 0  (양수)
        3,7,5,2,40

        내림차순 정렬
        return b-a
        */
    })
    console.log(arr);

     // 가나다 순 정렬
    var arr2 = ['a','c','b']
    arr2.sort();

    // 기나다 역순 정렬 ?
    //자바스크립트에서 문자끼리 부등호비교가 가능함.  console.log(arr2[0]-arr2[1])  = true / false
    var arr3 = ['a','c','b']
    arr3.sort(function(a,b){

        if (a>b){
            return -1;
        }
        if(b>a) return 1;
    })
    console.log(arr3);

    /* 2. filter 함수 - 새 변수에 담아서 사용!! */
    // .sort()는 원본을 변형o
    // .filter()는 원본을 변형x

    var arr3 = [7,3,5,2,40];
    var newArr3 = arr3.filter(function(a){ //a는 배열 요소 하나 하나
        return a < 4;  //4미만의 자리만 남기고 싶을 때
    })
    console.log('New Arr3 : ' + newArr3)

    /* 3. map() 함수  - array 자료 전부 변형하기 위함 */
    var arr4 = [7,3,5,2,40];
    var newArr4 = arr4.map(function(a){
        return a*4;
    })
    console.log('New Arr4 : ' + newArr4)


    /* 수업 예제 */

    var products = [
        { id : 0, price : 70000, title : 'Blossom Dress' },
        { id : 1, price : 50000, title : 'Springfield Shirt' },
        { id : 2, price : 60000, title : 'Black Monastery' }
    ];


    products.forEach((dataName, i)=> {
        var cardBody = '<div class="col-sm-4"><img src="https://via.placeholder.com/600" class="w-100"><h5>'
            + dataName.title
            + '</h5><p>'
            + dataName.price
            + '</p></div>';
        document.querySelector('.row').insertAdjacentHTML('beforeend', cardBody)
    })


    document.querySelector('#priceOrder').addEventListener('click',function(){
        products.sort(function(a,b){
            return a.price - b.price;
        })
        document.querySelector('.row').innerHTML='';
        products.forEach((dataName, i)=> {
            var cardBody = '<div class="col-sm-4"><img src="https://via.placeholder.com/600" class="w-100"><h5>'
                + dataName.title
                + '</h5><p>'
                + dataName.price
                + '</p></div>';
            document.querySelector('.row').insertAdjacentHTML('beforeend', cardBody)
        })
    })

</script>--%>

<script>

    var products = [
        { id : 0, price : 70000, title : 'Blossom Dress' },
        { id : 1, price : 50000, title : 'Springfield Shirt' },
        { id : 2, price : 60000, title : 'Black Monastery' }
    ];
    resultWrite(products);

    var test = [];
    for(let i = 0; i<products.length; i++){
        test[i] = products[i];
    }

    /* 되돌리기 버튼 */
    document.querySelector('#originBtn').addEventListener('click',function(){
        resultWrite(test);
    })

    /*가격순 정렬*/
    document.querySelector('#priceOrder').addEventListener('click',function(){
        products.sort(function(a,b){
            return a.price - b.price;
        })
        resultWrite(products);
    })

    /* 상품명 다나가 순 정렬 */
    document.querySelector('#nameOrder2').addEventListener('click',function(){
        products.sort(function(a,b){
            if( a.title > b.title){
                return -1
            }
            else if(a.title == b.title){
                return 0
            } else{
                return 1;
            }
        })
        resultWrite(products);
    })

    /* 상품명 가나다 순 정렬 */
    document.querySelector('#nameOrder1').addEventListener('click',function(){
        products.sort(function(a,b){
            if( a.title > b.title){
                return 1
            }
            else if(a.title == b.title){
                return 0
            } else{
                return -1;
            }
        })
        resultWrite(products);
    })

    /* 6만원이하만 필터 */
    document.querySelector('#underSixOrder').addEventListener('click',function(){
        var newArr = products.filter(function(a){
            return a.price <= 60000
        })

        resultWrite(newArr);
        // 한 줄로 작성하기
        var newArr2 = products.filter((a) => a.price <= 60000);
    })

    /* 인풋이하 가격 필터 */
    document.querySelector('#customFilter').addEventListener('click',function(){
        var num = document.querySelector('#pFilter').value;
        var newArr = products.filter(function(a){
            return a.price <= num
        })
        resultWrite(newArr);
    })

    /* 카드 새로 쓰기 */
    function resultWrite(arrayName){
        document.querySelector('.row').innerHTML='';
        arrayName.forEach((dataName, i)=> {
            var cardBody = '<div class="col-sm-4"><img src="https://via.placeholder.com/600" class="w-100"><h5>'
                + dataName.title
                + '</h5><p>'
                + dataName.price
                + '</p></div>';
            document.querySelector('.row').insertAdjacentHTML('beforeend', cardBody)
        })
    }
</script>
</body>
</html>
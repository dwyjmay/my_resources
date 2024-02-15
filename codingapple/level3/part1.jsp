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
<div class="container mt-3">
    <div class="card p-3">
        <span class="prdName">상품명</span> / <span class="prdPrice">가격</span>
    </div>
</div>
<script>
    /* array자료형 [자료1, 자료2, 자료3 , ...]  :: 컴마로 구분 */
    // var car = '소나타';
    // var carPrice = 50000;
    // var carColor = 'white';
    var car = ['소나타',50000,'white'];     /* 여러 자료를 변수 하나에 저장 가능 */
    console.log(car[1]);
    //array 자료 추가/수정 하기!
    car[0] = '산타페' /*수정*/
    car[3] = 'ㅎㅎ' /*추가*/
    car.sort();                     // 데이터 정렬
    console.log(car);
    console.log(car.slice(1,3))     // 1번째부터 3번째 전 까지의 값

    /* object 자료형  :: 이름을 붙여 저장 가능한 장점!   (이름)key : (값)value  */
    var car2 = {
        name : '소나타',
        price : 50000
    }
    // -> 자료 꺼내쓰기
    console.log(car2['name'])   // 이렇게 쓰면 car2[변수]가능
    console.log(car2.price)     // 변수 넣기 불가능

    // object 자료 추가/ 수정 하기!
    car2.price = 60000;

    document.querySelector('.prdName').innerHTML = car2.name;
    document.querySelector('.prdPrice').innerHTML = car2.price;


    /* object 와 array의 차이점*/
    // array 는 순서(개념)대로 자료를 저장 (인덱싱 가능 -> 데이터 자르기, 정렬, 검색 등 가능)  ex) car.sort();  car.slice(1,3) : 1번째부터 3번째 전 까지의 데이터
    /* sort, slice 이외에도
    concat()
    copyWithin()
    entries()
    every()
    fill()
    filter()
    find()
    findIndex()
    forEach()
    from()
    includes()
    indexOf()*/


    // object 는 이름붙여 저장 가능  (인덱싱 불가)

</script>
</body>
</html>
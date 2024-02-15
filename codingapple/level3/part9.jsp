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
    <div class="row">

    </div>
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

    // localStorage.setItem('이름','값')
/*
    localStorage.setItem('이름','KIM'); //추가
    localStorage.getItem('이름'); //콘솔에 출력 가능
    localStorage.removeItem('이름'); //제거
*/

    //만약 array를 저장하려한다면?
/*
    localStorage.setItem('num',[1,2,3]);  →  문자로 강제 변환되어  '1,2,3'으로 저장이 됨

    ::편법:: - array를 저장하고싶다면
    array/object를 JSON으로 바꾸어 저장  (JSON : array, object 자료형을 ''따옴표를 쳐서 문자취급을 해줌)
    array/object → JSON    :: JSON.stringify()
    array/object ← JSON    :: JSON.parse()
*/
    var arr = [1,2,3];
    var newArr = JSON.stringify(arr);
    localStorage.setItem('num',newArr);
    var jsonCont = localStorage.getItem('num');
    //console.log(jsonCont)  → array가 아니라!!! 문자로 출력되는 것! :: jsonCont[0] 을 출력하면  '['가 나옴
    console.log(JSON.parse(jsonCont));    // →  console.log(JSON.parse(jsonCont)[1]); 인덱싱 가능!!
    localStorage.removeItem('num')

    //sessionStorage 사용법 똑같!
    //localStorage 의 데이터 수정
    //1. 수정하려는 자료를 꺼냄
    //2. 수정
    //3. 다시 넣음

    //숙제1   힌트 : siblings 요소 /   저장소에 아무것도 없을 때 , 뭐가 있을 때
    //숙제2 cart.html방문 시 localStorage에 저장된 상품명들 다 보여주기
</script>
</body>
</html>
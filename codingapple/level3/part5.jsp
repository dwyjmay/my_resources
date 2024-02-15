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
        #sizeSelect.hide{display:none;}
    </style>
</head>
<body>
<form class="container my-5 form-group">
    <p>상품선택</p>
    <select class="form-select mt-2">
        <option>모자</option>
        <option>셔츠</option>
        <option>바지</option>
    </select>
    <select class="form-select mt-2 hide" id="sizeSelect">
        <option value="">95</option>
        <option value="">100</option>
    </select>
</form>
<div id="test"></div>
<script>
    /* for (var i = 0; i<pants.length; i++){
                document.createElement('option');
                //성능적으로 forEach보다 빠르긴 함
            }*/


    //서버에서 사이즈 받아와서 그 갯수만큼 option을 만들어줘야함   -> 서버와 통신 아직 안되어있으니까 임시로 pants생성..
    var pants = [28,30,32,34];
    var shirts = [95,100,105];

    document.querySelectorAll('.form-select')[0].addEventListener('input',function(e){
        if(e.currentTarget.options[e.currentTarget.selectedIndex].text=='바지'){
            document.querySelector('#sizeSelect').classList.remove('hide');
            document.querySelector('#sizeSelect').innerHTML='';

            pants.forEach(function(item,i){  //콜백함수의 첫번째 파라미터 => array의 데이터가 차례로 들어감
                                            //콜백함수의 두번째 파라미터 => 0부터 1씩 증가하는 정수
                var opt = document.createElement('option');
                opt.innerHTML = item;
                document.querySelector('#sizeSelect').insertAdjacentElement('beforeend',opt)
            }) //array에 붙일 수 있는 foreach 반복문

            /*
            * function을 표현하는 다른 방법
            * pants.forEach((a) =>{
            * //차이점은 함수안의 this의 뜻이 달라질 순 있음    => 바깥this , function 재정의 this
            * })
            */
        } else if(e.currentTarget.options[e.currentTarget.selectedIndex].text=='셔츠'){
            document.querySelector('#sizeSelect').classList.remove('hide');
            document.querySelector('#sizeSelect').innerHTML='';
            shirts.forEach(function(item,i){
                var opt = document.createElement('option');
                opt.innerHTML = item;
                document.querySelector('#sizeSelect').insertAdjacentElement('beforeend',opt)
            })
        }
    })

    //object 자료형도 반복문 돌릴 수 있음 --> for in
    var obj = {
        name :'kim',
        age : 20
    }

    for (var key in obj){ //key : 자료이름
        /*console.log(key);*/
        console.log(obj[key]);
    }

    /*반복문의 용도
    1. 코드반복
    2,array, object 데이터를 하나씩 꺼내고 싶을 때*/
</script>
</body>
</html>


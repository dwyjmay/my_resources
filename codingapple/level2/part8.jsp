<%--
  Created by IntelliJ IDEA.
  User: efusioni
  Date: 2022-07-28
  Time: 오후 2:45
  To change this template use File | Settings | File Templates.
--%>
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
        #wrapper{padding-top: 72px;}
        .navbar{position: fixed; width: 100%; z-index: 5; top:0;}
        .navbar-brand{font-size: 30px; transition: 0.5s all;}
        .navbar-brand.on{font-size: 20px;}
        .bar{position:absolute; bottom:0; height:4px; background: #111;}
        .black-bg {
            display: none;
            width: 100%;
            height: 100%;
            bottom: 0;
            position: fixed;
            background: rgba(0, 0, 0, 0.5);
            z-index: 5;
            padding: 30px;
        }
        .show-modal{
            display: block;
        }

        .white-bg {
            background: white;
            border-radius: 5px;
            padding: 30px;
        }
    </style>
</head>
<body>
<div id="wrapper">
    <nav class="navbar navbar-light bg-light">
        <div class="container-fluid">
            <span class="navbar-brand">JSShop</span>
            <span class="ms-auto mx-3 badge bg-dark">Dark</span>
            <button class="navbar-toggler" type="button">
                <span class="navbar-toggler-icon"></span>
            </button>
        </div>
        <div class="bar"></div>
    </nav>
    <div class="main-bg">
        <h3>Shirts on Sale</h3>
        <button id="login" class="btn btn-danger">로그인</button>
    </div>
    <div class="black-bg">
        <div class="white-bg">
            <h4>로그인하세요</h4>
            <form action="part9_result.jsp" id="formBox">
                <div class="my-3">
                    <input type="text" class="form-control" id="inp1">
                </div>
                <div class="my-3">
                    <input type="password" class="form-control" id="inp2">
                </div>
                <button type="submit" class="btn btn-primary">전송</button>
                <button type="button" class="btn btn-danger" id="close">닫기</button>
            </form>
        </div>
    </div>
</div>
<script>
    $('#login').on('click', function () {
        $('.black-bg').addClass('show-modal');
    })

    document.querySelector('.black-bg').addEventListener('click',function(e){
        console.log(e.target);
        console.log(document.querySelector('.black-bg'));
        if(e.target == document.querySelector('.black-bg')){
            // e.target == $('.black-bg)  로 하면 console 찍었을 때 서로 다르게 나올것
            // jquery로 비교할 때는 $(e.target) == $('.black-bg') 로 같은지 비교하는게 안전하다
            document.querySelector('.black-bg').classList.remove('show-modal');
        }
    })

    /* 이벤트 버블링 발생
    : 이벤트가 상위html로 퍼지는현상상
   검은 모달창 뿐만 아니라, ex. 흰색부분눌러도 ('.white-bg  -> .black-bg 모두 클릭된 것으로 인식하기때문에 )창이 닫힘

   유용한 이벤트 관련 함수들 ( 이벤트 객체 )  e
   e.target;  //유저가 실제로 클릭한 요소     console.log(e.target);
   e.currentTarget; // 이벤트 리스너가 달린 곳
   =  this; //이벤트 리스너가 달린 곳
   e.preventDefault(); // 이벤트 기본동작을 막아줌      '선택자'.on('submit',function(e){ e.preventDefault();   => 코드 실행 시 submit 안 됨})
   e.stopPropagation();  //상위요소로 퍼지는  이벤트 버블링을 막아줌.

    */
</script>
</body>
</html>


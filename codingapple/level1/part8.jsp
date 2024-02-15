<%--
  Created by IntelliJ IDEA.
  User: efusioni
  Date: 2022-04-26
  Time: 오전 10:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <c:import url="/include/head.jsp" />
    <link rel="stylesheet" href="contents.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <style>
        /*
        one-way UI 애니메이션 만들기 (A상태 → B상태)
        1.시작 스타일 지정
        2. 최종 스타일 지정
        3. 원할 때 최종스타일로 변하라고 코드 짜기
        4.시작 스타일에 transition 추가
        */


        .black-bg {
            visibility: hidden;  /*display: none과 용도는 같지만 */
            width : 100%;
            height : 100%;
            bottom:100%;
            position : fixed;
            background : rgba(0,0,0,0.5);
            z-index : 5;
            padding: 30px;
            transition: all 0.5s;
        }
        .white-bg {
            background: white;
            border-radius: 5px;
            padding: 30px;
        }
        .show{
            visibility: visible;
            bottom:0;
        }
    </style>
</head>
<body>
<div class="black-bg">
    <div class="white-bg">
        <h4>로그인하세요</h4>
        <button class="btn btn-danger" id="close">닫기</button>
    </div>
</div>
<button id="btn">버튼</button>
<script>
    document.querySelector('#btn').addEventListener('click',function(){
        document.querySelector('.black-bg').classList.add('show');
    })
    document.querySelector('#close').addEventListener('click',function(){
        document.querySelector('.black-bg').classList.remove('show');
    })

    $('#close').on('click',function(){
        $('.black-bg').addClass('fadeIn');
    })
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>

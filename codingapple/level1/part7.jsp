<%--
  Created by IntelliJ IDEA.
  User: efusioni
  Date: 2022-04-12
  Time: 오후 02:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <c:import url="/include/head.jsp" />
    <link rel="stylesheet" href="contents.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body class="part7">
<nav class="navbar navbar-light bg-light">
    <div class="container-fluid">
        <span class="navbar-brand">Navbar</span>
        <button class="navbar-toggler" type="button">
            <span class="navbar-toggler-icon"></span>
        </button>
    </div>
</nav>

<ul class="list-group" id="test1">
    <li class="list-group-item">An item</li>
    <li class="list-group-item">A second item</li>
    <li class="list-group-item">A third item</li>
    <li class="list-group-item">A fourth item</li>
    <li class="list-group-item">And a fifth one</li>
</ul>

<p class="hello">안녕</p>
<p class="hello">안녕</p>
<p class="hello">안녕</p>
<button id="testBtn">버튼</button>

<script>
    /* 자바스크립트 */
    //document.querySelector('.hello').innerHTML='바보';
    //document.querySelector('.hello').style.fontSize='24px';
    // document.querySelector('.hello').classList.add('test1');
     /*document.querySelectorAll('.hello')[0].innerHTML='바보';
     document.querySelectorAll('.hello')[1].innerHTML='바보';
     document.querySelectorAll('.hello')[2].innerHTML='바보';*/

    /* jquery */

    $('.hello').css('fontSize','24px');
    $('.hello').addClass('test2');
    //removeClass() , toggleClass()

    $('.hello').html('바보');
    $('#testBtn').on('click',function(){
        $('.hello').slideUp(300);
    })

    /*
    * $(셀렉터)로 찾으면 jquery함수만 붙일 수 있다.
    * querySelector(셀렉터)로 찾으면 자바스크립트 함수만 붙일 수 있다.
    */
</script>



<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>
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
<body class="part6">
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


<script>
    /*
    * classList.add()  → 클래스 추가
    * classList.toggle() -> 클래스 있으면 없애고 , 없으면 생성
    * */

    document.getElementsByClassName('navbar-toggler')[0].addEventListener('click',function(){
        document.getElementsByClassName('list-group')[0].classList.toggle('show');
    })

    /*
    querySelector
    document.querySelector('#test1')                    //편리하지만 맨 위에 나오는 한 개만 찾아준다,
    document.querySelector('.list-group-item')          //클래스list-group-item 중 가장 위에 나오는 애 선택
    document.querySelectorAll(('.list-group-item')[1]   //인덱싱 필요
    */
</script>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>


<%--
Bootstrap 라이브러리

https://getbootstrap.com/docs/5.1/getting-started/introduction/

css와 js 넣기

--%>

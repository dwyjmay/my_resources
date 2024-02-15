<%--
  Created by IntelliJ IDEA.
  User: efusioni
  Date: 2022-07-25
  Time: 오후 1:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <c:import url="/include/head.jsp" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <style>
        ul.list {
            list-style-type: none;
            margin: 0;
            padding: 0;
            border-bottom: 1px solid #ccc;
        }
        ul.list::after {
            content: '';
            display: block;
            clear: both;
        }
        .tab-button {
            display: block;
            padding: 10px 20px 10px 20px;
            float: left;
            margin-right: -1px;
            margin-bottom: -1px;
            color: grey;
            text-decoration: none;
            cursor: pointer;
        }
        .orange {
            border-top: 2px solid orange;
            border-right: 1px solid #ccc;
            border-bottom: 1px solid white;
            border-left: 1px solid #ccc;
            color: black;
            margin-top: -2px;
        }
        .tab-content {
            display: none;
            padding: 10px;
        }
        .show {
            display: block;
        }
    </style>
</head>
<body>
<div class="container mt-5">
    <ul class="list">
        <li class="tab-button">Products</li>
        <li class="tab-button orange">Information</li>
        <li class="tab-button">Shipping</li>
        <li class="tab-button">gg</li>
    </ul>
    <div class="tab-content">
        <p>상품설명입니다. Product</p>
    </div>
    <div class="tab-content show">
        <p>스펙설명입니다. Information</p>
    </div>
    <div class="tab-content">
        <p>배송정보입니다. Shipping</p>
    </div>
    <div class="tab-content">
        <p>새로운 영역입니다</p>
    </div>
</div>
<script>
    var btn = document.querySelectorAll('.tab-button');
    var content = document.querySelectorAll('.tab-content');
    for(let i = 0; i < document.querySelectorAll('.tab-button').length; i++){  /* var i  아니고 let i 로 해주기!!!!!!!!!!!! */
        btn[i].addEventListener('click',function(){
            btn.forEach(function(userItem){
                userItem.classList.remove('orange');
            })
            content.forEach(function(userItem){
                userItem.classList.remove('show');
            })
            btn[i].classList.add('orange');
            content[i].classList.add('show');
        })
    }

    /*var 와 let*/

    /*btn[0].addEventListener('click',function(){
        btn.forEach(function(userItem){
            userItem.classList.remove('orange');
        })
        content.forEach(function(userItem){
            userItem.classList.remove('show');
        })
        btn[0].classList.add('orange');
        content[0].classList.add('show');
    })

    btn[1].addEventListener('click',function(){
        btn.forEach(function(userItem){
            userItem.classList.remove('orange');
        })
        content.forEach(function(userItem){
            userItem.classList.remove('show');
        })
        btn[1].classList.add('orange');
        content[1].classList.add('show');
    })

    btn[2].addEventListener('click',function(){
        btn.forEach(function(userItem){
            userItem.classList.remove('orange');
        })
        content.forEach(function(userItem){
            userItem.classList.remove('show');
        })
        btn[2].classList.add('orange');
        content[2].classList.add('show');
    })*/
</script>
</body>
</html>


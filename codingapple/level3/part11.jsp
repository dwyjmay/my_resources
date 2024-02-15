<%--
  Created by IntelliJ IDEA.
  User: efusioni
  Date: 2022-09-26
  Time: 오후 4:39
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
        .card-background{height:3000px; margin-top:800px; margin-bottom: 1600px;}
        .card-box{position: sticky;top:400px; margin-top:200px; transition: 0.2s all;}
        .card-box img{display: block; margin: 0 auto; max-width: 80%;}
    </style>
</head>
<body>
<div class="card-background">
    <div class="card-box">
        <img src="image/card1.png" alt="">
    </div>
    <div class="card-box">
        <img src="image/card2.png" alt="">
    </div>
    <div class="card-box">
        <img src="image/card3.png" alt="">
    </div>
</div>
<script>
    $(window).scroll(function(){
        var scHeight = $(window).scrollTop();

        if((scHeight >=650 ) && (scHeight<=1150)){
            var opacityData = scHeight * ((-1)/500) + (23/10)
            var scaleData = (-1/5000)*scHeight + (113/100);
            $('.card-box').eq(0).css({'opacity':opacityData, 'transform':'scale('+scaleData+')'});
        }

    })
</script>
</body>
</html>


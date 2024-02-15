<%--
  Created by IntelliJ IDEA.
  User: efusioni
  Date: 2022-05-02
  Time: 오후 5:09
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
    <style>
        .slide-container{width: 300vw;  transition: all 1s;}
        .slide-box{width: 100vw; float: left;}
    </style>
</head>
<body>

<div class="oh">
    <div class="slide-container">
        <div class="slide-box on"><img src="images/car1.png" alt=""></div>
        <div class="slide-box"><img src="images/car2.png" alt=""></div>
        <div class="slide-box"><img src="images/car3.png" alt=""></div>
    </div>
</div>
<button class="slideBtn" id="btnPrev">이전</button>
<button class="slideNum" id="btn-1">1</button>
<button class="slideNum" id="btn-2">2</button>
<button class="slideNum" id="btn-3">3</button>
<button class="slideBtn" id="btnNext">다음</button>

<script>
    let btn = document.querySelectorAll('.slideNum');
    /* 슬라이드 동작 */
    function moveSlide(ele, ind){
       var tx = (-100)*ind;
       document.querySelector('.slide-container').style.transform='translateX('+tx+'vw)';
        document.querySelectorAll('.slide-box').forEach(function(userItem){
            userItem.classList.remove('on');
        })
        document.querySelectorAll('.slide-box')[ind].classList.add('on');
    }

    /* 숫자버튼으로 이동 */
    btn.forEach(function(item, index){
        btn[index].addEventListener('click',function(){
            moveSlide(this,index);
        })
    })

    /* 이전버튼 클릭 시 */
    document.querySelector('#btnNext').addEventListener('click',function(){
        var elem = document.querySelector('.slide-box.on');
        var total_n = elem.parentNode.childElementCount;
        var i =0;
        while((elem = elem.previousElementSibling) != null){
            i++
        }
        if(i+1 === total_n) i =-1;
        moveSlide(elem,(i+1));
    })

    /* 다음버튼 클릭 시 */
    document.querySelector('#btnPrev').addEventListener('click',function(){
        var elem = document.querySelector('.slide-box.on');
        var total_n = elem.parentNode.childElementCount;
        var i =0;
        while((elem = elem.previousElementSibling) != null){
            i++
        }
        if(i === 0)i = total_n;
        moveSlide(elem,(i-1));
    })
</script>
</body>
</html>
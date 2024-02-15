<%--
  Created by IntelliJ IDEA.
  User: efusioni
  Date: 2022-07-22
  Time: 오전 10:08
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
        #wrapper{padding-top: 72px;}
        .navbar{position: fixed; width: 100%; z-index: 5; top:0;}
        .navbar-brand{font-size: 30px; transition: 0.5s all;}
        .navbar-brand.on{font-size: 20px;}
        .bar{position:absolute; bottom:0; height:4px; background: #111;}
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
    <div class="lorem" style="width: 400px; height:300px; overflow-y: scroll">
        window.addEventListener('scroll',function(){<br>
        console.log(window.scrollY)  /!* 현재 스크롤바 위치 출력 *!/<br>
        console.log(window.pageYOffset)  /!* scrollY와 같은 기능  *!/<br>
        window.scroll(0,400);  /!* 강제로 x,y 좌표로 스크롤 *!/<br>
        <br>
        부트스트랩 사용으로 스크롤바가 천천히 내려갈 시 css로<br>
        :root{ scroll-behavior : auto; }<br>
        <br>
        window.scrollBy(0 ,100); /!* 현재 위치에서 강제로 스크롤 *!/<br>

        /* for jQuery*/
        /* $(window).on('scroll',function(){<br>
        /!*$(window).scrollTop(); :  현재 스크롤바 위치 출력 *!/<br>
        console.log($(window).scrollTop())<br>
        <br>
        $(window).scrollTop(100); /!* 맨 위에서부터 아래로 100px 만큼! *!/<br>
        })*/
        <br><br>
        div의 스크롤바 내린 양 + 눈에보이는 div의 높이 == div의 실제 높이 (오차 있을 수 있음)<br>

        document.querySelector('.lorem').addEventListener('scroll',function(){<br>
        var a = document.querySelector('.lorem').scrollTop      /* div 박스의 스크롤 된 높이 */<br>
        var b = document.querySelector('.lorem').scrollHeight;  /* 실제 높이 */<br>
        var c = document.querySelector('.lorem').clientHeight /* 눈에 보이는 div의 높이 */<br>
        console.log(a,b,c);
        })

        Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quae voluptas voluptatum minus praesentium fugit debitis at, laborum ipsa itaque placeat sit, excepturi eius. Nostrum perspiciatis, eligendi quae consectetur praesentium exercitationem.Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quae voluptas voluptatum minus praesentium fugit debitis at, laborum ipsa itaque placeat sit, excepturi eius. Nostrum perspiciatis, eligendi quae consectetur praesentium exercitationem.Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quae voluptas voluptatum minus praesentium fugit debitis at, laborum ipsa itaque placeat sit, excepturi eius. Nostrum perspiciatis, eligendi quae consectetur praesentium exercitationem.Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quae voluptas voluptatum minus praesentium fugit debitis at, laborum ipsa itaque placeat sit, excepturi eius. Nostrum perspiciatis, eligendi quae consectetur praesentium exercitationem.Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quae voluptas voluptatum minus praesentium fugit debitis at, laborum ipsa itaque placeat sit, excepturi eius. Nostrum perspiciatis, eligendi quae consectetur praesentium exercitationem.
    </div>
    <div style="height: 4000px;"></div>
</div>
<%--<script>
 //div의 스크롤바 내린 양 + 눈에보이는 div의 높이 >= div의 실제 높이 (오차 있을 수 있음)

 document.querySelector('.lorem').addEventListener('scroll',function(){
     var a = document.querySelector('.lorem').scrollTop      /* div 박스의 스크롤 된 높이  :::  scrollY못 씀  */
     var b = document.querySelector('.lorem').scrollHeight;  /* 실제 높이 */
     var c = document.querySelector('.lorem').clientHeight /* 눈에 보이는 div의 높이 */
     console.log(a,b,c);
 })
</script>--%>

<%--<script>
   /* window.addEventListener('scroll',function(){
        console.log(window.scrollY)  /!* 현재 스크롤바 위치 출력 *!/
        console.log(window.pageYOffset)  /!* scrollY와 같은 기능  *!/

        window.scroll(0,400);  /!* 강제로 x,y 좌표로 스크롤 *!/

        /!*
            부트스트랩 사용으로 스크롤바가 천천히 내려갈 시 css로
            :root{
            scroll-behavior : auto;
            }
        *!/
        window.scrollBy(0 ,100); /!* 현재 위치에서 강제로 스크롤 *!/
    })*/


    /* for jQuery*/
   /* $(window).on('scroll',function(){
        /!*$(window).scrollTop(); :  현재 스크롤바 위치 출력 *!/
        console.log($(window).scrollTop())

        $(window).scrollTop(100); /!* 맨 위에서부터 아래로 100px 만큼! *!/
    })*/
</script>--%>

<script>
    window.addEventListener('scroll',function(){
        if (window.scrollY > 100){
            document.querySelector('.navbar-brand').classList.add("on");
        }else{
            document.querySelector('.navbar-brand').classList.remove("on");
        }

        var percent = ((document.documentElement.clientHeight + window.scrollY)/ document.documentElement.scrollHeight)*100
        document.querySelector('.bar').style.width=percent+'%';
    })


    document.querySelector('.lorem').addEventListener('scroll',function(){
        var currentScroll = document.querySelector('.lorem').scrollTop + document.querySelector('.lorem').clientHeight;
        var realHeight = document.querySelector('.lorem').scrollHeight;
        if(currentScroll >= realHeight){
            alert('약관을 모두 읽었습니다.')
        }
    })




    /*현재 페이지를 끝까지 스크롤 했는지?*/
    /*document.querySelector('html').scrollHeight;   //document.documentElement.scrollHeight;  와 똑같
    document.querySelector('html').clientHeight;
    window.scrollY;
    //scroll 이벤트리스너 안의 코드는 1초에 60번 이상 실행됨 ..  여러번 중복으로 나올 수 있음 -> 방지하기 위해 방편을 마련
    */


</script>
</body>
</html>


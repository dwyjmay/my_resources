<%--
  Created by IntelliJ IDEA.
  User: efusioni
  Date: 2022-04-28
  Time: 오전 9:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <c:import url="/include/head.jsp" /><c:import url="/include/head.jsp" />
    <link rel="stylesheet" href="contents.css">
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
<div class="main-bg">
    <h3>Shirts on Sale</h3>
    <button id="login" class="btn btn-danger">로그인</button>
</div>
<div class="alert alert-danger">
    <span id="sec">3</span>초 이내 구매 시 사은품 증정!
</div>
<script>
    /*기본 설정 초 후에 창이 사라지도록*/
    var ele=document.querySelector('#sec');
    var sec = ele.innerHTML;
    var func=setInterval(function(){
        sec--;
        ele.innerHTML=sec;
        if(sec<=0){
            clearInterval(func);
            document.querySelector('.alert').style.display='none';
        }
    },1000)


    /*
    * setTimeout(function(){실행할 코드},ms) ms후에 한 번 실행
    * */
    /*setTimeout(function(){
        document.querySelector('.alert').style.display='none';
    },2000)*/


    /*
    * setInterval(function(){},ms)  //ms 마다 실행
    * */
  /*  setInterval(function(){
        console.log('안뇽!');

    },1000)*/


    /*setTimeout(func1,1000)

    function func1(){
        console.log('안안녕녕');
    }

    addEventListener(function(){});
    =>
    addEventListener(func1());*/


</script>
</body>
</html>


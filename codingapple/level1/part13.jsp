<%--
  Created by IntelliJ IDEA.
  User: efusioni
  Date: 2022-04-27
  Time: 오후 2:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <c:import url="/include/head.jsp" /><c:import url="/include/head.jsp" />
    <link rel="stylesheet" href="contents.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <style>
        .dark{background: black; color:white;}
    </style>
</head>
<body>
<nav class="navbar navbar-light bg-light">
    <div class="container-fluid">
        <span class="navbar-brand">JSShop</span>
        <span class="badge bg-dark" id="test">Dark 🔁</span>
        <button class="navbar-toggler" type="button">
            <span class="navbar-toggler-icon"></span>
        </button>
    </div>
</nav>

<script>
    var cnt=0;
    document.getElementsByClassName('badge')[0].addEventListener('click',function(){
        cnt ++;
        if(cnt%2==0){
            document.getElementsByClassName('badge')[0].innerHTML='Dark 🔁';
            var test = document.getElementsByClassName('navbar')[0].className
            var change = test.replace(/dark/gi,'light');

            document.getElementsByClassName('navbar')[0].className=change;
        }else{
            document.getElementsByClassName('badge')[0].innerHTML='light 🔁'

            var test = document.getElementsByClassName('navbar')[0].className
            var change = test.replace(/light/gi,'dark');

            document.getElementsByClassName('navbar')[0].className=change;
        }
    })
</script>

   <%--
   var 이름 ='kim';  //변수의 선언, 할당. 범위
    이름 = 'park'     //재할당


    선언
    var 이름;   (할당 안 하면 undefined)

    할당
    v이름 = 'kim';

    범위
    function 함수() {
        var 이름 = 'kim';
        console.log(이름);  //변수 출력 됨
    }
    console.log(이름);            //함수 안에서 만든 변수를 밖에서 출력하려고하면 안 됨
                                //함수 바깥에서 만든 변수는 함수 안에서 사용 가능

    var, let, const 차이  (재선언, 재할당)

    let : 재선언 불가
    let 이름 = 'kim';
    let 이름 = 'park';   => 오류 발생 , 실수방지 될 수 있음음

    const : 재선언 불가, 재할당 불가
    const 이름 = 'kim';
    kim='park'; => 재할당 시도시 오류 발생. 따라서 변하면 안 되는 값을 보관하기 좋음!

    [범위]
    var : function scoped
    let : {} 모든 중괄호 (if , for문 포함)
    const : {} 모든 중괄호 (if , for문 포함)
    --%>
</body>
</html>


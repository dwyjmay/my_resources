<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <c:import url="/include/head.jsp"/>
    <link rel="stylesheet" href="contents.css">
</head>
<body class="part4">
<%--<div class="alertBox" id="alertBox">알림창<a href="javascript:;" onclick="toggleBox('none');">X</a></div>
<button onclick="toggleBox('block');">버튼</button>

<script>
    function toggleBox(txt) {        // (???) -> 파라미터
        document.getElementById('alertBox').style.display = txt;
    }

    function plus(r) {
        2 + r
    }
</script>--%>


<!-- 숙제 -->
<div id="popBox">
    <p id="textCont"></p>
    <button onclick="closePop()">닫기</button>
</div>

<button onclick="showPop('아이디입력하세요')">버튼1</button>
<button onclick="showPop('비번입력하세요')">버튼2</button>

<script>
    function showPop(str) {
        document.getElementById('textCont').innerHTML=str;
        document.getElementById('popBox').style.display='block';
    }

    function closePop(){
        document.getElementById('popBox').style.display='none';
    }
</script>
</body>
</html>


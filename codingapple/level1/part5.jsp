<%--
  Created by IntelliJ IDEA.
  User: efusioni
  Date: 2022-04-12
  Time: 오전 10:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <c:import url="/include/head.jsp" />
    <link rel="stylesheet" href="contents.css">
</head>
<body class="part5">
<!--
    getElementById() -> for id
    getElementByClassName() -> for class

    class는 여러 개 나올  수 있으므로 인덱싱이 필요함 [0]

    ex)
    document.getElementByClassName('title1')[0].innerHTML = 'XXXX';   첫 번째 .title요소선택
 -->

<!--
 onclick 대신에 addEventListener(' click ', function(){ }) 사용

 event : 클릭 / 키입력/ 스크롤/ 드래그 ↑ 첫 번재 파라미터에 넣으면 됨
        (click. keydowon, scroll, mouseover...)

function(){} : 콜백함수(파라미터자리에 들어가는 함수)


 -->
<div id="popBox">
    <p id="textCont"></p>
    <button id="close">닫기</button>
</div>

<button onclick="showPop('아이디입력하세요')">버튼1</button>
<button onclick="showPop('비번입력하세요')">버튼2</button>

<script>
    document.getElementById('close').addEventListener('click',function(){
        document.getElementById('popBox').style.display='none';
    })

    /*function closePop(){
        document.getElementById('popBox').style.display='none';
    }*/

    function showPop(str) {
        document.getElementById('textCont').innerHTML=str;
        document.getElementById('popBox').style.display='block';
    }

</script>

</body>
</html>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <c:import url="/include/head.jsp" />
    <link rel="stylesheet" href="contents.css">
</head>
<body class="part2">
<div class="alertBox" id="alertBox">알림창<a href="javascript:;" onclick="document.getElementById('alertBox').style.display='none';">X</a></div>
<button onclick="document.getElementById('alertBox').style.display='block';">버튼</button>

</body>
</html>


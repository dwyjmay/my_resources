<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="mainTitle" value="input:t 숫자만 입력 받기" scope="request"/>
<html lang="en">
<head>
    <c:import url="/include/head.jsp" />
    <script>
        $(function(){
            //숫자만 입력
            $("input:text[numberOnly]").on("keyup", function() {
                $(this).val($(this).val().replace(/[^0-9]/g,""));
            });
        })
    </script>
    <style>
        dl{display:flex; align-items: center;}
        dt{margin-right:40px;}
    </style>
</head>
<body>
<div id="wrapper">
    <dl>
        <dt>입력칸</dt>
        <dd>
            <p class="ipt">
                <input type="text" name="" id="" numberOnly>
            </p>
        </dd>
    </dl>
</div>
</body>
</html>
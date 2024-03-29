<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <c:import url="/include/head.jsp" />
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>

<button type="button" onclick="vibrate()" > 진동 시작 </button> <br />
<button type="button" onclick="vibratearray()" > SOS 진동 시작 </button> <br />
<button type="button" onclick="stop()" > 진동 중지 </button>
</body>
</html>

<script type="text/javascript">
    // 작동되는 진동 메소드가 다르므로 통합
    navigator.vibrate = navigator.vibrate || navigator.webkitVibrate || navigator.mozVibrate || navigator.msVibrate;

    function vibrate() {
        if (navigator.vibrate) {
            navigator.vibrate(20000); // 진동을 울리게 한다. 1000ms = 1초
        }
        else {
            alert("진동을 지원하지 않는 기종 입니다.");
        }
    }

    function vibratearray() {
        if (navigator.vibrate) {
            // 배열로도 가능하다. 진동은 SOS 모스부호
            navigator.vibrate([100,30,100,30,100,200,200,30,200,30,200,200,100,30,100,30,100]);
        }
        else
        {
            alert("진동을 지원하지 않는 기종 입니다.");
        }
    }

    function stop() {
        navigator.vibrate(0);
    }
</script>
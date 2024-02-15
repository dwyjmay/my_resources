<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <c:import url="/include/head.jsp" />
</head>
<body>
<h1 id="hello">안녕하세요</h1>
<h1 id="hi">JS 초보에요</h1>
<script>
    document.getElementById('hello').innerHTML='안녕';
    document.getElementById('hi').innerHTML='JS 고수에요';

    document.getElementById('hello').style.fontSize='16px';
    /*
    * document.getElementById('??').??='??';
    * document.getElementById('??').style.color='red';
    * document.getElementById('??').src='??';
    * */


    /*
    * 자바스크립트에서도  quertSelector로 가져온 노드에서 style 속성을 참조하여 css 속성을 적용시킬 수 있다.
    *
    * css에서 여러 단어로 이어진 속성은 '-'로 연결되어있는데, javascript에서는 - 를 사용하지 않고
    * 단어를 Camel Case 로 사용한다 (ex. [css]background-color → [javascript] backgroundColor)
    *
    * .innerHtml / .style / .color 처럼  점을 찍는데 괄호가 없느건 메소드(또는 함수)라고 부른다.
    * */
</script>
</body>
</html>


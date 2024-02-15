<%--
1.데이터의 url 기재
2. get인지 post인지 잘 기재해야 데이터를 준다
    (get은 데이터를 읽을 때 , post는 데이터를 보낼 때)

*특정 url로 get 요청하는 법?
브라우저의 주소창
post요청 하는법?
form태그
<form action="/adfadf" method="post"> </form>

*get/post 요청하면 브라우저가 새로고침 된다.
*ajax -> 새로 고침 없이 get, post 요청하는 기능

*ajax로 get 요청하는 법
$.get('url~~')

<script>

</script>
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <c:import url="/include/head.jsp" />
    <link rel="stylesheet" href="contents.css">
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
<script>
    /*
    $.get('https://codingapple1.github.io./hello.txt')
        .done(function(data){ //성공했을 때
            console.log(data);
        })
    */
    /*
    $.post('https://codingapple1.github.io./hello.txt',{name : 'kim'})
        .done(function(data){ //요청 성공했을 때
            console.log(data);
        }).fail(function(){//요청 실패했을 때
            console.log('실패함')
    })
    */

    /*
    $.get('https://codingapple1.github.io/price.json')
    .done(function(data){
        console.log(data.price);
    })
*/

    //  서버와 유저는 문자자료만 주고받을 수 있음
    // object, array를 보내고 싶으면 따옴표쳐서 문자처럼 만들어야 함   ex  "{"price":5000}"      => json    문자로 되어있어서 원하는 자료만 뽑기가 어렵다
    //json을 다시 objcet로 바꿔주는 기능을 위해  -> .then(res => res.json())
    // $.get()은 json->object 자동 변환해주기 때문에 필요 없음


    /* 쌩 자바스크립트로 */

    fetch('https://codingapple1.github.io/price.json') //get요청
    .then(res => res.json())
    .then(data =>{
        console.log(data)
    })
    .catch(error => {
        console.log(error)
    })

</script>
</body>
</html>


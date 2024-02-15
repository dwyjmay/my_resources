<%--
  Created by IntelliJ IDEA.
  User: efusioni
  Date: 2022-04-27
  Time: 오전 10:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <c:import url="/include/head.jsp"/><c:import url="/include/head.jsp"/>
    <link rel="stylesheet" href="contents.css">
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <style>
        .black-bg {
            width: 100%;
            height: 100%;
            bottom: 0;
            position: fixed;
            background: rgba(0, 0, 0, 0.5);
            z-index: 5;
            padding: 30px;
        }

        .white-bg {
            background: white;
            border-radius: 5px;
            padding: 30px;
        }
    </style>
</head>
<body>
<div class="black-bg">
    <div class="white-bg">
        <h4>로그인하세요</h4>
        <form action="part9_result.jsp" id="formBox">
            <div class="my-3">
                <input type="text" class="form-control" id="inp1">
            </div>
            <div class="my-3">
                <input type="password" class="form-control" id="inp2">
            </div>
            <button type="submit" class="btn btn-primary">전송</button>
            <button type="button" class="btn btn-danger" id="close">닫기</button>
        </form>
    </div>
</div>
<script>
    document.getElementById('formBox').addEventListener('submit', function (e) {
        if (document.getElementById('inp1').value === '') {
            alert('아이디를 입력하세요');
            e.preventDefault();
        } else if (document.getElementById('inp2').value === '') {
            alert('비밀번호를 입력하세요');
            e.preventDefault();
        } else if (document.getElementById('inp2').value.length < 6) {
            alert('비밀번호를 6자 이상으로 설정해주세요');
            e.preventDefault();
        }
    })
/* input 에서만 일어나는 이벤트 */
    document.getElementById('inp1').addEventListener('input',function(){
        //input의 내용이 바뀔 때 마다 일어나는 이벤트
        console.log('hi');
    })
    document.getElementById('inp1').addEventListener('change',function(){
        //input의 내용이 바뀌고 커서를 포커스 옮겨졌을 때 일어나는 이벤트
        console.log('hello');
    })

    /* 조건문
    *  == 같다  === 자료형(type)까지 같다
    * != 다르다
    * !== 료형(type)까지 다르다
    *
    * true, false로 나와야한다
    * truthy 자료 : 0제외 숫자, '문자', [], {}      |       falsy 자료 : 0 , '', null, undefined, NaN
    * ex) 1 = true , 0=false 로 인식   if(1){}
    *
    * */
</script>
</body>
</html>

<%--
  Created by IntelliJ IDEA.
  User: efusioni
  Date: 2022-04-26
  Time: 오후 5:37
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
        .black-bg {
            visibility: hidden;  /*display: none과 용도는 같지만 */
            width : 100%;
            height : 100%;
            bottom:100%;
            position : fixed;
            background : rgba(0,0,0,0.5);
            z-index : 5;
            padding: 30px;
            transition: all 0.5s;
        }
        .white-bg {
            background: white;
            border-radius: 5px;
            padding: 30px;
        }
        .show{
            visibility: visible;
            bottom:0;
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
        <%--
        <form>안의 <button>의 전송버튼의 type = submit, 그 외에는 type=button
        <form>을 쓰면 서버로 유저의 정보를 전송할 수 있음  <form action ="전송할 url">
        --%>
    </div>
</div>
<button id="btn">버튼</button>
<script>
    document.querySelector('#btn').addEventListener('click',function(){
        document.querySelector('.black-bg').classList.add('show');
    })
    document.querySelector('#close').addEventListener('click',function(){
        document.querySelector('.black-bg').classList.remove('show');
    })
    document.getElementById('formBox').addEventListener('submit',function(e){
        if(document.getElementById('inp1').value===''){
            alert('아이디를 입력하세요');
            e.preventDefault();
        } else if(document.getElementById('inp2').value===''){
            alert('비밀번호를 입력하세요');
            e.preventDefault();
        } else if(document.getElementById('inp2').value.length<6){
            alert('비밀번호를 6자 이상으로 설정해주세요');
            e.preventDefault();
        }
    })
</script>
</body>
</html>

<%--
<script>
    if(1==3){
        console.log('맞아여');
    }else if(3==3){
        console.log('맞습니다')
    }else{

    }

    /*
    * if문이 참 -> else if나 else 더 검사 하지 않음
    * if문이 거짓 -> 그 다음의 else if나 else 검사
    * */
</script>--%>

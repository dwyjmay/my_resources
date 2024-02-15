<%--
  Created by IntelliJ IDEA.
  User: efusioni
  Date: 2022-05-02
  Time: 오후 3:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <c:import url="/include/head.jsp"/><c:import url="/include/head.jsp"/>
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
        } else if(      !(/\S+@\S+\.\S+/.test(document.getElementById('inp1').value))  ){
            alert('이메일 형식을 맞추어주세요!');
            e.preventDefault();

        } else if (     !(/[A-Z]/.test(document.getElementById('inp2').value))       ){
            alert('비밀번호에 대문자를 포함해 주세요!')
            e.preventDefault();
        }
    })

    /*
    * 정규식
    * /[A-Z]/.test('abCde'); 대문자 아무거나
    * /[a-z]/.test('abCde'); 소문자 아무거나
    * /[a-zA-Z]/.test('abCde'); 아무 알파벳 한 글자
    * /[ㄱ-ㅎ가-힣]/.test('강'); 한글문자(자음) 하나    ㅏ-ㅣ
    * /[0-9]/.test('45ek') 숫자 아무거나
    * /\S/.test('dd') 아무 문자 1개 (특수기호 포함)
    * /^a/.test('sdfada') a로 시작하는지
    * /a$/.test('ddfdda') a로 끝나는지
    * a|b
    *
    *
    * 이메일 검사 ?  aaa@bbb.ccc
    *
    * /\S@\S\.\S/.test('aaa@bbb.ccc');  false =? \S는 문자 1개
    * /\S+@\S+\.\S+/.test('aaa@bbb.ccc'); true = ? \S 다음에 + 기호로   +앞의 문자 반복 검색
    * /a+.@\S+\.\S+/.test('aab@bedd.cccc');
    * */
</script>
</body>
</html>

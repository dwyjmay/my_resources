<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="mainTitle" value="input:n 최대 입력 길이" scope="request"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <c:import url="/include/head.jsp" />
</head>
<body>
<main>
    <section class="section">
        <h1>input number의 최대길이</h1>
        <article class="explanation">
            <div class="form-typeA">
                <div class="field-cell">
                    <label for="">텍스트</label>
                    <div class="field">
                        <input type="text" required>
                    </div>
                </div>
                <div class="field-cell">
                    <label for="">주민등록번호</label>
                    <div class="field">
                        <input type="number" maxlength="6" oninput="maxLengthCheck(this)" required>
                        ~
                        <input type="number" maxlength="7" oninput="maxLengthCheck(this)" required>
                    </div>
                </div>
                <div class="field-cell">
                    <label for="">아이디 확인</label>
                    <div class="field">
                        <input type="text" required>
                        <button type="button">중복 확인</button>
                    </div>
                </div>
                <div class="field-cell">
                    <label for="">주소</label>
                    <div class="field ">
                        <div class="field-row">
                            <input type="text" required>
                            <button type="button">우편번호</button>
                        </div>
                        <div class="field-row">
                            <input type="text" required>
                        </div>
                        <div class="field-row">
                            양식을 지켜주시기 바랍니다.
                        </div>
                    </div>
                </div>
                <div class="field-cell">
                    <div class="field ">
                        <div class="field-row">
                            <label for="">성</label>
                            <input type="text" required>
                        </div>
                        <div class="field-row">
                            <label for="">이름</label>
                            <input type="text" required>
                        </div>
                    </div>
                </div>
            </div>
            <span class="exp-typeD">
                👉🏻input type ="text" 에서는 maxLength="6" 의 속성이 먹히지만 type="number"에서는 먹히지 않음!!
            </span>
        </article>
    </section>
</main>
<script>
    function maxLengthCheck(object) {
        if (object.value.length > object.maxLength) {
            //object.maxLength : 매개변수 object의 maxlength 속성 값입니다.
            object.value = object.value.slice(0, object.maxLength);
        }
    }
</script>
</body>
</html>
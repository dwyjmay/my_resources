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
                    <label for="info1">주민등록번호</label>
                    <div class="field" id="info1">
                        <input type="number" maxlength="6" oninput="maxLengthCheck(this)" required aria-label="앞자리 입력 ">
                        ~
                        <input type="number" maxlength="7" oninput="maxLengthCheck(this)" required aria-label="뒷자리 입력 ">
                    </div>
                </div>
                <div class="field-cell">
                    <label for="info2">주민등록번호</label>
                    <div class="field" id="info2">
                        <input type="text" maxlength="6" required aria-label="앞자리 입력 ">
                        ~
                        <input type="text" maxlength="8" required aria-label="뒷자리 입력 ">
                    </div>
                </div>
            </div>
            <span class="exp-typeD">
                👉🏻input type ="text" 에서는 maxLength="6"만으로 최대길이 제한이 먹지만, type="number"에서는 먹히지 않음!!
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
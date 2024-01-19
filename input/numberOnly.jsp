<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="mainTitle" value="input:t 숫자만 입력 받기" scope="request"/>
<html lang="en">
<head>
    <c:import url="/include/head.jsp" />
</head>
<body>
<main>
    <section class="section">
        <article class="explanation">
            <div class="form-typeA">
                <div class="field-cell">
                    <label for="input1">숫자만 입력</label>
                    <div class="field">
                        <input type="text" id="input1" numberOnly>
                    </div>
                </div>
            </div>
        </article>
    </section>
</main>
<script>
    //숫자만 입력
    $("input:text[numberOnly]").on("keyup", function() {
        $(this).val($(this).val().replace(/[^0-9]/g,""));
    });
</script>
</body>
</html>
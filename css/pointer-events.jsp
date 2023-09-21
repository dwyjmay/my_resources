<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html lang="ko">
<head>
    <c:import url="/include/head.jsp" />
    <style>

    </style>
</head>
<body>
<main>
    <section class="section">
        <h1>배경</h1>
        <article class="explanation">
            이벤트가 부여된 요소를 숨기면 해당 이벤트가 작동하지 않을 것 같지만,
            숨긴 방식식이 <span class="exp-typeA">opacity</span> 를 사용한 경우라면, 가시성이 없어도 이벤트는 응답하게 된다.
            이를 강제 제어하기 위해 <span class="exp-typeB">pointer-events</span>라는 속성을 활용할 수 있다.
        </article>
    </section>
    <section class="section">
        <h1>요소를 숨기는 여러가지 방식</h1>
        <table class="tableTypeA">
            <colgroup>
                <col width="100">
                <col width="200">
                <col width="200">
                <col width="100">
                <col width="*">
            </colgroup>
            <thead>
            <tr>
                <th>속성 : 값</th>
                <th>공간점유</th>
                <th>이벤트</th>
                <th>tab 접근</th>
            </tr>
            </thead>
            <tr>
                <td>opacity : 0</td>
                <td>점유</td>
                <td>활성</td>
                <td>가능</td>
            </tr>
            <tr>
                <td>visibility : hidden</td>
                <td>점유</td>
                <td>비활성 </td>
                <td>불가능</td>
            </tr>
            <tr>
                <td>visibility : collapse</td>
                <td>테이블안에서 점유</td>
                <td>비활성</td>
                <td>불가능</td>
            </tr>
            <tr>
                <td>display : none</td>
                <td>비점유</td>
                <td>비활성</td>
                <td>불가능</td>
            </tr>
        </table>
        <article class="explanation">
            이벤트를 비활성화 시킬 수 있는 속성을 사용하면 되지만,<br>
            상황에 따라 트랜지션에나 애니메이션 효과를 위해 opacity를 사용해야 할 때가 있다.<br>
            이런 요소의 이벤트를 제거하거나 다시 활성화 시켜야하는 경우가 있다면 <span class="exp-typeB">pointer-events</span> 속성을 쓰면 된다.
            (css hover/active, js click , 커서 드래그 등)
            <br>
            <p>pointer-events 속성에는 11개의 속성값이 있지만 다음의 3가지를 제외하고는 모두 svg에서 사용하도록 되어있다.</p>
            <ol>
                <li><span class="exp-typeA">none</span> : HTML 요소에 정의된 크릭, 상태(hover,active..) 커서 옵션 비활성화</li>
                <li><span class="exp-typeA">auto</span> : 비활성화된 이벤트를 다시 기본 기능을 하게 돌림.</li>
                <li><span class="exp-typeA">inherit</span> : 부모 요소로부터 pointer-events 값을 상속 받음</li>
            </ol>
        </article>
    </section>
</main>
</body>
</html>

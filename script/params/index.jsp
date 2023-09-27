<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <c:import url="/include/head.jsp" />
    <script>
        function myFunc(obj){
            var ind =  $(obj).parent().index() + 1;
            var params = {
                num : ind
            }
            $.post('content.jsp',params,function (data){
                $('.explanation').append(data);

            })
        }
    </script>
</head>
<body>
<main>
    <section class="section">
        <h1>params 주고 받기</h1>
        <article class="explanation">
            <h3>점심메뉴</h3>
            <ul>
                <li>
                    <a href="javascript:;" onclick="myFunc(this);">편의점 - 기타</a>
                </li>
                <li>
                    <a href="javascript:;" onclick="myFunc(this);">서브웨이 - 기타</a>
                </li>
                <li>
                    <a href="javascript:;" onclick="myFunc(this);">곰식당 - 한식</a>
                </li>
                <li>
                    <a href="javascript:;" onclick="myFunc(this);">스폰티노 - 양식</a>
                </li>
                <li>
                    <a href="javascript:;" onclick="myFunc(this);">을지다락 - 양식</a>
                </li>
                <li>
                    <a href="javascript:;" onclick="myFunc(this);">유가네 - 한식</a>
                </li>
            </ul>
        </article>
    </section>
</main>
</body>
</html>


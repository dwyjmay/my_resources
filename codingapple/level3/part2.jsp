<%--
  Created by IntelliJ IDEA.
  User: efusioni
  Date: 2022-08-02
  Time: 오전 10:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <c:import url="/include/head.jsp" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
<div class="container mt-3">
    <div class="card p-3">
        <span class="prdName">상품명</span> / <span class="prdPrice">가격</span>
    </div>
</div>
<script>
    var car2 = {
        name : '소나타',
        price : [50000,3000,4000] /* object 안에 objct, array 등 다 넣을 수 있음 */
    }

    // 데이터바인딩 -> jquery,react,vue..
    // -> 자료 꺼내쓰기
    document.querySelector('.prdPrice').innerHTML = car2['price'][2];
    console.log(car2);
    /*
    * 출력 시   { 으로 시작하면 object 자료형
    * 출력 시   [ 으로 시작하면 array 자료형
    * */
</script>
</body>
</html>
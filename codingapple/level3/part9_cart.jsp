<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <c:import url="/include/head.jsp" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
<div class="container">
    <h4>장바구니 페이지</h4>

</div>
<script>
    //숙제1   힌트 : siblings 요소 /   저장소에 아무것도 없을 때 , 뭐가 있을 때
    //숙제2 cart.html방문 시 localStorage에 저장된 상품명들 다 보여주기

    var prdName = JSON.parse(localStorage.getItem('cart'));
    for(let i = 0; i<prdName.length; i++){
        var a = document.createElement('p');
        a.innerHTML = prdName[i]
        document.querySelector('.container').appendChild(a);
    }

</script>
</body>
</html>
<%--
  Created by IntelliJ IDEA.
  User: efusioni
  Date: 2022-08-02
  Time: 오전 10:35
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
<div class="card-group container">
    <div class="card">
        <img src="https://via.placeholder.com/600">
        <div class="card-body">
            <h5>Card title</h5>
            <p>가격 : 70000</p>
            <button class="btn btn-danger">주문하기</button>
        </div>
    </div>
    <div class="card">
        <img src="https://via.placeholder.com/600">
        <div class="card-body">
            <h5>Card title</h5>
            <p>가격 : 70000</p>
            <button class="btn btn-danger">주문하기</button>
        </div>
    </div>
    <div class="card">
        <img src="https://via.placeholder.com/600">
        <div class="card-body">
            <h5>Card title</h5>
            <p>가격 : 70000</p>
            <button class="btn btn-danger">주문하기</button>
        </div>
    </div>
</div>

<script>
    var products = [
        { id : 0, price : 70000, title : 'Blossom Dress' },
        { id : 1, price : 50000, title : 'Springfield Shirt' },
        { id : 2, price : 60000, title : 'Black Monastery' }
    ];

    for(let i = 0; i<3; i++){
        document.querySelectorAll('.card-body')[i].children[0].innerHTML = products[i].title;
        document.querySelectorAll('.card-body')[i].children[1].innerHTML = '가격 : ' + products[i].price;
        /*document.querySelectorAll('.card-body h5').innerHtml = products[i].title;*/
    }

    var a = '안녕';
    /*console.log('문자'+a+'문자');*/
    console.log(`문자 \${a} 문자`);    // jsp 에는 백틱 사용 시 \ 를 붙여주어야 한다.
    /*콘솔에   `문자${a}문자`*/
</script>
</body>
</html>
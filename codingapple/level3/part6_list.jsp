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
<div class="container">
    <div class="row">

    </div>
</div>
<div class="container">
    <button class="btn btn-danger">더보기</button>
</div>
<script>
    var products = [
        { id : 0, price : 70000, title : 'Blossom Dress' },
        { id : 1, price : 50000, title : 'Springfield Shirt' },
        { id : 2, price : 60000, title : 'Black Monastery' }
    ];

    /*var cardBody = `<div class="col-sm-4">
            <img src="https://via.placeholder.com/600" class="w-100">
            <h5></h5>
            <p></p>
        </div>`;

    products.forEach(function(item, i){
        document.querySelector('.row').insertAdjacentHTML('beforeend',cardBody)
        document.querySelectorAll('.col-sm-4')[i].children[1].innerHTML = products[i].title;
        document.querySelectorAll('.col-sm-4')[i].children[2].innerHTML = '가격 : ' + products[i].price;
    })*/

    function makeCard(tgt){
        tgt.forEach((dataName,i)=>{
            var cardBody = '<div class="col-sm-4"><img src="https://via.placeholder.com/600" class="w-100"><h5>'
                + dataName.title
                + '</h5><p>'
                + dataName.price
                + '</p></div>';
            document.querySelector('.row').insertAdjacentHTML('beforeend',cardBody)
        })
    }

    makeCard(products);
    var moreBtnCnt = 0;

    document.querySelector('.btn-danger').addEventListener('click',function(){
        moreBtnCnt++;
        $.get('https://codingapple1.github.io/js/more'+ moreBtnCnt +'.json')
        .done(function(data){
            makeCard(data)
        })
        if(moreBtnCnt>=2){document.querySelector('.btn-danger').remove();}
    })

</script>
</body>
</html>
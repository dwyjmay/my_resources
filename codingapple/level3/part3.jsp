<%--
  Created by IntelliJ IDEA.
  User: efusioni
  Date: 2022-08-02
  Time: 오후 1:01
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
    <style>
        #sizeSelect{display:none;}
    </style>
</head>
<body>
<form class="container my-5 form-group">
    <p>상품선택</p>
    <select class="form-select mt-2">
        <option>모자</option>
        <option>셔츠</option>
        <option>바지</option>
    </select>
    <select class="form-select mt-2" id="sizeSelect">
        <option value="">95</option>
        <option value="">100</option>
        <option value="">105</option>
    </select>
</form>

<form class="container my-5 form-group">
    <p>예금 이자 계산기</p>
    <ul>
        <li>
            <span>예치금액</span>
            <input type="text" id="initialInput">
        </li>
        <li>
            <span>예치기간</span>
            <select name="" class="form-select" id="yearsSelect">
                <option value="3">3 (최단 예치기간)</option>
                <option value="6">6 (반년)</option>
                <option value="12">12 (1년)</option>
                <option value="18">18 (1.5년)</option>
                <option value="24">24 (2년)</option>
                <option value="30">30 (2.5년)</option>
                <option value="36">36 (3년)</option>
                <option value="60">60 (5년)</option>
            </select>
        </li>
        <li>
            <span>연이자율</span>
            <input type="number" id="interestInput">
        </li>
    </ul>
    <p>만기지급액 : <span class="resultArea"></span></p>
</form>
<script>
    // initial: 계산 전의 잔고
    // interest: 이자율. 0.05는 연 5%의 이자율을 의미합니다.
    // years: 예금 유치 기간으로, 연 단위

    document.querySelector('#initialInput').addEventListener('input', function (e) {
        var initial = e.currentTarget.value;
        var years = document.querySelector('#yearsSelect').options[document.querySelector('#yearsSelect').selectedIndex].value/12;
        var interest = document.querySelector('#interestInput').value*0.01;
        console.log(interest)
        let result = Math.round(initial * (1 + interest * years));
        document.querySelector('.resultArea').innerHTML = result;
    })

</script>
<script>
    //셔츠 고르면 #sizeSelect 보여주기
    var selectElement =document.querySelectorAll('.form-select')[0];
    selectElement.addEventListener('input',function(){
        /*if(selectElement.selectedIndex == 1){
            document.querySelector('#sizeSelect').style.display="block";
        }*/
        if(selectElement.options[selectElement.selectedIndex].text=='셔츠'){
            /* jquery  $('.form-select').eq(0).val*/
            document.querySelector('#sizeSelect').style.display="block";
        }else{document.querySelector('#sizeSelect').style.display="none";}
    })


    /* 다른 방법 1  e.currentTarget 이용 */
/*
    document.querySelectorAll('.form-select')[0].addEventListener('input',function(e){
        if(e.currentTarget.options[e.currentTarget.selectedIndex].text=='셔츠'){
            document.querySelector('#sizeSelect').style.display="block";
        }
    })
*/

    /* 다른 방법 2 this 이용 */
/*
    document.querySelectorAll('.form-select')[0].addEventListener('input',function(){
        if(this.options[this.selectedIndex].text=='셔츠'){
            document.querySelector('#sizeSelect').style.display="block";
        }
    })
*/
</script>
</body>
</html>
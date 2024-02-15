<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <c:import url="/include/head.jsp" />
</head>
<body>
<script>
    /*console.log(55555*1.1);*/  // 컴퓨터는 이진법으로 계산하기때문에 약간의 오차가 있음

    /*
    * 1. 소수점에 10을 곱해서 구한 뒤 다ㅣㅅ 10으로 나누든가
    * 2.라이브러리를 사용하든가
    * */


    console.log(vat(50));
    function vat(a){
        var num = (a*1.1).toFixed(2)  /* toFixed(x)  : 소수 x 자리에서 반올림  , 하지만 문자로 변환된다.  */
        return parseFloat(num);  /*  parseFloat() 실수로 변환, parseInt() 정수로 변환*/
    }

    /* Q1. 함수에 분과 초를 차례로 파라미터로 입력하면 ms단위로 바꿔서 뱉어주는 함수를 만들어봅시다. ( 1초 = 1000ms) */
    function q1(a,b){
        var msCalc = ((a*60)+b)*1000
        return msCalc
    }
    console.log("문제1번 : ",q1(1,30))
    console.log("문제1번 : ",q1(2,10));


    /* Q2. 가격을 파라미터로 입력하면 10% 할인가를 뱉는 함수를 만들어봅시다.

근데 첫 구매여부도 true/false로 둘째파라미터에 입력해서 첫 구매가 맞을 경우 추가로 1.5 달러도 할인해줘야합니다.

주의사항은 가격으로 10.3 이런거 넣으면 뒤에 소수점 길게 나올 수도 있으니 알아서 처리해보든가 합시다.  */
    function q2(price,n){
        var discount = parseFloat((price*0.9).toFixed(2));
        if(n){
            discount = discount - 1.5;
        }
        return discount;
    }
    console.log("문제2번 : ",q2(70,false));
    console.log("문제2번 : ",q2(10,true));
    console.log("문제2번 : ",q2(10.3,true));   /* toFixed(2) */
</script>
</body>
</html>


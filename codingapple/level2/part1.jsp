<%--
  Created by IntelliJ IDEA.
  User: efusioni
  Date: 2022-04-27
  Time: 오후 5:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <c:import url="/include/head.jsp" /><c:import url="/include/head.jsp" />
    <link rel="stylesheet" href="contents.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
<%-- 문제 3번 --%>
<%--<p>태조 이성계가 태어난 연도는?</p>
<input type="text" id="answer">
<button id="send-answer">제출</button>--%>

<script>
    /* 문제 3번 스크립트*/
    var cnt = 0;
    document.querySelector('#send-answer').addEventListener('click',function() {
        cnt++;
        if (document.querySelector('#answer').value == 1335) {
            alert('성공');
        } else if ((cnt >= 3) && document.querySelector('#answer').value != 1335) {
            alert('멍청아!')
        }
    })

</script>

<script>
/*
    const place = '출신지역';
    var age = 26;



    var name = 'park';
    var id = 0;

    function showName(){
        var name = 'kim';
        var id = 1;
        console.log(name);
    }

    showName();         //kim 출력
    console.log(id);    //0출력력
*/

/* 문제 1번 */

    var money = 10000;
    var total =0;

    function bank(mny){
        var rate;
        if(mny < 50000 ){
            total = mny*1.15*1.15;
        }else{
            total=mny*1.2*1.2;
        }
        console.log(total);
    }
//    bank(money);


/* 문제 2번 */

function coffeeRefill(first){
    var frst = first;
    var max=0;

    max = frst*(2/3);
    max += max*(2/3);
    console.log(max+frst);
}

/* 응용 1번 */

</script>
</body>
</html>


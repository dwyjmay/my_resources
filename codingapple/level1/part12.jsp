<%--
  Created by IntelliJ IDEA.
  User: efusioni
  Date: 2022-04-27
  Time: 오전 10:49
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

<form id="formBox">
    <input type="text" id="number">
    <input type="text" id="number2">
    <a href="javascript:;" id="go">확인</a>
</form>

<script>
    /* 369게임 1단계: 3의배수에서 박수 */
    function gamePlay(num){
        if(num%3==0){
            console.log('박수');
        }else{
            console.log('통과');
        }
    }

    /* 369게임 단계 3의배수 박수 한번, 9의배수 박수 두번 */
    function gamePlay2(num){
        if(num%9==0){
            console.log('박수박수');
        }else if((num%3==0) ){
            console.log('박수');
        }else{
            console.log('통과');
        }
    }

    /* 두 개의 점수 총합 : 합/불 */
    function result(score1, score2){
        if( (score1 <=40) || (score2 <= 40)){
            console.log('과락으로  불합격');
        } else if( (score1 + score2) >= 120){

            console.log('합격!')
        } else{
            console.log('불합격!');
        }
    }

    /* 1의자리 숫자가 3, 6, 9 일 때 박수 */
    function gamePlay3(num){
        var nmbr = num%10;
        if((nmbr == 3) || (nmbr == 6) || (nmbr == 9)){
            console.log('박수');
        }

    }

    /*  result()에서   입력한 점수가 0 미만, 100초과일 때 알럿 기능 추가 */

    function result2(score1, score2){
        if(( score1<0 || score1>100 )||( score2<0 || score2>100 )){
            alert('no 장난');

        } else if( (score1 <=40) || (score2 <= 40)){
            console.log('과락으로  불합격');
        } else if( (score1 + score2) >= 120){

            console.log('합격!')
        } else{
            console.log('불합격!');
        }
    }

    document.getElementById('go').addEventListener('click',function(){
        var num = document.getElementById('number').value*1;
        var num2 = document.getElementById('number2').value*1;
        result(num,num2);
    })
</script>
</body>
</html>


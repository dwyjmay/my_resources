<%--
  Created by IntelliJ IDEA.
  User: efusioni
  Date: 2022-04-12
  Time: 오전 10:50
  To change this template use File | Settings | File Templates.

  $(function(){
            var searchStr = '문화';
            $(".test:contains('"+searchStr+"')").each(function(){
                var regex=new RegExp(searchStr,'gi');
                $(this).html($(this).text().replace(regex,"<mark>"+searchStr+"</mark>"));
            })
        })
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <c:import url="/include/head.jsp" />
    <script>
        $(function(){
            var searchStr = 'you'; //찾고싶은 단어
            var regex=new RegExp(searchStr,'gi');
            var orgStr = $('.test').html(); // 기존의 html
            findText();

            function findText(){
                if(orgStr.match(regex)){ //페이지 내 일치하는 것이 있을 경우
                    console.log(orgStr.match(regex))
                    var test=orgStr.match(regex).length; //일치되는 곳의 개수
                    var txtCont = orgStr.split(searchStr);
                    console.log(txtCont)
                    var arr = [];

                    for(i=0; i<test;i++){
                        arr[i]=txtCont[i].replace(txtCont[i].substr(-1), txtCont[i].substr(-1)+"<mark>"+searchStr+" </mark>");

                    }
                    arr.push(txtCont[txtCont.length-1])
                    $('.test').html(arr)
                }
                else{
                    alert('no results');
                }
            }
        })
    </script>
    <style>
        mark{background-color:cornflowerblue; color:#fff;}
    </style>
</head>
<body>
<main>
    <section class="section">
        <h1>페이지 내 특정 문자열을 찾아 하이라이트 표시하는 방법</h1>
        <article class="explanation">
            <div class="test">Hi, I am.. you. Are you happy now? Have you been experienced variety things thant you wished only in your head? I hope you are now in a company that pay you reasonable salary and have many wise co-workers.
                As I write this, I am little depressed. I want find something make myself happy
            </div>
        </article>
    </section>
</main>
</body>
</html>


<%--
  Created by IntelliJ IDEA.
  User: efusioni
  Date: 2022-08-02
  Time: 오후 3:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <c:import url="/include/head.jsp" />
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <style>
        #sizeSelect.hide{display:none;}
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
    <select class="form-select mt-2 hide" id="sizeSelect">
        <option value="">95</option>
        <option value="">100</option>
    </select>
</form>
<div id="test"></div>
<script>
    document.querySelectorAll('.form-select')[0].addEventListener('input',function(e){
        if(e.currentTarget.options[e.currentTarget.selectedIndex].text=='바지'){
            var opt1 = document.createElement('option');
            opt1.innerHTML = 28;
            var opt2 = document.createElement('option');
            opt2.innerHTML = 30;
            document.querySelector('#sizeSelect').classList.remove('hide');
            document.querySelector('#sizeSelect').innerHTML='';
            document.querySelector('#sizeSelect').appendChild(opt1);
            document.querySelector('#sizeSelect').appendChild(opt2);
        } else if(e.currentTarget.options[e.currentTarget.selectedIndex].text=='셔츠') {
            var opt1 = document.createElement('option');
            opt1.innerHTML = 95;
            var opt2 = document.createElement('option');
            opt2.innerHTML = 100;
            document.querySelector('#sizeSelect').classList.remove('hide');
            document.querySelector('#sizeSelect').innerHTML = '';
            document.querySelector('#sizeSelect').insertAdjacentElement('beforeend',opt1)
            document.querySelector('#sizeSelect').insertAdjacentElement('beforeend',opt2)
        }
    })

    /* 방법 1 */
    /*
    var a = document.createElement('p')
    a.innerHTML = '안녕'
    document.querySelector('#test').appendChild(a);
    */

    /* 방법 2 */
    var b = '<p>안녕하세요</p>';
    document.querySelector('#test').insertAdjacentHTML('beforeend',b)
    //insertAdjacentHTML  : 문자형 HTML 추가해주는 함수
    //jQuery -> append(b)  추가!해주는것
    //BEFOREEND : 안쪽 맨 밑
    var c =document.createElement('p');
    c.innerHTML = 'hiiiiii';
    document.querySelector('#test').insertAdjacentElement('beforeend',c);
    //insertAdjacentElement : 요소를 추가해주는 함수

    /* 성능에 관하여 */
    //.createElement() 더 빠름
    //.insertAdjacentHTML(); , appendChild()
</script>
</body>
</html>


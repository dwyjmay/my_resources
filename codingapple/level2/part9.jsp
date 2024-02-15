<%--
  Created by IntelliJ IDEA.
  User: efusioni
  Date: 2022-08-01
  Time: 오전 11:19
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
        ul.list {
            list-style-type: none;
            margin: 0;
            padding: 0;
            border-bottom: 1px solid #ccc;
        }
        ul.list::after {
            content: '';
            display: block;
            clear: both;
        }
        .tab-button {
            display: block;
            padding: 10px 20px 10px 20px;
            float: left;
            margin-right: -1px;
            margin-bottom: -1px;
            color: grey;
            text-decoration: none;
            cursor: pointer;
        }
        .orange {
            border-top: 2px solid orange;
            border-right: 1px solid #ccc;
            border-bottom: 1px solid white;
            border-left: 1px solid #ccc;
            color: black;
            margin-top: -2px;
        }
        .tab-content {
            display: none;
            padding: 10px;
        }
        .show {
            display: block;
        }
    </style>
</head>
<body>
<%--
html태그에 몰래 정보숨기기 가능!
속성 data-자료이름 = "값"
숨김자료 출력은 셀렉터.dataset.자료이름
console.log(document.querySelector('.tab-button').dataset.id);

--%>
<div class="container mt-5">
    <ul class="list">
        <li class="tab-button" data-id="0">Products</li>
        <li class="tab-button orange" data-id="1">Information</li>
        <li class="tab-button" data-id="2">Shipping</li>
        <li class="tab-button" data-id="3" >gg</li>
    </ul>
    <div class="tab-content">
        <p>상품설명입니다. Product</p>
    </div>
    <div class="tab-content show">
        <p>스펙설명입니다. Information</p>
    </div>
    <div class="tab-content">
        <p>배송정보입니다. Shipping</p>
    </div>
    <div class="tab-content">
        <p>새로운 영역입니다</p>
    </div>
</div>
<script>
    var btn = document.querySelectorAll('.tab-button');
    var content = document.querySelectorAll('.tab-content');

    //part7.jsp 에서  클릭동작을 함수로 빼보기
 /*   for(let i = 0; i < document.querySelectorAll('.tab-button').length; i++){  /!* var i  아니고 let i 로 해주기!!!!!!!!!!!! *!/
        btn[i].addEventListener('click',function(){
            showTab(i);
        })
    }
    function showTab(num){
        btn.forEach(function(userItem){
            userItem.classList.remove('orange');
        })
        content.forEach(function(userItem){
            userItem.classList.remove('show');
        })
        btn[num].classList.add('orange');
        content[num].classList.add('show');
    }
*/
    //다른 방식으로 탭 기능 만들어보기 (이벤트 리스너 1개만 쓰기)   (이벤트리스너 쓸 때마다 ram 용량을 차지하기 때문 !! for 성능적 이점)
    // 이벤트 버블링을 알고 있으면 이벤트 리스너 많이 필요 x
    /*document.querySelector('.list').addEventListener('click',function(e){
        if(e.target == document.querySelectorAll('.tab-button')[0]){
            showTab(0);
        } else if(e.target == document.querySelectorAll('.tab-button')[1]){
            showTab(1);
        } else if(e.target == document.querySelectorAll('.tab-button')[2]){
            showTab(2);
        } else if(e.target == document.querySelectorAll('.tab-button')[3]){
            showTab(3);
        }
    })*/



    //data-set 사용하기!
   document.querySelector('.list').addEventListener('click',function(e){
       /*e.target.dataset.id 는 문자로 나올 수 있음
       * 숫자로 변환 필요!
       * */
       showTab(e.target.dataset.id)
    })

    function showTab(num){
        btn.forEach(function(userItem){
            userItem.classList.remove('orange');
        })
        content.forEach(function(userItem){
            userItem.classList.remove('show');
        })
        btn[num].classList.add('orange');
        content[num].classList.add('show');
    }

</script>
</body>
</html>
<%--
  Created by IntelliJ IDEA.
  User: efusioni
  Date: 2022-09-28
  Time: 오후 5:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<div class="quiz">
    <h4>가장 맛있는 야식은</h4>
    <button>치킨</button>
    <button>라면</button>
    <button>떡볶이</button>
    <button>피자</button>
</div>

<script>
   /* let value = 1;
    switch (value) {
        case 1 :
            alert('변수는 1입니다');
            break;

        case 4:
            alert('변수는 4 입니다');
            break;
        default :
            alert();
            break;
    }*/



    document.querySelector('.quiz').addEventListener('click',function(e){
        switch (e.target.innerHTML) {
            case '치킨' : {
                alert('치킨을 고른 당신!')
                break;
            }

            case '라면' : {
                alert('라면을 고른 당신!');
                break;
            }

            default : {
                alert('치킨과 라면을 골라주세요')
                break;
            }

        }

    })

</script>
</body>
</html>

<%--
  Created by IntelliJ IDEA.
  User: efusioni
  Date: 2022-06-21
  Time: 오후 4:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <c:import url="/include/head.jsp" />
    <script>
        $(function(){
            $.ajax({
                type:"GET",
                url:"/cookie/closeToday/popup.jsp",
                dataType:'html',
                success:function(data){
                    $('.wrapper').prepend(data);
                }
            })
        })
    </script>
</head>
<body>

<div class="wrapper"></div>


</body>
</html>


<%--
  Created by IntelliJ IDEA.
  User: efusioni
  Date: 2022-04-12
  Time: 오전 10:50
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
                url:"emmet.html",
                dataType:'html',
                success:function(data){
                    $('.test').prepend(data);
                }
            })
        })

/*
        $(function() {
            $.ajax ({
                type : "GET",
                url : "./popup.html",
                dataType : 'html',
                beforeSend: function() {
                },
                complete: function() {
                },
                success : function(data) {
                    $('.popupLayer').prepend(data);
                }
            });

        })*/
    </script>
</head>
<body>

<div class="test">

</div>

</body>
</html>


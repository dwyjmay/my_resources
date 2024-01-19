<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="/static/js/jquery-3.6.4.min.js"></script>
<script src="/static/js/gsap.min.js"></script>
<script src="/static/js/ScrollTrigger.min.js"></script>
<script src="/static/js/common.js"></script>
<link rel="stylesheet" href="/static/css/common.css">

<script>
    $(function(){
        let mainTitle = '<c:out value="${mainTitle}" default="" />';

        if (mainTitle!==''){
            document.title = mainTitle;
        }
    })
</script>
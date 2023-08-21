<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <jsp:include page="/include/head.jsp"/>
    <link rel="stylesheet" href="example.css">
    <title>흘러가는 이미지 또는 텍스트</title>
</head>
<body>
<section class="head_area">
    <ul class="slide_img">
        <li>
            <div>
                <span><img src="https://dummyimage.com/780x780/144835/fff.jpg" alt=""></span>
                <span><img src="https://dummyimage.com/780x780/144835/fff.jpg" alt=""></span>
            </div>
        </li>
        <li class="text_type">
            <div>
                <span>그대생일 그대에게 선물했던 모든 의미를!!</span>
                <span>술취한밤 그대에게 고백했던 모든 일들을!</span>
            </div>
        </li>
        <li class="reverse">
            <!-- [dev] img B , img A -->
            <div>
                <span><img src="https://dummyimage.com/780x780/000000/fff.jpg" alt=""></span>
                <span><img src="https://dummyimage.com/780x780/111111/fff.jpg" alt=""></span>
            </div>
        </li>
    </ul>
</section>
<script>
    elementCopy()
    function elementCopy(){
        $('section li').each(function(index,item){
            let copyTag = $(item).find('div').html();
            let copyNum = Math.ceil(screen.width / $(item).outerWidth()) + 1;
            for(let i = 0; i<copyNum; i++){
                $(item).find('div').append(copyTag);
            }
            let copyTag2 = $(item).html();
            $(item).append(copyTag2);

            if($(item).hasClass('text_type')){
                $(item).find('span:odd').css('width',$('section li.text_type').find('span').eq(0).innerWidth())
                $(item).find('span:even').css('width',$('section li.text_type').find('span').eq(1).innerWidth())
            }
        })
    }
    $(function(){
        $('section li.text_type').find('span').eq(0).innerWidth()
        $('section li.text_type').find('span').eq(1).innerWidth()
    })

    gsap.to('.head_area',{
        scrollTrigger : {
            trigger:'.slide_img',
            start : "bottom 400px",
            markers:true,
            onEnter:()=>document.querySelector('.head_area').classList.add('off'),
            onLeaveBack:()=>document.querySelector('.head_area').classList.remove('off')
        },
    })
    
</script>
</body>
</html>
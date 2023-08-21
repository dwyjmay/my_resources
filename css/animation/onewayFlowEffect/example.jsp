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
<section class="head_area2">
    <p class="slideText">
        <span>
            <em aria-hidden="true">PRINT BAKERY</em>
        </span>
    </p>
    <p class="slideText reverse">
        <span>
            <em aria-hidden="true">BEANPOLE COLLABORATION</em>
        </span>
    </p>
</section>
<script>
    elementCopy()

    elementCopy2()
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

    function elementCopy2(){
        $('.slideText').each(function(index,item){
            let copyTag = $(item).find('span').html();
            let copyNum = Math.ceil( screen.width / $(item).outerWidth()) + 4;
            for(let i = 0 ; i < copyNum; i++){
                $(item).find('span').append(copyTag);
            }
            let copyTag2 = $(item).html();
            $(item).append(copyTag2);
        })

        let getWidth = $('.slideText').not('.reverse').find('span').eq(0).innerWidth();

        let standardDuration = parseInt($('.slideText.reverse').find('span').css('animation-duration').replace("s",""));
        let standardWidth = $('.slideText.reverse').find('span').innerWidth();
        let getSec = (getWidth / (standardWidth / standardDuration));
        $('.slideText').not('.reverse').find('span').eq(0).css('animation','loop '+getSec+'s -'+(getSec/2)+'s linear infinite');
        $('.slideText').not('.reverse').find('span').eq(1).css('animation','loop2 '+(getSec)+'s linear infinite');

        /*$('.slideText').not('.reverse').find('span').eq(0).css('animation',`loop ${getSec}s -${getSec/2}s linear infinite`)
        $('.slideText').not('.reverse').find('span').eq(1).css('animation',`loop2 ${getSec}s linear infinite`)*/
    }
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
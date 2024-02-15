<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <c:import url="/include/head.jsp" />
    <link rel="stylesheet" href="contents.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Bootstrap CSS -->
    <style>
        .slide-container{width: 400vw;  transition: all 1s;}
        .slide-box{width: 100vw; float: left;}
    </style>
</head>
<body>

<div class="oh">
    <div class="slide-container">
        <div class="slide-box on"><img src="image/car1.png" alt="" draggable="false"></div>
        <div class="slide-box"><img src="image/car2.png" alt="" draggable="false"></div>
        <div class="slide-box"><img src="image/car3.png" alt="" draggable="false"></div>
        <div class="slide-box"><img src="image/car2.png" alt="" draggable="false"></div>
    </div>
</div>
<button class="slideBtn" id="btnPrev">이전</button>
<button class="slideNum" id="btn-1">1</button>
<button class="slideNum" id="btn-2">2</button>
<button class="slideNum" id="btn-3">3</button>
<button class="slideNum" id="btn-4">4</button>
<button class="slideBtn" id="btnNext">다음</button>

<script>
    let btn = document.querySelectorAll('.slideNum');
    /* 슬라이드 동작 */
    function moveSlide(ele, ind){
        var tx = (-100)*ind;
        document.querySelector('.slide-container').style.transform='translateX('+tx+'vw)';
        document.querySelectorAll('.slide-box').forEach(function(userItem){
            userItem.classList.remove('on');
        })
        document.querySelectorAll('.slide-box')[ind].classList.add('on');
    }

    /* 숫자버튼으로 이동 */
    btn.forEach(function(item, index){
        btn[index].addEventListener('click',function(){
            moveSlide(this,index);
        })
    })

    /* 이전버튼 클릭 시 */
    document.querySelector('#btnNext').addEventListener('click',function(){
        var elem = document.querySelector('.slide-box.on');
        var total_n = elem.parentNode.childElementCount;
        var i =0;
        while((elem = elem.previousElementSibling) != null){
            i++
        }
        if(i+1 === total_n) i =-1;
        moveSlide(elem,(i+1));
    })

    /* 다음버튼 클릭 시 */
    document.querySelector('#btnPrev').addEventListener('click',function(){
        var elem = document.querySelector('.slide-box.on');
        var total_n = elem.parentNode.childElementCount;
        var i =0;
        while((elem = elem.previousElementSibling) != null){
            i++
        }
        if(i === 0)i = total_n;
        moveSlide(elem,(i-1));
    })

    /*/////////////////////////////////////////////////////////////////////////////*/


    /* mouseup, mousedown, click , mousemove 이벤트 */

    //기능 1 .  내가 드래그한 거리만큼 박스도 왼쪽으로 움직이게 함!
    let startPos;
    let distance;
    var mouseControl = false;
    var slideControl ;
    let test;
    var ele = document.querySelectorAll('.slide-box');

    ele.forEach(function(item,index){
        ele[index].addEventListener('mousedown',function(e){
            mouseControl=true;
            if(mouseControl){
                startPos = e.clientX; // e.clientX를 쓰면   해당 영역 안에서 x좌표를 구할 수 있다  e. clientY 도 당연히 됨!
                console.log(`startPos : \${startPos}`);
                test = Math.floor($('.slide-container').css('transform').split(',')[4]);
            }
        })

        ele[index].addEventListener('mousemove',function(e){
            if(mouseControl){
                distance = e.clientX - startPos;
                if (((index == 0) && (distance > 0)) || ((index == ele.length-1) && (distance < 0))) {
                    slideControl=false;
                } else{
                    slideControl=true;
                }

                if(slideControl){
                    if((!isNaN(test)) && (index!=0)){
                        $('.slide-container').css('transform','translateX('+(test+distance)+'px)');
                    } else{
                        $('.slide-container').css('transform','translateX('+(distance)+'px)');
                    }
                }
            }
        })

        ele[index].addEventListener('mouseup',function(e){
            mouseControl=false;
            if(slideControl){
                $('.slide-container').css('transition','0.5s all')
                if(!mouseControl){
                    if(distance<0){
                        distance=-distance;
                        if(distance > 300){
                            document.querySelector('#btnNext').click();
                        }else{
                            moveSlide(this,index);
                        }
                    }else{
                        if(distance > 300){
                            document.querySelector('#btnPrev').click();
                        }else{
                            moveSlide(this,index);
                        }
                    }
                }

                setTimeout(()=>{
                    $('.slide-container').css('transition','none')
                },500);
            }
        })
    })

    /*

    /!*  첫 번째 슬라이드에 대해서만 먼저 적용시켜보기  *!/
    //마우스를 클릭했을 때 동작
    document.querySelectorAll('.slide-box')[0].addEventListener('mousedown',function(e){
        mouseControl=true;
        if(mouseControl){
            startPos = e.clientX; // e.clientX를 쓰면   해당 영역 안에서 x좌표를 구할 수 있다  e.clientY 도 당연히 됨!
            console.log(`startPos : \${startPos}`);
        }
    })

    // 클릭 후 마우스를 이동시킬 때 동작
    document.querySelectorAll('.slide-box')[0].addEventListener('mousemove',function(e){
        if(mouseControl) {
            getDistance = parseInt(e.clientX)- parseInt(startPos);
            console.log(`distance is \${getDistance}`);
            $('.slide-container').css('transform',`translateX(\${getDistance}px)`)
        }
    })

    //마우스를 떼었을 때 동작
    document.querySelectorAll('.slide-box')[0].addEventListener('mouseup',function(e){
        mouseControl=false;
        if(!mouseControl){
            if(getDistance<0){
                getDistance=-getDistance;
                if(getDistance > 120){
                    document.querySelector('#btnNext').click();
                }else{
                    $('.slide-container').css('transform','translateX(0px)')
                }
            }else{
                if(getDistance > 120){
                    document.querySelector('#btnPrev').click();
                }else{
                    $('.slide-container').css('transform','translateX(0px)')
                }
            }

        }
    })

    /!* 똑같은 이벤트를 모바일환경에 적용시키려면
    * mousedown → touchstart,
    * mousemove → touchmove,
    * mouseup → touchend  이벤트로 바꾸어주고
    * touchstart와 touchmove에서는 e.clientX → e.touches[0].clientX
    * touchend에서는 e.clientX → e.changedTouches[0].clientX로 표시해여야 한다.
    *
    * touch이벤트와 mouse이벤트를 한꺼번에 쓸 수 있는 hammer.js 라이브러리 쓰면 편함 ..!
    * 장점1. 브라우저간 호환성 잡아준다.
    * 장점2. 이벤트리스너 6개아니고 1개만 필요하다.
    * 장점3. 스와이프, pinch, rotate 이벤트 리스너도 제공한다.
    * *!/

    //for모바일환경
    document.querySelectorAll('.slide-box')[0].addEventListener('touchstart',function(e){
        mouseControl=true;
        if(mouseControl){
            startPos = e.touches[0].clientX; // e.clientX를 쓰면   해당 영역 안에서 x좌표를 구할 수 있다  e.clientY 도 당연히 됨!
            console.log(`startPos : \${startPos}`);
        }
    })
    document.querySelectorAll('.slide-box')[0].addEventListener('touchmove',function(e){
        if(mouseControl) {
            getDistance = parseInt(e.touches[0].clientX)- parseInt(startPos);
            console.log(`distance is \${getDistance}`);
            $('.slide-container').css('transform',`translateX(\${getDistance}px)`)
        }
    })
    document.querySelectorAll('.slide-box')[0].addEventListener('touchend',function(e){
        mouseControl=false;
        if(!mouseControl){
            if(getDistance<0){
                getDistance=-getDistance;
                if(getDistance > 120){
                    document.querySelector('#btnNext').click();
                }else{
                    $('.slide-container').css('transform','translateX(0px)')
                }
            }else{
                if(getDistance > 120){
                    document.querySelector('#btnPrev').click();
                }else{
                    $('.slide-container').css('transition','all 0.5s').css('transform','translateX(0px)')
                }
            }

            setTimeout(()=>{
                $('.slide-container').css('transition','none')
            },500);

        }
    })*/
</script>
</body>
</html>
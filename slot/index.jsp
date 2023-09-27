<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <c:import url="/include/head.jsp" />
  <script type="text/javascript">
    var isClicked = false;
    var cnt = 0;

    function slotControl() {
      if (!isClicked) {
        var slot1 = setInterval(chgSet, 75, '#slot1');
        var slot2 = setInterval(chgSet, 75, '#slot2');
        var slot3 = setInterval(chgSet, 75, '#slot3');
        var bgChange = setInterval(chgBg, 300);

        setTimeout(function() {

          setTimeout(function() {
            clearInterval(slot1);
          })
          setTimeout(function() {
            clearInterval(slot2);
          }, 1000)
          setTimeout(function() {
            clearInterval(slot3);
            clearInterval(bgChange);
            setInterval(doneBg, 400);
          }, 2000)
        }, 2000)  /* 2000ms 후  1초 간격으로 slot1,  slot2,  slot3 과 bgChange(불 돌아가며 깜박이는 효과) 종료
                      slot3종료와 동시에   doneBg(전체 불 on/off 효과 ) 실행
                      */

        isClicked = !isClicked; /* start 버튼 클릭이 한 번만 가능하도록*/
      }
    }

    function chgSet(tg){
      var route= './images/slot'
      const rand_1to4 = Math.floor(Math.random() * 4) + 1;  /* 슬롯 별 이미지 개수 = 4 */
      var chgSrc = route + rand_1to4 + '.png';              /* 이미지 src 랜덤 변경*/
      $(tg).find('img').attr('src',chgSrc);
    }


    /* 전체 불 on/off 효과 */
    function doneBg(){
      cnt ++;
      if(cnt < 6){ /* 깜박임 3번 x 2 = 6 */
        if(!$('.slotCont').hasClass('done')){
          $('.slotCont .bg').hide();
          $('.slotCont').addClass('done');
        }else{
          $('.slotCont .bg').hide();
          $('.slotCont #bg33').show();
          $('.slotCont').removeClass('done');
        }
      }
      else{
        clearInterval(doneBg);
      }
    }

    function chgBg(){ /* 불 돌아가며 깜박이는 효과 */
      if(! $('.slotCont #bg11').hasClass('on')){
        $('.slotCont #bg11').show();
        $('.slotCont #bg22').hide();
        $('.slotCont #bg11').addClass('on');
      }else{
        $('.slotCont #bg11').hide();
        $('.slotCont #bg22').show();
        $('.slotCont #bg11').removeClass('on');
      }
    }

  </script>
  <style>
    *{box-sizing: border-box; padding:0; margin:0;}
    .slotCont{max-width:640px; background:url(images/light_full.jpg) no-repeat; background-size: 100%; overflow: hidden;}
    .slotCont #bg11{position: absolute; top:0; display: none;}
    .slotCont #bg22{position: absolute; top:0; display: none;}
    .slotCont #bg33{position: absolute; top:0; display: none;}
    .slotCont:before{content: ''; display:block; padding-top:80%;}
    .slotCont .content{position:absolute; top:22%; left:50%; transform: translateX(-50%); width:78%; font-size: 0;}
    .slotCont .content .slot{display: inline-block; width:33.33%; text-align: center;}
    .slotCont .btn{width:40%; margin: 11% auto 0; text-align: center; filter:drop-shadow(3px 3px 3px #444)}
    .btn:active{transform: translate(1px,1px); filter:drop-shadow(0 0 0 );}
  </style>
</head>
<body>
<div class="slotCont pr">
  <p class="bg" id="bg11"><img src="images/light_half1.jpg" alt=""></p>
  <p class="bg" id="bg22"><img src="images/light_half2.jpg" alt=""></p>
  <p class="bg" id="bg33"><img src="images/light_off.jpg" alt=""></p>
  <div class="content">
    <div class="slot" id='slot1'>
      <img src="images/slot1.png" alt="">
    </div>
    <div class="slot" id='slot2'>
      <img src="images/slot2.png" alt="">
    </div>
    <div class="slot" id='slot3'>
      <img src="images/slot3.png" alt="">
    </div>
    <p class="btn"><a href="javascript:;" onclick="slotControl();"><img src="images/startBtn2.png" alt="시작"></a></p>
  </div>
</div> <!-- //slotCont -->
</body>
</html>
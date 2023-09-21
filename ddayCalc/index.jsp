<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <c:import url="/include/head.jsp" />
    <script>
        var dday = new Date("Sep 21,2023,14:26:30").getTime(); // 특정일 지정

        function ddaySetting(target){
            setInterval(()=>{
                let today = new Date(); //현재 날짜
                let curToDday = dday-today;
                const getTimer = calc(curToDday);

                if (curToDday < 0 ){
                    /*dday += (604800000); // 7일 = 604800000ms , 1일 = 86400000*/
                    $('#typeA  span').hide();
                    $('#typeA .content').html('기간이 종료되었습니다.')

                } else{
                    getTimer[3] = getTimer[3] < 10 ? '0' + getTimer[3] : getTimer[3];
                    $(target).find('.day').html("Days : "+getTimer[0]);
                    $(target).find('.hours').html(', Hours : '+getTimer[1]);
                    $(target).find('.minutes').html(', Minutes : '+getTimer[2]);
                    $(target).find('.second').html(', Second : '+getTimer[3]);
                }
            },1000)
        }
        ddaySetting('#typeA');



        function period() {
            let periodDday = new Date("Sep 21,2023,00:00:00").getTime(); // 특정일 지정
            let periodToday = new Date(); //현재 시간 가져오기
            let periodDistance = periodDday - periodToday; //  양수 => 기간 남음, 음수 => 기간 지남

            let intoDays = periodDistance / (1000 * 60 * 60 * 24); //
            let calcWeek;
            let corresText;


            /******페이지 처음 진입 시 *******/

            if(periodDistance < 0 ){
                intoDays = -intoDays
                corresText='일 지남'
                if(intoDays % 7 > 0) {
                    console.log(intoDays/7)
                    calcWeek = Math.floor((intoDays / 7 )) + 1;
                } else{
                    calcWeek = (intoDays / 7);
                }
                /* 1주 = 604800 초  = 604800*1000 밀리초*/
                periodDday += 604800000 * calcWeek;
                periodDistance = periodDday - periodToday;
            } else{
                corresText='일 남음'
            }
            setTimeout(()=>{
                console.log(new Date(periodDistance))
                const timer = calc(periodDistance);
                console.log(timer)
                timer[3] = timer[3] < 10 ? '0' + timer[3] : timer[3];
                $('#typeB .day').html("Days : "+timer[0]);
                $('#typeB .hours').html(', Hours : '+timer[1]);
                $('#typeB .minutes').html(', Minutes : '+timer[2]);
                $('#typeB .second').html(', Second : '+timer[3]);
            },100)
            console.log(Math.floor(intoDays)+corresText)


            /*********페이지 접속 중 만료 되었을 경우 ↓ ***********/

            setInterval(()=>{
                const realTime = new Date();

                let realTimeDistance = periodDday - realTime
                if (realTimeDistance < 0 ){
                    realTimeDistance += 604800000;
                }

                const newTimer = calc(realTimeDistance)
                newTimer[3] = newTimer[3] < 10 ? '0' + newTimer[3] : newTimer[3];
                $('#typeB .day').html("Days : "+newTimer[0]);
                $('#typeB .hours').html(', Hours : '+newTimer[1]);
                $('#typeB .minutes').html(', Minutes : '+newTimer[2]);
                $('#typeB .second').html(', Second : '+newTimer[3]);

            },1000)
        }

        function calc(distance){
            let d= Math.floor(distance / (1000 * 60 * 60 * 24));
            let h= Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
            let m= Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
            let s= Math.floor((distance % (1000 * 60)) / 1000);

            return [d,h,m,s];
        }

        period()

    </script>
</head>
<body>
<main>
    <section class="section" id="typeA">
        <h1>특정일 지정 후 만료</h1>
        <div class="content">
            <span class="day"></span>
            <span class="hours"></span>
            <span class="minutes"></span>
            <span class="second"></span>
        </div>
    </section>
    <section class="section" id="typeB">
        <h1>특정일 지정 후 새로 갱신</h1>
        <div class="content">
            <span class="day"></span>
            <span class="hours"></span>
            <span class="minutes"></span>
            <span class="second"></span>
        </div>
    </section>
</main>
</body>
</html>


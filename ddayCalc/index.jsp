<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <c:import url="/include/head.jsp" />
    <script>
        var dday = new Date("Sep 20,2023,14:13:30").getTime(); // 특정일 지정

        function ddaySetting(target,setDday){
            setInterval(()=>{
                let today = new Date(); //현재 날짜
                let curToDday = setDday-today;

                let d= Math.floor(curToDday / (1000 * 60 * 60 * 24));
                let h= Math.floor((curToDday % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
                let m= Math.floor((curToDday % (1000 * 60 * 60)) / (1000 * 60));
                let s= Math.floor((curToDday % (1000 * 60)) / 1000);

                /* typeA에 한해서..! 다른 유형은 안 써도 됨 */
                if(target==='#typeA' && (curToDday < 0)){
                    //setDday += (604800000); // 7일 = 604800000ms , 1일 = 86400000
                    $('#typeA  span').hide();
                    $('#typeA .content').html('기간이 종료되었습니다.')
                }

                s = s < 10 ? '0' + s : s;
                $(target).find('.day').html("Days : "+d);
                $(target).find('.hours').html(', Hours : '+h);
                $(target).find('.minutes').html(', Minutes : '+m);
                $(target).find('.second').html(', Second : '+s);
            },1000)
        }

        function period(type) {
            let dday2 = new Date("Sep 20,2023,14:20:00").getTime(); // 특정일 지정
            let today = new Date(); //현재 날짜 가져오기
            let curToDday = dday2 - today;//  양수 => 기간 남음, 음수 => 기간 지남
            let calcDay = Math.floor(curToDday / (1000 * 60 * 60 * 24));
            console.log((-calcDay) + " 일 지남");

            //기간 지났을 경우, 지정일로부터 7일씩 갱신
            if (curToDday < 0) {
                calcDay = Math.floor((-calcDay / 7)); //지정한 특정일로부터 몇 주 지났는지
                //console.log(calcDay)
                dday2 += (604800000) * (calcDay); //carToDday가 양수가 될 때 까지,  지정 특정일로부터  지정한단위로 더해준다.
            }
            ddaySetting('#typeB',dday2);

            /* !!!!!!!!!!월별 주기!!!!!!!!!! */
                /*var now2=new Date(); //현재 날짜 가져오기
                var year= now2.getFullYear();
                var month= now2.getMonth()+1;
                var cycle=new Date(year,month,1).getDate(); //현재 월의 마지막 날
                console.log(year+": year", month+": month", cycle+":date");
                var dday = new Date(year,month,1);
                console.log(dday);*/
        }

        period('week')
        ddaySetting('#typeA',dday);
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


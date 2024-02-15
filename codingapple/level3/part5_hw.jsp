<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <c:import url="/include/head.jsp" />
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
<script>
    /* Question1 */
    var nameList = ['흥민','영희','철수','재석','철수'];
    function findName(name){
        /*nameList.forEach(function(item){
            if(name == item){
                console.log('있어요');
            }
        })*/

        /*forEach 에서 return 안 먹음*/
            // 이유 : forEach 메소드에 콜백 함수를 전달하였기 때문입니다. 전달된 콜백함수는 일반적인 함수처럼 동작하지만 루프를 진행하는데 있어 return 은 아무런 영향을 미치지 않습니다.
            // 아래는 공식 MDN 문서의 forEach에 관한 설명입니다. 예외를 발생시키는 경우를 제외하고는 forEach() 루프를 중단시킬 방법은 없다.만약 그러한 목적으로 forEach() 메소드를 사용하는것은 잘못된 방법이다.forEach 에 관한 설명에서도 알 수 있듯이 루프를 실행하는 도중에 중단시킬 필요가 있는 경우에는forEach 메소드는 적절하지 않다고 하네요.
            //forEach 메소드를 for 문처럼 각 요소를 순회하는 목적으로 사용할 시에 return, break, continue 등으로 루프를 제어 할 수 없다는 사실을 꼭 기억하시고 사용하시길 바랍니다.
            //[출처]https://blog.fakecoding.com/archives/js-foreach-loop-statement

        for(var i = 0; i<nameList.length; i++){
            if(name == nameList[i]){
                console.log('있습니다');
                return;
            }
        }
    }
    //findName('철수');

    /* Question2 */
   /* var dan = [2,3,4,5,6,7,8,9];
    for(var i =0; i<dan.length;i++){
        console.log(dan[i]+'단 시작!')
        for(var j = 0; j<9;j++){
            var result = dan[i]*(j+1);
            console.log(result)
        }
    }*/

    /* Question3 */

    var score = [10,20,30,40,50]
    var score2 = [40,40,40]

    function averageCalc(arr,latestScore){
        var sum = 0;
        arr.forEach(function(item){
            sum += item;
        })
        var average = sum/(arr.length);
        console.log("평균점수는 ",average);

        if(average >= latestScore){
            console.log('평균보다'+(average-latestScore)+'점 떨어졌네요');
        }else{
            console.log('평균보다'+(latestScore-average)+'점 올랐네요.')
        }
    }

    averageCalc(score,40);
    //averageCalc(score2,20);
</script>
</body>
</html>
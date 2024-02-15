<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <c:import url="/include/head.jsp" />
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
        .box{display:inline-block; background:#e5e5e5; padding:20px;  border-radius: 8px;}
        .box pre{white-space: pre; vertical-align: top;}
    </style>
</head>
<body>
<h3>javascriptES6 강의 PART 1_3 ~ 1_4</h3>
<h3>강의 듣기 전 자바스크립트 기본 문법 총 정리</h3>
<div class="box">
    forEach() 는 array하고만!!<br>
    [1,2,3,4].forEach(function(a){<br>
        //a는 차례대로 array 값 1부터 4까지 들어온다<br>
    })
</div>

<div class="box">
    <pre>var obj = {
        data : 'kim',
        함수 : function(){
            console.log(this);
            }
        }</pre>
    kim이라는 value를 꺼내고 싶을 때 obj.data 이런 식으로 쓰지만,<br>
    함수를 꺼낼 때에는 obj.함수()로 호출한다.

    오브젝트의 값을 꺼
</div> <br>
<button id="button1">버튼</button>
</body>
<script>

    /*
    * 'use strict'없이 x = 300; 실행하면 작동하지만 strict 모드를 실행하고 작성하면 오류 발생!!! var x= 300 으로 써야 함.
    * window : 자바스크립트 기본 함수들의 수납공간
    * */

    //'use strict';

    /* 경우1 : 바로출력 / 일반함수 내에서의 this  → window 출력 */
    //1) this
    console.log(this); // window {}

    //2) 일반 함수 내에서의 this → window / [strict 모드] → undefined
    function 함수() {console.log(this);} // window
    함수();

    /* 경우2 : 오브젝트 내에서의 this */
    //1) 오브젝트 내 함수(=메소드) 안에서의  this → 해당 메소드를 갖고 있는 / 실행하고 있는 오브젝트
    var obj = {
        data : 'kim',
        함수 : function(){
            console.log(this);
        }
    }
    obj.함수();   // obj ({data: 'kim', 함수: ƒ}) 출력 , kim이라는 value를 꺼내고 싶을 때는 obj.data 이런 식으로 쓰지만, 함수를 꺼낼 때에는 obj.함수()로 호출한다.

    //2) 오브젝트 안의 오브젝트 내에서의 this
    var obj2 = {
        data : {
            함수 : function(){
                console.log(this)
            }
        }
    }
    obj2.data.함수();     // obj2.data 출력

    //3) arrow function에서의 this
     var obj3 ={
        data : {
            함수 : ()=>{
                console.log(this);
            }
        }
    }
    obj3.data.함수();  //window 출력 , this  값을 함수 밖에 있던 것을 그대로 쓴다.(내 부모나 상위요소가 갖고있는 this)

    //4)objcet 안에 함수를 만들 때  왼쪽에 (기존 문법) 이름 : 함수 써도 되지만  (신문법) 함수(){} 로 써도 됨
    var obj4 ={
        data : {
            함수(){// 마치 function 함수(){}   에서 function이 생략된 것 처럼
                console.log(this);
            }
        }
    }
    obj4.data.함수(); //obj4.data 출력


    /* 경우 1 = 경우 2 */
    /*
    ∵ 스크립트에서 함수나 변수를 전역공간에서 생성할 때 window 라는 global object에 보관함.
        <%--<script> {} </script>--%>
        function 함수(){console.log(this)}
        결국은
        window  : {
            함수(){
                console.log(this)
            }
        }

        함수() 나  window.함수()나 같은 결과 보여 줌
    */

    /* 경우 3 : constructor (오브젝트 생성 기계) this*/

    function 기계(){
        this.이름 = 'kim' //object 새로 생성(instance)
    }

    var obj4 = new 기계();
    console.log(obj4);
    // 새로생성되는 오브젝트에  이름이라는 key 값에는 kim이라는 value 값을 할당해주세요.


   /* 경우 4  이벤트리스너에서의 this     e.currentTarget 출력 */

    document.getElementById('button1').addEventListener('click',function(e){
        this;    //   =    e.currentTarget;  this ④
        //console.log(this)
        //console.log(e.currentTarget) // 이벤트 동작하는 곳

        //첫번째 경우와 같음
        var arr = [1,2,3];
        arr.forEach(function(a){
            console.log(this);  //window // 일반함수에서 this를 쓴 경우가 됨
        })

    })

    var obj5 = {
        이름들 : ['김','이','박'],
        함수 : function(){
            obj5.이름들.forEach(function(){
                console.log(this)
            })
        }
    }
    obj5.함수(); //window


    var obj6 = {
        이름들 : ['김','이','최'],
        함수 : function(){
            console.log(this);
            obj5.이름들.forEach(()=>{
                console.log(this) // 경우3. 상위(외부)this 값을 그대로 사용
            })
        }
    }
    obj6.함수(); //obj6 출력
</script>
</html>



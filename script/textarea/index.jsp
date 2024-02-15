<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <c:import url="/include/head.jsp"/>
    <%--#byteCheck-section --%>
    <script>
        function updateChar(formName, length_limit, output) {
            var length = calculate_msglen(formName.value);
            output.innerText = length;

            if (length > length_limit) {
                alert("최대 " + length_limit + "byte만 등록하실수 있습니다.");
                formName.value = formName.value.replace(/\r\n$/, "");
                formName.value = assert_msglen(formName.value, length_limit, output);
            }
        }

        function calculate_msglen(message) {
            var nbytes = 0;

            for (var i = 0; i < message.length; i++) {
                var ch = message.charAt(i);
                if (escape(ch).length > 4) {
                    nbytes += 2;
                } else if (ch == '\n') {
                    if (message.charAt(i - 1) != '\r') {
                        nbytes += 1;
                    }
                } else if (ch == '<' || ch == '>') {
                    nbytes += 4;
                } else {
                    nbytes += 1;
                }
            }

            return nbytes;
        }

        function assert_msglen(message, maximum,output){
            var inc = 0;
            var nbytes = 0;
            var msg = "";
            var msglen = message.length;

            for(var i=0; i<msglen; i++){
                var ch = message.charAt(i);
                if(escape(ch).length > 4){
                    inc = 2;
                }else if(ch == '\n'){
                    if(message.charAt(i-1) != '\r'){
                        inc = 1;
                    }
                }else if(ch == '<' || ch == '>'){
                    inc = 4;
                }else{
                    inc = 1;
                }
                if((nbytes + inc) > maximum){
                    break;
                }
                nbytes += inc;
                msg += ch;
            }
            output.innerText = nbytes;
            return msg;
        }
    </script>
    <%--#placeholder-section--%>
    <script>
        $(function(){
            //숫자만 입력
            $("input:text[numberOnly]").on("keyup", function() {
                $(this).val($(this).val().replace(/[^0-9]/g,""));
            });
        })

        function checkSize(textArea,size){
            console.log($(textArea).val().length)
            if( $(textArea).val().length > size){
                $(textArea).val($(textArea).val().substring(0, size));
            }
        }
    </script>
</head>
<body>
<main>
    <section class="section" id="byteCheck-section">
        <h1>textarea에 입력된 문자열의 byte크기 확인</h1>
        <article class="explanation">
            <form  name="qnaForm" id="qnaForm" method="post" enctype="multipart/form-data">
                <p class="unit">
                    <span class="fl">* 글자수는 최대 80Byte 까지 등록 가능 합니다.</span>
                    <span class="fr" id="byteArea"><span id="textlimit">0</span>/80 Byte</span>
                </p>
                <textarea class="contact_txt" id="content" name="content" cols="105" rows="10" title="내용 입력" onkeyup="updateChar(qnaForm.content, 80, textlimit);"></textarea>
            </form>
        </article>
        <h1>약식</h1>
        <article class="explanation">
            <textarea name="" id="" cols="30" rows="10" onkeydown="checkSize(this,50)"></textarea>
        </article>
    </section>
    <section class="section" id="placeholder-section">
        <h1>placeholder</h1>
        <article class="explanation">
            <textarea name="notice" placeholder="줄바꿈 할거야 &#13;&#10; 이렇게" cols="30" rows="10"></textarea>
            <textarea placeholder="줄바꿈은 다음과 같은 캐릭터셋을 지정합니다. &#13;&#10;줄바꿈이 되었습니다."></textarea>
        </article>
    </section>
    <section class="section" id="placeholder-onfocus-section">
        <h1>placeholder-onfocus</h1>
        <article class="explanation">
            <!--textarea 줄바꿈 &#10; (placeholder 가능 )-->
            <textarea class="contact_txt" cols="105" rows="10" title="내용 입력"
                      onfocus="if(this.value == '* 글자수는 최대 4000Byte 까지 등록 가능 합니다. \n'+' * 개인정보보호를 위해 내용 입력란에는 개인정보를 입력하지 마시기 바랍니다.'){this.value = '';}">* 글자수는 최대 4000Byte 까지 등록 가능 합니다. &#10; * 개인정보보호를 위해 내용 입력란에는 개인정보를 입력하지 마시기 바랍니다.</textarea>
        </article>
    </section>
</main>
</body>
</html>


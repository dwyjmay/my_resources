<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script>


    function getCookie(NameCookie) {
        var i = document.cookie.indexOf(NameCookie + '=' );
        if(i!=-1){
            i += NameCookie.length + 1;
            NameEnd = document.cookie.indexOf(';', i);
            if(NameEnd==-1)
                NameEnd = document.cookie.length;
            return unescape(document.cookie.substring(i, NameEnd));
        }else
            return "";
    }

    function setCookie(NameCookie) {
        if($('#introCheck').is(':checked')){
            var todayDate = new Date();
            var name= NameCookie;
            var value="done";
            todayDate.setDate( todayDate.getDate() + 1 );
            document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + todayDate.toGMTString() + ";"
        }
    }

    if (  getCookie( "closeA" ) != "done" ) {
        $(function(){
            $(".popWrapper").show();
        })
    }
</script>
<style>
    .popWrapper{
        min-height: 400px; font-size: 20px;
    }
</style>
<div class="popWrapper" style="display: none;">
    팝업내용
    <p class="close">
        <input type="checkbox" id="introCheck"><label for="introCheck">오늘 하루 보지 않기</label>
        <a href="javascript:;" onclick="setCookie('closeA'); $('.popWrapper').hide();">X</a>
    </p>
</div>
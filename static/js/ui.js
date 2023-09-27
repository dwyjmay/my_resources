function wrapFix(state){
    if(state == "on"){
        $("body").css({
            "overflow" : "hidden"
        });
    } else if(state == "off"){
        $("body").css({
            "overflow" : "visible"
        });
    }
}


window.uiUx = {
    popupLayer:{
        popCount:1,
        open:function(url,name){
            let layerName = 'contents'+this.popCount
            this.popCount +=1; // popupLayer.open을 한번 더 불렀을때 popcount를 증가시키기 위해서.
            if(name){
                layerName = name;
            }

            const temp = `<div id = "layer--${layerName}" class="popupLayerWrapper">
                                    <div class="popupLayer">
                                        <div class="popupLayerFrame"><iframe src="${url}" width="100%" height="100%" class="layerFrame"></iframe></div>
                                        <button type="button" class="btnLayerClose" onclick="uiUx.popupLayer.close(this);"></button>
                                    </div>
                                </div>`;
            $('body').append(temp);
            setTimeout(function () {
                $("#layer--" + layerName).addClass("show");
            }, 100)
        },
        close:function(target){
            let $target = $(target).parents('.popupLayerWrapper')
            if(typeof target ==='string'){
                // 위의 기본 팝업의 닫기 버튼에서는 인수로 (this)를 보내는데, 특정 팝업을 닫고싶을 때는 해당 layerName의
                $target = $('#'+target);
            }

            if(!target){ // target을 지정하지 않았다면
                if($('.popupLayerWrapper').length > 0 ){  // 모든 .popupLayerWrapper
                    $target = $('.popupLayerWrapper');
                } else {
                    $target = parent.$('.popupLayerWrapper'); //혹은 parent document의 .popupLayerWrapper
                }
            }

            $target.fadeOut(200,()=>{
                //$(this).removeClass('show')
                console.log($(this))
                $target.remove();
            })
        }
    },
    afterFunction : function(before, after, time){
        const afterTime = time ? time : 100;
        before();
        setTimeout(function(){
            after();
        },afterTime);
    },
}

window.uiUtil=
    {
        scrollMove : function (obj,speed,easing,gap,afterFunc){
            if(speed == null || speed ===''){speed = 500;} // 기본 속도는 500ms
            if(easing == null || easing===''){easing='easeInOutQuint';}//
            if(gap == null || gap ===''){gap=0;}
            let offset = $(obj).offset();
            let topValue = offset.top;
            $('html,body').stop().animate({
                scrollTop : topValue - gap
            }, speed, easing, function(){
                if(afterFunc){
                    afterFunc();
                }
            })
        },
        chkAll : function(chkAll, chkList){
            let $chkAll = $(chkAll);
            let $chkList = $(chkList);
            let checkitemLength = $chkList.length;
            $chkAll.change(function () {
                let currentState = $(this).prop('checked');
                if (!currentState) {
                    $chkList.prop('checked', false);
                } else {
                    $chkList.prop('checked', true);
                }
            })
            $chkList.change(function(){
                let checkedLength = 0;
                $chkList.each(function(){
                    if($(this).is(':checked')){
                        checkedLength +=1;
                    }
                })
                if(checkitemLength > checkedLength){
                    //uiUtil.chkClear($chkAll)
                    $chkAll.prop('checked',false)
                }else{
                    $chkAll.prop('checked',true)
                }
            })
        },
        chkClear : function(obj){
            $(obj).prop('checked',false);
        }
        , setCookie : function setCookie( name, value, expiredays){
            if(expiredays == null || expiredays == ""){ expiredays = 1; };
            var todayDate = new Date();
            todayDate.setDate( todayDate.getDate() + expiredays );
            document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + todayDate.toGMTString() + ";";
        }

        ,getCookie : function getCookie( name ) {
            var nameOfCookie = name + "=";
            var x = 0;
            while( x <= document.cookie.length ){
                var y = (x+nameOfCookie.length);
                if ( document.cookie.substring( x, y ) == nameOfCookie ) {
                    if ( (endOfCookie=document.cookie.indexOf( ";", y )) == -1 )
                        endOfCookie = document.cookie.length;
                    return unescape( document.cookie.substring( y, endOfCookie ) );
                }
                x = document.cookie.indexOf( " ", x ) + 1;
                if ( x == 0 )  break;
            }// - while
            return "";
        }

        // arry : 이미지 경로가 들어간 배열 ex) arry["/images/a.jpg", "/images/b.jpg",
        // "/images/c.jpg"]
        /*
         * ,imgPreLoad : function imgPreLoad( arry ) { if (!arry) return; var arr =
         * new Array(); for(var i=0; i < arry.length; i++){ arr[i] = new Image();
         * arr[i].src = arry[i]; } }
         */
        ,imgPreLoad : function imgPreLoad( arry, callback ) {
            var count = arry.length;
            if(count === 0 && callback) {
                callback();
            }
            var loaded = 0;
            $(arry).each(function() {
                $('<img>').attr('src', this).load(function() {
                    loaded++;
                    if (loaded === count && callback) {
                        callback();
                    }
                });
            });
        }

        ,numberWithComma : function numberWithComma(x) {
            var x = String(x);
            return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
        }

        ,otherClickLayerHide : function otherClickLayerHide(obj){
            $(document).on("click keyup", function(e) {
                if($(obj).is(":visible")){
                    if(!($(e.target).parents(".otherClickHideArea").length)){
                        $(obj).hide();
                        $(document).off("click keyup");
                        wrapFix('off');
                    }
                }
            });
        }
    }

window.custom = {
    test : function(){
        console.log('로드가 잘 됩니다.')
    },
}

function setHeightIframe(height) {
    $(".layerFrame").css("height", height);
}

/* layer팝업 딤 창 클릭 시 팝업 닫힘 */
$(document).click(function(e){
    if ((e.target.classList.contains('popupLayerWrapper'))) {
        let $targetElement = e.target.children[0].querySelector('.btnLayerClose');
        uiUx.popupLayer.close($targetElement);
    }
    if ((e.target.classList.contains('spreadPopupLayer'))) {
        let $targetElement = e.target.children[0].querySelector('.btnLayerClose');
        $targetElement.click();
    }
})
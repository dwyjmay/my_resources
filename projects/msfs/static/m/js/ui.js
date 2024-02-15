if( window.console == undefined ){ console ={log:function(){}}};
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

function imageError(obj, width, height) {
    const $parent = $(obj).parent();

    $parent.html(`<div class="on-error-area" style="width:${width}; height:${height};"></div>`);
}

function handleScrap(seq, obj, isLogin) {
    console.log("m ui.js handle");
    if(isLogin){
        const likeYn = $(obj).hasClass("on") ? "N" : "Y";
        ef.post("/recipe/like", {"recipeSeq": seq, "likeYn": likeYn}, function (result) {
            if (result.succeed) $(obj).toggleClass("on");
        });
    }else{
        alert("로그인 후 이용해주세요.");
        return;
    }
}


function getQueryParam(param) {
    const urlParams = new URLSearchParams(window.location.search);
    return urlParams.get(param);
}

$(function(){
    const hideTopPages = ['login-page'];
    const pageClass = $("#wrapper").attr("class");
    if(!hideTopPages.includes(pageClass)){
        $(window).on("scroll", function(e){
            let scrollTop = $(this).scrollTop();
            const $pageTop = $("#btn-page-top");

            if(scrollTop > 200 ) {
                uiUx.afterFunction(
                    () => $pageTop.show(),
                    () => $pageTop.addClass("show")
                );
            } else {
                uiUx.afterFunction(
                    () => $pageTop.removeClass("show"),
                    () => $pageTop.hide()
                );
            }
        })
    }
    $("#btn-page-top").on("click", function(){
        $('html, body').animate({
            scrollTop:0
        }, 400);
    });
})

window.uiUx = {
    /*
    * layer popup
    * uiUx.popupLayer.open(url, name);"
    * uiUx.popupLayer.close(); open 되어 있는 레이어 팝업 전체 닫기
    * uiUx.popupLayer.close(name) name; open 되어 있는 특정 팝업만 닫기
    * */
    popupLayer : {
        popCount: 1,
        /*type : [default : center], full*/
        open: function (url, name, type) {
            let layerName = "contents" + this.popCount;
            let popType = type !== undefined ? type+'Type' : ''
            this.popCount += 1;
            if (name) {
                layerName = name;
            }
            const temp = '<div id="layer--' + layerName + '" class="popupLayerWrapper ' + popType + '">' +
                '    <div class="popupLayer">' +
                '        <div class="popupLayerFrame"><iframe src="' + url + '" width="100%" height="100%" class="layerFrame"></iframe></div>' +
                '        <button type="button" class="btnLayerClose" onclick="uiUx.popupLayer.close(this);"></button>' +
                '    </div>' +
                '</div>'
            $("body").append(temp);
            wrapFix('on');
            setTimeout(function () {
                $("#layer--" + layerName).addClass("show");
            }, 100)
        },
        close: function (target) {
            let $target = $(target).parents(".popupLayerWrapper")
            if (typeof target === 'string') {
                $target = $("#" + name);
            }
            if (!target) {
                if($('.popupLayerWrapper').length > 0){
                    $target = $('.popupLayerWrapper');
                } else {
                    $target = parent.$('.popupLayerWrapper');
                }
            }
            $target.fadeOut(200, function () {
                wrapFix('off');
                $(this).remove();
            })
        },
    },
    afterFunction : function(before, after, time){
        const afterTime = time ? time : 100;
        before();
        setTimeout(function(){
            after();
        },afterTime);
    },
    scrollActive : function(scrollTop, element, exceed, func){

    }
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

function setHeightIframe(height) {
    let iframeHeight = height ? height :'auto'
    $(".layerFrame").css({"height":iframeHeight});
}


window.uiUtil=
    {
        scorllMove : function scorllMove(obj, speed, easing, gap, afterFunc) {
            if(speed == null || speed == ""){ speed = 500; };
            if(easing == null || easing == ""){ easing = "easeInOutQuint"; };
            if(gap == null || gap == ""){ gap = 0; };
            var offset = $(obj).offset();
            var topValue = 0;
            if(offset.top != 0){
                topValue = offset.top;
            } else {
                topValue = offset.top;
            }
            $("html, body").stop().animate({
                scrollTop : topValue - gap
            },speed, easing, function(){
                if(afterFunc){
                    afterFunc();
                }
            });
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

        ,chkAll : function checkAll(all, chks){
            var $chkAll = $(all);
            var $chkOther = $(chks);
            $chkAll.change(function(){
                var chkAllState = $(this).prop("checked");
                $chkOther.prop("checked", chkAllState).change();
                if(chkAllState){
                    $chkOther.parent().addClass("on");
                } else {
                    $chkOther.parent().removeClass("on");
                }
            });
            $chkOther.change(function(){
                var chkVal = true;
                var allCheckState = true;
                $chkOther.each(function(){
                    if(!$(this).prop("checked")){
                        chkVal = false;
                    }
                });
                $chkOther.not(this).each(function(){
                    if(!$(this).prop("checked")){
                        allCheckState = false;
                    }
                });
                $chkAll.prop("checked", chkVal);
                if(chkVal) {
                    $chkAll.parent().addClass("on");
                } else {
                    $chkAll.parent().removeClass("on");
                    if(allCheckState) {
                        $chkOther.prop("checked", true);
                        $chkOther.parent().removeClass("on");
                        $(this).prop("checked", false);
                        $(this).parent().addClass("on");
                    }
                }
            });
        }

        ,chkClear : function chkClear(obj){
            $(obj).prop("checked", false);
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
    };


/*
 * var opt = { img: $('#userPic') };
 * $('#btnPicUpload').setPreview(opt);
 */

$.fn.setPreview = function(opt){
    var defaultOpt = {
        inputFile: $(this),
        img: null,
        w: 150,
        h: 150
    };
    $.extend(defaultOpt, opt);
    var previewImage = function(){
        if (!defaultOpt.inputFile || !defaultOpt.img) return;
        var inputFile = defaultOpt.inputFile.get(0);
        var img       = defaultOpt.img.get(0);

        // FileReader
        if (window.FileReader) {
            // image 파일만
            if (!inputFile.files[0].type.match(/image\//)) return;

            // preview
            try {
                var reader = new FileReader();
                reader.onload = function(e){
                    img.src = e.target.result;
                    if(opt.w) {
                        img.style.width  = defaultOpt.w+'px';
                    }
                    if(opt.h) {
                        img.style.height = defaultOpt.h+'px';
                    }
                    img.style.display = '';
                }
                reader.readAsDataURL(inputFile.files[0]);
            } catch (e) {
                console.log(e);
                // exception...
            }
            // img.filters (MSIE)
        } else if (img.filters) {
            defaultOpt.img.attr('src', '/images/common/blank.png');
            defaultOpt.img.attr('alt', '');
            inputFile.select();
            inputFile.blur();
            var imgSrc = document.selection.createRange().text;
            if(opt.w) {
                img.style.width  = defaultOpt.w+'px';
            }
            if(opt.h) {
                img.style.height = defaultOpt.h+'px';
            }

            // img.style.filter =
            // "progid:DXImageTransform.Microsoft.AlphaImageLoader(enable='true',sizingMethod='scale')";
            // img.filters("DXImageTransform.Microsoft.AlphaImageLoader").src =
            // imgSrc;
            img.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enable='true',sizingMethod='scale',src=\""+imgSrc+"\")";

        }
    };
    // onchange
    $(this).change(function(){
        previewImage();
    });
};

$.fn.scrollEvent = function(opt){
    var defaultOpt = {
        id : null,
        func : null
    };
    $.extend(defaultOpt, opt);

    var elem = document.getElementById(defaultOpt.id);
    if (elem.addEventListener) {    // all browsers except IE before version 9
        // Internet Explorer, Opera, Google Chrome and Safari
        elem.addEventListener ("mousewheel", MouseWheelHandler, false);
        // Firefox
        elem.addEventListener ("DOMMouseScroll", MouseWheelHandler, false);
    }else{
        if (elem.attachEvent) { // IE before version 9
            elem.attachEvent ("onmousewheel", MouseWheelHandler);
        }
    }

    function MouseWheelHandler() {
        var nDelta = 0;
        if (!event) { event = window.event; }
        // cross-bowser handling of eventdata to boil-down delta (+1 or -1)
        if ( event.wheelDelta ) { // IE and Opera
            nDelta= event.wheelDelta;
            if ( window.opera ) {  // Opera has the values reversed
                nDelta= -nDelta;
            }
        }
        else if (event.detail) { // Mozilla FireFox
            nDelta= -event.detail;
        }
        if (nDelta > 0) {
            defaultOpt.func('up');
        }
        if (nDelta < 0) {
            defaultOpt.func('down');
        }
        if ( event.preventDefault ) {  // Mozilla FireFox
            event.preventDefault();
        }
        event.returnValue = false;  // cancel default action
    }
}

function youtubeInner(obj, id){
    var url = 'https://www.youtube.com/embed/' + id + '?version=3&autoplay=1&controls=1&modestbranding=1&rel=0&showinfo=0&disablekb=1';
    var temp = '<iframe width="100%" src="'+ url +'" frameborder="0" allowfullscreen id="youtubeFrame"></iframe>';
    obj.html(temp);
}

function youtubePopup(id){
    var url = 'https://www.youtube.com/embed/' + id + '?version=3&autoplay=1&controls=1&modestbranding=1&rel=0&showinfo=0&disablekb=1';
    var temp = '<iframe width="100%" height="100%" src="'+ url +'" frameborder="0" allowfullscreen id="youtubeFullFrame"></iframe>'
        + '<a href="#" class="btnLayerClose" onclick="Layer.close(); return false;"><img src="/images/btn/btn_close2.png" alt="닫기" width="14" class="imgVm"></a>';

    $("#wrapper").append('<div id="blockArea">'+ temp +'</div>');

    $("#subFloating").hide();
}

var gifStay = {
    init : function init(obj){
        var src = obj.attr("src");
        obj.attr("staysrc", src);
        obj.css("opacity", "0");
        obj.removeAttr("src");
    },
    set : function set(obj){
        var src = obj.attr("staysrc");
        obj.attr("src", src);
        obj.css("opacity", "1");
    },
    remove : function set(obj){
        obj.removeAttr("src");
    }
}


function textareaResize(obj){
    var D_target = $(obj);
    var lineHeigh = parseInt(D_target.css("line-height"));
    var maxHeight = parseInt(D_target.css("max-height"))  ? parseInt(D_target.css("max-height")) : false;
    D_target.css("overflow", "hidden");
    D_target.on("keyup keydown", function(e){
        var keyCode = e.originalEvent.keyCode;
        $(this).height(lineHeigh);
        var scrollHeight = $(this).prop('scrollHeight');
        $(this).css("height", scrollHeight + "px");
        if(maxHeight && maxHeight < scrollHeight){
            $(this).css("overflow", "auto");
            if(!(keyCode >= 37 && keyCode <= 40)){
                scrollNum = scrollHeight - maxHeight;
                $(this).scrollTop(scrollNum);
            }
        }
    });
}


function headerGifDeley(speed){
    if(speed == null || speed == ""){ speed = 1000;};
    $("#contHeader").find(".gifImage").each(function(){
        gifStay.init($(this));
    })
    $("#contHeader").imagesLoaded(function(){
        setTimeout(function(){
            $("#contHeader").find(".gifImage").each(function(){
                gifStay.set($(this));
            })
        },speed)
    });
}

function swingObj(obj, num){
    $(window).on("scroll", function(){
        var scrollTop = Math.ceil($(this).scrollTop() / 100 * num);
        var randomLeftNum = Math.floor(Math.random() * num) + 1;
        var randomTopNum = Math.floor(Math.random() * num) + 1;
        var leftCnt = Math.floor(Math.random() * 2) + 1;
        var topCnt = Math.floor(Math.random() * 2) + 1;
        if(leftCnt != 1){
            randomLeftNum = - randomLeftNum;
        }
        if(topCnt != 1){
            randomTopNum = - randomTopNum;
        }
        obj.css({
            //"transition" : "all 0.5s ease-in-out",
            "transform" : "translate("+ randomTopNum +"px , "+ randomLeftNum +"px)"
        })
    });
}

function swingObj2(parentObj, objs, num){
    var posTop = [];
    var posLeft = [];
    var randomTop = [];
    var randomLeft = [];
    objs.each(function(i){
        posTop[i] = $(this).offset().top;
        posLeft[i]= $(this).offset().left;
        randomTop[i] = Math.floor(Math.random() * 5) * 10 + 30;
        randomLeft[i] = Math.floor(Math.random() * 5) * 10 + 30;
    })
    parentObj.mousemove(function( e ) {
        objs.each(function(i){
            var moveTop = (e.pageY - posTop[i]) / randomTop[i];
            var moveLeft = (e.pageX - posLeft[i]) / randomLeft[i];
            $(this).css({
                //"transition" : "all 0.5s ease-in-out",
                "transform" : "translate("+ moveLeft +"px , "+ moveTop +"px)"
            })
        })
    });
}


/*  페이지 스크롤 시 하단 메뉴 노출 설정 */
let scrollDirection = '';
let initialY = null;
$(window).on('scroll',function(){
    let currentScrollPoint = $(window).scrollTop();
    if(currentScrollPoint===0) scrollDirection ='up';
    headerControl();
}).on('mousewheel',function(e){
    e.originalEvent.wheelDelta >= 0 ? scrollDirection ='up' : scrollDirection ='down'
}).on('touchstart',function(e){
    initialY = `${e.touches ? e.touches[0].clientY : e.clientY}`;
}).on('touchmove',function(e){
    const currentY = `${e.touches ? e.touches[0].clientY : e.clientY}`;
    let diffY = initialY - currentY;
    0 < diffY ? scrollDirection = 'down' : scrollDirection = 'up'

    initialY = `${e.touches ? e.touches[0].clientY : e.clientY}`;
})

function headerControl(){
    if(scrollDirection ==='down'){ //스크롤 내려감
        $('#header').addClass('scroll-down');
    } else{
        $('#header').removeClass('scroll-down');
    }
}

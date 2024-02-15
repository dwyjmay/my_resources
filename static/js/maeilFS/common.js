
$(function() {
    // Top 버튼
    $(window).scroll(function () {
        const con = $(".goTop");
        const footer = $("footer");
        if ( footer.length > 0 ) {
            if ( $(this).scrollTop() > footer.offset().top - footer.height() - 100 ) {
                con.css("bottom", 400);
            } else {
                con.css("bottom", 100);
            }
            if ($(this).scrollTop() > 60) {
                con.addClass('on');
            } else {
                con.removeClass('on');
            }
        }
    });
    //countControlBtn();
    dateInputText();
    tabMenuPosSet();
})

/* 기본 이벤트 막기(버블링, 캡처링) */
function preventDefault(e){
    e.preventDefault();
    e.stopPropagation();
}

function collectionHas(a, b) {
    for(var i = 0, len = a.length; i < len; i ++) {
        if(a[i] === b) return true;
    }
    return false;
}
function findParentBySelector(elm, selector) {
    var all = document.querySelectorAll(selector);
    var cur = elm.parentNode;
    while(cur && !collectionHas(all, cur)) {
        cur = cur.parentNode;
    }
    return cur;
}

// ajax 호출 팝업
let popIdcnt = 0;
let popZindex = 1101;
let popId;

//ex : showPopAjax('/board/requestSeminar');
function showPop(url) {
    popIdcnt++;
    popId = "pop"+popIdcnt;
    $.ajax({
        type: "POST",
        url: url,
        dataType:"html",
        success: function(html) {
            $("body").append(html).addClass("scrollFix");
            document.querySelectorAll(".typePop")[document.querySelectorAll(".typePop").length - 1].id = popId;
            // if (!(title) === false) { $(".typePop#"+popId+" .title").text(title); }
            let currentPop = document.querySelector("#"+popId);
            currentPop.style.zIndex = popZindex + popIdcnt;
            if ( !(document.querySelector(".typePop#"+popId+"+.dim")) === false ) { document.querySelector(".typePop#"+popId+"+.dim").style.zIndex = popZindex + popIdcnt - 1; }
            setTimeout(function () {
                currentPop.classList.add("show");
            }, 300);
        },
        error: function (xhr, status, error) {
            alert(error);
        }
    })
}
//ajax 팝업 닫기
function closePop(target) {
    const popDOM = findParentBySelector(target, ".typePop");
    const dim = popDOM.nextElementSibling;
    $("body").removeClass("scrollFix");
    if ( popDOM.nextElementSibling === dim && !(popDOM.nextElementSibling) === false ) {
        dim.remove();
    }
    popDOM.remove();
}

//히든 레이어 팝업 보여주기
function showPopLayer(target) {
    let currentPop = document.querySelector(target);
    currentPop.classList.add("show");
    $(target).next(".dim").fadeIn();
}
//히든 레이어 팝업 닫기
function closePopLayer(target) {
    const popDOM = $(target).parents(".typePopLayer");
    const dim = popDOM.next(".dim");
    $("body").removeClass("scrollFix");
    if ( !(popDOM.next()) === false ) {
        dim.hide();
    }
    popDOM.removeClass("show");
}

//아이프레임 팝업 보여주기
function showPopIframe(target, url) {
    const iframeDOM = $("iframe#popContIframe");
    const popDOM = document.querySelector(target);
    iframeDOM.attr("src", url);
    iframeDOM.bind('load',function () {
        console.log("ok");
        showPopLayer(target);
        popDOM.style.height = document.querySelector("iframe").contentWindow.document.querySelector("body").offsetHeight + 116;
    });
}

// 외부영역 클릭 시 팝업 닫기
$(document).mouseup(function (e){
    var popup = $(".typePop");
    let topPop = $(".typePop").eq($(".typePop").length - 1);
    if(popup.has(e.target).length === 0){
        if ( !(topPop.next(".dim")) === false ) {
            topPop.next(".dim").remove();
        }
        topPop.remove();
        $("body").removeClass("scrollFix");
    }

    var LayerPopup = $(".typePopLayer");
    let topLayerPop = $(".typePopLayer.show");
    if(LayerPopup.has(e.target).length === 0){
        if ( !(topLayerPop.next(".dim")) === false ) {
            topLayerPop.next(".dim").fadeOut();
        }
        topLayerPop.removeClass("show");
        $("body").removeClass("scrollFix");
    }
});

// 오늘 하루 열지 않음
function todayClose(winName, expiredays, target) {
    setCookie(winName, "expire", expiredays);
    closePop(target);
}
// 쿠키 가져오기
function getCookie(name) {
    var nameOfCookie = name + "=";
    var x = 0;
    while (x <= document.cookie.length) {
        var y = (x + nameOfCookie.length);
        if (document.cookie.substring(x, y) == nameOfCookie) {
            if ((endOfCookie = document.cookie.indexOf(";", y)) == -1)
                endOfCookie = document.cookie.length;
            return unescape(document.cookie.substring(y, endOfCookie));
        }
        x = document.cookie.indexOf(" ", x) + 1;
        if (x == 0)
            break;
    }
    return "";
}

// 24시간 기준 쿠키 설정하기
// 만료 후 클릭한 시간까지 쿠키 설정
function setCookie(name, value, expiredays) {
    var todayDate = new Date();
    todayDate.setDate(todayDate.getDate() + expiredays);
    document.cookie = name + "=" + escape(value) + "; path=/; expires=" + todayDate.toGMTString() + ";"
}


//DOM class 초기화
function removeAllOnClass(arr, className) {
    if ( !(className) ) {
        for ( let e of document.querySelectorAll(arr) ) {
            e.classList.remove("on");
        }
    } else {
        // 다른 클래스명을 지정해서 삭제하고 싶을 경우
        for ( let e of document.querySelectorAll(arr) ) {
            e.classList.remove(className);
        }
    }
}

// 탭메뉴
function tabMenu(targetId, btn) {
    let target;
    $(targetId).parent(".tabCont").children("div").removeClass("on");
    $(btn).parents(".tab").children("a, button").removeClass("on");
    if ( targetId !== '') {
        // -탭 콘텐츠 온/오프 컨트롤이 필요한 경우
        target = document.querySelector(targetId);
        if ( target.classList.contains("on") === true ) {
        } else {
            target.classList.add("on");
            btn.classList.add("on");
        }
    } else {
        // -탭 버튼 온/오프 변경만 필요한 경우 (해당 페이지에 함수 선언)
        if ( btn.classList.contains("on") === true ) {
        } else {
            btn.classList.add("on");
        }
    }
}

//가로형 탭메뉴 위치 자동 조절
//(선택된 탭이 중앙으로 오도록 처리)
function tabMenuPosSet() {
    const tab = $(".tab.typeB");
    if ( tab.length > 0 ) {
        const windowWidth = $(window).width();
        const tabOnButton = $(".tab.typeB button.on");
        let tabOnButtonPosLeft = 0;
        let tabListArr = tab.children("button");
        let tabListWidth = 0;
        for ( let e of tabListArr) {
            tabListWidth += e.offsetWidth;
            if ( e.classList.contains("on") ) {
                tabOnButtonPosLeft = tabListWidth - tabOnButton.outerWidth();
            }
        }
        if ( tabListWidth > windowWidth && tabOnButtonPosLeft + tabOnButton.outerWidth() > windowWidth ) {
            tab.scrollLeft(tabOnButtonPosLeft - (windowWidth - tabOnButton.outerWidth())/2);
        }
    }
}

// 좋아요 버튼
function likeBtn() {
    const listBtnDOM = $(".btn.like");
    listBtnDOM.click(function () {
        if ( $(this).hasClass("on") === true ) {
            $(this).removeClass("on");
        } else {
            $(this).addClass("on");
        }
    });
}

//수량 증감 버튼
function countControlBtn() {
    const countBtn = $(".btnArea .countArea button");
    let countInput, eachCountPrice, eachPriceInput, loadingChk;
    let countNum = 0, eachPrice = 0, countNumEach;
    !($(".innerCount")) ? loadingChk = false : loadingChk = true;

    //수량증감 비활성 영역 disabled 처리
    $(".btnArea.disable .countArea").children().attr("disabled", true);

    $(countBtn).click(function () {
        countInput = $(this).parents(".countArea").children("input.count");
        eachPriceInput = $(this).parents(".priceArea").children(".price");
        if ( !($(this).parents(".textWrap").find(".innerCount").text()) ) {
            if ( countInput.val() >= 0 ) {
                if ( $(this).hasClass("up") ) {
                    countNum++;
                    countInput.val(countNum);
                } else if ( $(this).hasClass("down") ) {
                    countNum--;
                    countInput.val(countNum);
                }
                if ( countNum === 0 ) {
                    $(this).parents(".countArea").children("button.down").addClass("off");
                } else {
                    $(this).parents(".countArea").children("button.down").removeClass("off");
                }
            }
        } else {
            eachCountPrice = $(this).parents(".textWrap").find(".smallText + .price");
            eachCountPrice = eachCountPrice.text().replace(',',"");
            eachCountPrice = eachCountPrice.replace('원(개당)',"");
            eachCountPrice = parseInt(eachCountPrice);

            countNumEach = parseInt($(this).parents(".textWrap").find(".innerCount").text());
            countNum = parseInt(countInput.val());
            if ( countInput.val() >= 0 ) {
                if ( $(this).hasClass("up") ) {
                    countNum += countNumEach;
                    eachPrice = eachCountPrice * countNum;
                    countInput.val(countNum);
                    eachPriceInput.text(eachPrice.toLocaleString() + "원");
                } else if ( $(this).hasClass("down") ) {
                    countNum -= countNumEach;
                    eachPrice = eachCountPrice * countNum;
                    countInput.val(countNum);
                    eachPriceInput.text(eachPrice.toLocaleString() + "원");
                }
                if ( countNum === 0 ) {
                    $(this).parents(".countArea").children("button.down").addClass("off");
                } else {
                    $(this).parents(".countArea").children("button.down").removeClass("off");
                }
            }
        }

        if ( loadingChk === true ) {
            loadingAdd('full');
            setTimeout(loadingRemove, 300);

            setResultPrice();
        }
    })

    $(".btnArea .countArea input.count").change(function () {
        if ( $(this).val() < 0 ) {
            $(this).val(0);
        }
    })
}

//수량 증감에 따른 가격 변동 적용 부분 (필요 없을 경우 삭제)
function setResultPrice() {
    const resultPriceVal = $(".resultPrice span");
    const resultConutVal = $(".resultCount span");
    const allPriceArr = $(".productArea ul li .priceArea .price");
    let price, resultPrice;
    resultPrice = 0;
    resultConutVal.text(allPriceArr.length);
    for (let e of allPriceArr) {
        price = e.innerText.replace(',',"")
        price = price.replace('원',"")
        resultPrice += parseInt(price);
    }
    resultPriceVal.text(resultPrice.toLocaleString());
}

// 원본 이미지 레이어팝업(줌)
function zoomImg() {
    const imgUrl = document.querySelector(".swiper-slide-active .thumb img").attributes.src.value;
    const imgDOM = '<img src="' + imgUrl + '">';
    if ( $(".typePopLayer.zoom .imgArea img").length < 1 ) {
        $(".typePopLayer.zoom .imgArea").append(imgDOM);
    }
    $("body").addClass("scrollFix");
    $(".typePopLayer.zoom").addClass("show");
    $(".typePopLayer.zoom + .dim").fadeIn();
}
//데이트피커(달력) 수동 활성화
function showCalendar(target) {
    $(target).parent().children("input[type=date]").datepicker("show");
}

//스크롤 이동 애니메이션
function goTargetPos(target) {
    const targetDOM = $(target);
    $('html,body').animate({scrollTop: targetDOM.offset().top - 70 }, 500);
}

// 뒤로가기
function goBack(){
    window.history.back();
}

//맨 위로(TOP 버튼)
function goTop() {
    $('html,body').animate({ scrollTop: 0 }, 500);
}


// 로딩 이미지 추가
function loadingAdd(obj) {
    if(obj == "full"){
        $("body").prepend("<div id=\"loadingArea\" class=\"fullLoad\" style=\"z-index:100010\"><img src=\"/static/mobile/images/common/loading.gif\" alt=\"로딩중...\"></div>");
    } else {
        if($(obj).css("position") != "relative" && $(obj).css("position") != "absolute"){
            $(obj).css("position", "relative");
        }
        $(obj).prepend("<div id=\"loadingArea\"><img src=\"/static/mobile/images/common/loading.gif\" alt=\"로딩중...\"></div>");
    }
}

// 로딩 이미지 삭제
function loadingRemove(obj) {
    if(obj != undefined) {
        $(obj).find("#loadingArea").remove();
    } else {
        $("#loadingArea").remove();
    }
}

function dateInputText() {
    $("input[type=date]").on("change", function () {
        console.log($(this));
        $(this).addClass("focus");
    })
}{
    $("input[type=date]").on("change", function () {
        console.log($(this));
        $(this).addClass("focus");
    })
}
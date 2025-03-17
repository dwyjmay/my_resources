/* 모바일에 pc레이아웃 적용 */
//모바일 영역 scale 설정, 기본(=최대) 넓이 800px
const mFrameWidth = 800;
let mFrameHeight = 0;
$(function(){
    // $('body').addClass(!isMobile ? 'pcVer':'');

    let vh = window.innerHeight * 0.01.toFixed(2);
    document.documentElement.style.setProperty("--vh", `${vh}px`);

    //scale 고려한 요소 위치 이동
    $('#mobileWrapper').prepend($('.quickSearch'));
    $('#mobileWrapper').prepend($('#header'));
    $('#mobileWrapper').append($('#quickNav'));


    let currentScale = 1;//800px 기준
    const shrinkScale = 0.1;$('body').imagesLoaded(function () {
    mFrameHeight = $('#wrap').height();
    if(!isMobile){
        currentScale = getCookie('scaleCookie') ? getCookie('scaleCookie') : 1;
        if(currentScale===1){
            setCookie('scaleCookie',currentScale,1)
        }
        setScale(currentScale);
        setCssValue(currentScale)
        $('.buttonInMobile').length > 0 ? posInMobileWrapper('.buttonInMobile') : '';
        $('.floatWrap').length > 0 ? posInMobileWrapper('.floatWrap') : '';
        $('.tabTypeA .floatWrap').length > 0 ? fixBelowHeader('.tabTypeA .floatWrap',posTop) : '';
        $('.tabTypeB .floatWrap').length > 0 ? fixBelowHeader('.tabTypeB .floatWrap',posTop) : '';

        $('.btnTop').length > 0 ? (
            $('#mobileWrapper').append($('.btnTop')),
                posInMobileWrapper('.btnTop')
        ) : '';
    }else{
        setCookie('scaleCookie',currentScale,1)
        currentScale = getCookie('scaleCookie');
    }
});

setAsidePosX();

//scale 버튼 동작
$('#asideNav .scaleBtn button').on('click',function(){
    if($(this).hasClass('scaleDown')){ //축소
        if(currentScale > 0.4){
            currentScale = (Number(currentScale) - Number(shrinkScale)).toFixed(1);
            setScale(currentScale)
        } else{
            alert('더 이상 축소할 수 없습니다.')
        }
    } else{ //확대
        if(currentScale<1){
            currentScale = (Number(currentScale) + Number(shrinkScale)).toFixed(1);
            setScale(currentScale)
        } else{
            alert('더 이상 확대할 수 없습니다.')
        }
    }
    setCssValue(currentScale)
    if($('.tabTypeA .floatWrap').length > 0 ){
        fixBelowHeader('.tabTypeA .floatWrap',posTop)
    }
    if($('.tabTypeB .floatWrap').length > 0 ){
        fixBelowHeader('.tabTypeB .floatWrap',posTop)
    }

    const navHeaderHeight = $('#category .log').outerHeight()
    const navAreaHeight = Number(getComputedStyle(document.documentElement).getPropertyValue("--vh").slice(0,-2)) * 100 / getCookie('scaleCookie') - navHeaderHeight ;
    $("#category .navArea").css({"height":"calc("+(navAreaHeight) + "px)"});
})

$(window).on('resize',function(){
    if(!isMobile){
        setAsidePosX();
        setScale(getCookie('scaleCookie'));
    }else{
        const vh = window.innerHeight * 0.01.toFixed(2);
        document.documentElement.style.setProperty("--vh", `${vh}px`)
    }
})
})




/* scale 고려 아래고정 팝업  .layerFlex(> .content 必)*/
function setLayerFlex(layer){
    const $layer = $(layer);
    $layer.each(function(idx,item){
        $(item).find('.content').focus();
        let vh = Number(getComputedStyle(document.documentElement).getPropertyValue("--vh").slice(0,-2)) * 100
        let space = 136;
        let scalevh = Math.ceil(vh / getCookie('scaleCookie'));
        //console.log(`vh:${vh},space:${space},scalevh${scalevh}`)

        if($(item).data('space')!==undefined){
            space = $(item).data('space');
        }
        const layerHeight = scalevh-space; //max layer

        let sum = parseInt($(item).css('padding-top'));
        $(item).find('.minusHeight:visible').each(function () {
            sum += $(this).outerHeight()+parseInt($(this).css('margin-top')) + parseInt($(this).css('margin-bottom')) ;
        })
        //console.log(`layerHeight :${layerHeight}, ${sum}`)
        $(item).find('.content').css('max-height',(layerHeight-sum)+"px");

        $(window).on('resize',function(){
            let vh = Number(getComputedStyle(document.documentElement).getPropertyValue("--vh").slice(0,-2)) * 100;
            let scalevh = Math.ceil(vh / getCookie('scaleCookie'));
            const layerHeight2 = scalevh - space;
            $(item).find('.content').css('max-height',(layerHeight2-sum) + "px");
        })
    })
}


/* scale 고려 전체 팝업 .fullType*/
function setLayerFull(layer){
    const $layer =$(layer);
    $layer.each(function(){
        const tempZindex = $(this).css('z-index');
        $(this).removeAttr('style').show();
        $(this).css('z-index',tempZindex)
        posInMobileWrapper($(this))
        if(!isMobile){
            $(this).css({'max-height':'none','height':$(this).height()/getCookie('scaleCookie')+'px'})
        }else{
            $(this).css({'max-height':'none'})
        }
    })
}


//화면 scale 값과 그 때의 최대 넓이값 설정
function setCssValue(scale){
    document.documentElement.style.setProperty("--current-scale", (scale))
    document.documentElement.style.setProperty("--current-scale-width", (mFrameWidth*scale)+"px")
}


//화면 확대 축소 설정
function setScale(scale){
    mFrameHeight = $('#wrap').height();
    const viewHeight = Math.ceil(mFrameHeight*scale) < $(window).height() ? $(window).height() : Math.ceil(mFrameHeight*scale);
    $('#wrap, #header, #quickNav').css('transform','scale('+scale+')');//scale 조정 필요한 기본 레이아웃 요소들
    $('#wrap, #header, #quickNav').css('opacity',1);

    $('#mobileWrapper').css('width',mFrameWidth*scale)
    $('#mobileWrapper').css('height',viewHeight+1)
    $("#asideNav").css('left',$('.asideWrap').offset().left);

    $("#asideNav").css('opacity',1);
    $("#mobileWrapper").css('opacity',1);

    if($('.scaled').length){ //스케일되어 위치 재지정이 필요한 요소들
        $('.scaled').each(function(){
            posInMobileWrapper($(this))
        })
    }

    setCookie('scaleCookie',scale,1)

    selectScale()

    setLayerFlex('.scaled.layerFlex:visible')

    setLayerFull('.scaled.fullType:visible')

    if($('.brandHead').length){
        const $brandHead = $('.brandHead');
        const brandWidth = $brandHead.width()
        $brandHead.css('transform','scale('+scale+') translateX('+(800- brandWidth - brandWidth/2)+'px)')
        $('.brandNav').css('transform','translateX(-'+(800-brandWidth-(brandWidth/2))+'px)')

        let vh = Number(getComputedStyle(document.documentElement).getPropertyValue("--vh").slice(0,-2)) * 100
        let space = (105 + 50);
        let scalevh = Math.ceil(vh / getCookie('scaleCookie'))

        const layerHeight = scalevh-space; //max layer
        $('.brandNav').css('max-height',(layerHeight)+'px');
    }
}

//aside 메뉴 위치 지정
function setAsidePosX(){
    if ($('#mobileWrapper').length) {
        const setAsidePosX = $('#mobileWrapper').offset().left + $('#mobileWrapper').width();
        $('#asideNav').css('left', setAsidePosX)
    }
}

/* 요소 offsetLeft 지정 */
//1. #mobileWrapper안 레이어 형식으로 뜨는 요소 (팝업, 버튼 ..)
//2. fixed
//3. (기본)모바일 영역 안에서 가운데 정렬 됨
//    data-side="right" -> 오른쪽 정렬
//    data-side=숫자 → 여백 값
function posInMobileWrapper(element){
    const scaleVal = getCookie('scaleCookie') ? getCookie('scaleCookie') : 1;
    if(!isMobile){
        const $target = $(element);
        const targetWidth = $target.outerWidth();
        const padding = Math.floor((800 - targetWidth) / 2) ;
        if(!$target.hasClass('scaled')){
            $target.addClass('scaled')
        }
        if($target.data('side')==='right'){
            $target.css('left',$('#mobileWrapper').offset().left + $('#mobileWrapper').width() - $target.width() - $target.data('space')*scaleVal);
            $target.css('opacity', 1);
        } else{
            $target.css('left',$('#mobileWrapper').offset().left + padding*scaleVal);
            $target.css('opacity', 1);
        }
    }
}


/* 데이터 다 부른 후 값 재적용*/
function  asyncScale(){
    if(!isMobile){
        setScale(getCookie('scaleCookie'))
    }
}
var addImgInput;

$(function(){	
	//gnb - 오버
	$('#header .gnb > li').on('mouseenter', function(e){	  
		$('#header .gnb > li').not($(this)).removeClass('on');
		$(this).addClass('on');
    })	
	$('#header .gnb').on('mouseleave', function(){
		$('#header .gnb > li').removeClass('on');
    });
	
	//top버튼
	$('#pageTop').click(function(){
		$('html,body').stop().animate({
			scrollTop:0
		},700,'easeInOutExpo');
	});
	
	//블록 생성 : 페이지에 한개씩
	$("#wrapper").append('<div class="blockArea" id="blockArea"></div>');
	
	inpActive();//input, select 값 있을때	

});

function inpActive(){
	$('input[type="text"], input[type="number"], textarea').each(function(){
		$(this).off('change');
		if($(this).val().length > 0 ){
			$(this).addClass('valOn');
		}else{
			$(this).removeClass('valOn');
		}
		
		$(this).on('change', function(){
			if($(this).val().length > 0 ){
				$(this).addClass('valOn');
			}else{
				$(this).removeClass('valOn');
			}
		});
	});
	
	$('select').each(function(){
		$(this).off('change');
		$(this).on('change', function(){
			if($(this).val() !== ''){
				$(this).addClass('valOn');
			}else{
				$(this).removeClass('valOn');
			}
		});
		
		if($(this).val() !== ''){			
			$(this).addClass('valOn');
		}
	
	});
}


/*textarea*/
function textareaResize(obj){
	var D_target = $(obj);
	var lineHeigh = parseInt(D_target.css("line-height"));
	var maxHeight = parseInt(D_target.css("max-height"))  ? parseInt(D_target.css("max-height")) : false; 
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

/* 뒤로가기 */
function goBack(){
	window.history.back();
}

/* 기본 이벤트 막기(버블링, 캡처링) */
function preventDefault(e){
	e.preventDefault();
	e.stopPropagation();
}

/* 쿠키확인 */
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
function setCookie( name, value, expiredays ) {
	var todayDate = new Date();
	todayDate.setDate( todayDate.getDate() + expiredays );
	document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + todayDate.toGMTString() + ";"
}


//selectCustom
var Custom_select = window.Custom_select || {};

Custom_select = (function(){	
	function Custom_select(elem){
		var _ = this;
		_.$wrap = $(elem);
		_.$real = $(elem).find('select');
		_.$realOpt = _.$real.find('option');
		
		_.id = _.$real.attr('id');
		_.uiId = 'select_'+_.id;
		_.optStr = '';
		_.selectedIdx = 0;
		_.initSeletedIdx = 0;
		
		_.optStr += '<ul class="selectBox selectList_'+ _.id +'" style="display:none;">';
		_.$realOpt.each(function(){
			if($(this).attr('selected')) {
				_.selectedIdx = $(this).index();
				_.initSeletedIdx = $(this).index();
			}
			_.optStr += '<li data-val="'+ $(this).attr('value') +'"><a href="javascript:;">'+ $(this).text() +'</a></li>';			
		});
		_.optStr += '</ul>';		
		
		_.$wrap.append('<p class="selectedMain selected_'+ _.id +'" data-initSel="'+ _.initSeletedIdx +'"><a href="javascript:;">'+ _.$realOpt.eq(_.selectedIdx).text() +'</a></p>');
		_.$wrap.append(_.optStr);				
		_.$real.css('display', 'none');
	
		_.$repMain = _.$wrap.find('.selectedMain');
		_.$repListWrap = _.$wrap.find('.selectBox');
		_.$repList = _.$repListWrap.find('li');
		_.$wrap.addClass(_.uiId);
	
		_.init();
	}
	return Custom_select;
})();

Custom_select.prototype.init = function(){
	var _ = this;
	_.$repMain.on('click', $.proxy(_.repOpen, _));
	_.$repList.on('click', function(){
		_.selectedIdx = $(this).index();
		_.selectLink();
	});
}
Custom_select.prototype.repOpen = function(){
	var _ = this;
	if(_.$repListWrap.hasClass('open')){			
		_.$repListWrap.slideUp(200);	
		_.$repListWrap.removeClass('open');
		_.$repMain.removeClass('open');
		$('#wapper').off('click', _.closeFn);			
	}else{		
		$('.selectedMain').removeClass('open');
		$('.selectBox').removeClass('open');
		$('.selectBox').hide();
		_.$repListWrap.slideDown(200);
		_.$repListWrap.addClass('open');
		_.$repMain.addClass('open');
		$('#wapper').on('click', $.proxy(_.closeFn, _));
	}
	return false;
}
Custom_select.prototype.selectLink = function(){
	var _ = this;		
	_.$wrap.find('.selectedMain').find('a').text(_.$realOpt.eq(_.selectedIdx).text());		
	_.$repList.removeClass('on');
	_.$repList.eq(_.selectedIdx).addClass('on');
	_.$repMain.removeClass('open');
	_.$repListWrap.removeClass('open');
	_.$repListWrap.slideUp(200);
	_.$realOpt.removeAttr('selected');
	_.$realOpt.eq(_.selectedIdx).attr('selected', 'selected');
	return false;
}

Custom_select.prototype.closeFn = function(){
	var _ = this;		
	_.$repListWrap.removeClass('open');
	_.$repMain.removeClass('open');
	_.$repListWrap.slideUp(200);
}

/*
$(function(){
	if($('.selectUi').length > 0){
		$('.selectUi').each(function(){
			this.selectU = new Custom_select(this);
		});
	}	
	
});	
*/

/*
 * 팝업 *
 * showPopupLayer(url, param(오브젝트), iframe flag(true/false), className);
 *    -- ex)showPopupLayer('/member/certifyPop', {name="안선영", id="sy"}, false,'certiAlert');
 * 
 * */
var POPUP_INIT_ID = 10000,
    _popupLayerID = POPUP_INIT_ID,
	beforeScrT = 0,
	popSetId;

function showPopupOrder(){
	_popupLayerID += 1;	
	if($("#blockArea").find('.pop').length > 0){
		$("#blockArea").find('.pop').hide();
	}
	$("#blockArea").append('<div class="pop" id="pop' + (_popupLayerID) + '" style="opacity:0;"></div>');

	$("#pop" + _popupLayerID).attr("tabIndex", "0")
	$("#pop" + _popupLayerID).focus();		
	$("#pop" + (_popupLayerID)).css("z-index", _popupLayerID);
	
	if($("#blockArea").find('.pop').length == 1){
		$("#blockArea").show();
		$('body').addClass('noScr');
		$(window).on('resize', popupPos);		
	}
}

function popupPos(target){
    if(target){    	
    	var doc = target.contentDocument || target.contentWindow.document;
    	target.style.width = doc.querySelector('.popCont').offsetWidth + 20 + 'px';
    	target.style.height = doc.querySelector('.popCont').scrollHeight + 20 + 'px';
    	$(target).css('transform', 'none');
    	$(target).css('top', ($(window).height()-$("#pop" + (_popupLayerID)).outerHeight())/2);
    	$(target).css('left', ($(window).width()-$("#pop" + (_popupLayerID)).outerWidth())/2);
    }else{

    	$("#pop" + (_popupLayerID)).css('transform', 'none');
    	$("#pop" + (_popupLayerID)).css('top', ($(window).height()-$("#pop" + (_popupLayerID)).outerHeight())/2);
    	$("#pop" + (_popupLayerID)).css('left', ($(window).width()-$("#pop" + (_popupLayerID)).outerWidth())/2);
    }
    	
}

function showPopupLayer(popSrc, param, iframe, clsName) {
	showPopupOrder();	
	$("#blockArea").off('click');

	var close = '<a href="javascript:hidePopupLayer();" class="closeBtn"></a>';
	
	if(clsName !== undefined) $("#pop" + (_popupLayerID)).addClass(clsName); //class추가
	if(iframe) { //iframe에 form전송 필요할때
		/*$.post(popSrc, param, function(data){			
			
		});	*/
		$("#pop" + (_popupLayerID)).append(close + '<iframe name="pop'+ _popupLayerID +'" src="'+ popSrc +'" frameborder="0" allowTransparency="true"></iframe>');	
		
		$("#pop" + (_popupLayerID)).find('iframe').on('load', function(){			
			popupPos(this);
			$("#pop" + (_popupLayerID)).css('opacity', 1);			
		});
		if(param !== ''){
			var ownProps = Object.keys(param), paramArr = new Array(ownProps.length);				
			for(var i = 0; i < ownProps.length; i++){
				paramArr[i] = [ownProps[i], param[ownProps[i]]];
			}
			
			var f = $('<form></form>');
			f.attr('target', 'pop'+ _popupLayerID);
			f.attr('action', popSrc)
			f.attr('method', 'post');
			f.appendTo('body');
			
			for(var i = 0; i < paramArr.length; i++){
				f.append('<input type="hidden" name="'+ paramArr[i][0] +'" value="'+ paramArr[i][1] +'">');
			}
			
			f.submit();
			f.remove();
		}		
		
		if($("#pop" + (_popupLayerID)).find('.notClose').length == 0){
			$("#blockArea").on('click', function(e){				
				if($(e.target).hasClass('blockArea')){
					hidePopupLayer();
				}
			});
		}
	}else{ //일반 레이어팝업
		$("#pop" + (_popupLayerID)).load(popSrc, function(){
			$("#pop" + (_popupLayerID)).append(close);
			popupPos();
			
			setTimeout(function(){
				$("#pop" + (_popupLayerID)).css('opacity', 1);
			},500);
			
			if($("#pop" + (_popupLayerID)).find('.notClose').length == 0){
				$("#blockArea").on('click', function(e){				
					if($(e.target).hasClass('blockArea')){
						hidePopupLayer();
					}
				});
			}
		});
	}
}


function hidePopupLayer() {			
	_popupLayerID = _popupLayerID - 1;
	if (_popupLayerID > POPUP_INIT_ID) {
		$('#pop' + (_popupLayerID+1)).remove();
		$('#pop' + _popupLayerID).show();			
		
	}else {
		_popupLayerID = POPUP_INIT_ID;
		$('#pop' + _popupLayerID).remove();
		hideAllPopupLayer();
	}	
}
function hideAllPopupLayer(){
	$('body, html').removeClass('noScr');
	$('#blockArea').html('');
	$('#blockArea').hide();
	$(window).off('resize', popupPos);
	POPUP_INIT_ID = 10000;
	_popupLayerID = POPUP_INIT_ID;
}

/*폼 초기화*/
function formReset(target){	
	$(target+ ' input[type="text"]').val('');
	$(target+ ' input[type="text"]').removeClass('valOn');
	$(target+ ' textarea').val('');
	$(target+ ' select').each(function(){
		$(this).find('option').removeAttr('selected');
	});
	$(target+ ' input[type="radio"]').each(function(){
		this.checked = null;
	});
}

/*url복사*/
function copyUrl(str){
	var link = str ? str : location.href;
	$('#wrapper').append('<input type="text" id="curHref">');
	$('#curHref').val(link);
	$('#curHref').select();
	if(document.execCommand('copy')){
		alert('url이 복사되었습니다.');	
	}else{
		alert('url 복사 실패');
	}
	$('#curHref').remove();
}

/* 슬라이드 */
function slideStart(obj, cb, startNum){
	var $self = obj;
	var $slideSection = $self.find(".slideSection"); 
	var $btnSlidePrev = $self.find(".btnSlidePrev"); 
	var $btnSlideNext = $self.find(".btnSlideNext");
	var slideLength = $slideSection.length;
	var $initPageIdx = 0, 
		$curPageIdx = 0, 
		$prevPageIdx, 
		$nextPageIdx,
		$autoPlay = $self.attr('autoPlay'),
		$setTo;
	
	
	function setting(){
		var slidePaging = '';
		$slideSection = $self.find(".slideSection"); 
		slideLength = $slideSection.length;
		$initPageIdx = 0;
		$curPageIdx = 0;
		$setTo;
		
		for(var i = 0; i < slideLength; i++){
			var className = '';
			if(i == 0){
				className = 'active';
			}
			slidePaging = slidePaging + ('<li class="'+ className +'">'+ Number(i + 1) +'</li>');
		}

		$btnSlidePrev.off('click');
		$btnSlideNext.off('click');
		$slideSection.off('click');
		$self.find(".slideDots li").off('click');
		$self.find(".slideDots").remove();
		$slideSection.removeClass("active");
		
		if(slideLength >= 2){
			$slideSection.first().addClass("active");
			$self.append('<ul class="slideDots">'+ slidePaging +'</ul>');
			$slideSection.each(function(idx){
				$(this).attr('slide-num', idx+1);
			});
			$btnSlidePrev.show();
			$btnSlideNext.show();
			init();						
		}else{
			$slideSection.addClass("active");
			$btnSlidePrev.hide();
			$btnSlideNext.hide();
			$self.css("margin-bottom", "-80px");
		}
	} 
	
	function init(){
		if($autoPlay) autoPlay();
		
		$self.find(".slideDots li").on("click", function(){
			clearTimeout($setTo); 
			$curPageIdx = $(this).index();			
			setElement();
		});
		
		$btnSlidePrev.on("click", function(e){
			clearTimeout($setTo); 
			$curPageIdx--;		
			setElement();
			e.preventDefault();
		});
		
		$btnSlideNext.on("click", function(e){
			clearTimeout($setTo); 
			$curPageIdx++;		
			setElement();
			e.preventDefault();
		});
				
		$slideSection.on("click", function(e){
			clearTimeout($setTo); 
			$curPageIdx = $(this).index();
			setElement();
		});
	}
	
	function autoPlay(){		
		$setTo = setTimeout(function(){      	
			$btnSlideNext.click();
		}, 5000);
	}
	
	function setElement(){		
		if($curPageIdx < 0){
			$curPageIdx = slideLength-1;
		}else if($curPageIdx > slideLength-1){
			$curPageIdx = 0;
		}			
		$prevPageIdx = ($curPageIdx-1) < 0 ? slideLength-1 : $curPageIdx-1;	
		$nextPageIdx = ($curPageIdx+1) < slideLength ? $curPageIdx+1 : 0;
		
		$self.find(".slideSection.active").removeClass("active"); 	
		$slideSection.eq($curPageIdx).addClass("active");
				
		$self.find(".slideDots li").removeClass("active");
		$self.find(".slideDots li").eq($curPageIdx).addClass("active");
		
		if($autoPlay) {
			$setTo = setTimeout(function(){      	
				autoPlay();
			}, 2000);
		}
		
		if(cb){
			cb();
		}
	}
	
	$self.attr('slide-page', slideLength);	
	setting();
	
	if(startNum){
		$curPageIdx = $slideSection.index($self.find('.slideSection[slide-num='+ startNum +']'));
		setElement();
	}
	
}

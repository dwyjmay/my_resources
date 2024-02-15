//앞뒤 공백을 자른다..
String.prototype.trim = function() {
    var format = /^\s*/g;
    var str = this;
    str = str.replace(format, "");
    format = /\s*$/g;
    str = str.replace(format, "");

    return str;
};

// 문자열이 이메일 형식인지 판별한다.
String.prototype.isEmail = function() {
    var format = /^((\w|[\-\.])+)@((\w|[\-\.])+)\.([A-Za-z]+)$/;
    return (this.search(format) > -1);
};

String.prototype.isNumeric = function() {
    var format = /^[0-9]+$/;
    return (this.search(format) > -1);
};

// 문자열의 바이트를 리턴한다.
String.prototype.getBytes = function() {
	var temp;
	var mycount = 0;

	for(var k = 0 ; k < this.length ; k++ ){
		temp = this.charAt(k);

		if( escape(temp).length > 4 ) {
			mycount += 2;
		}
		else mycount++;
	}

	return mycount;
};

//숫자를 money포맷으로 3자리씩 끊어 표현한다.
String.prototype.formatMoney = function() {
	if (!this.isNumeric()) return null;

	var start = 0;
	var distance =  parseInt(this.length % 3);
	var nComma =  parseInt(this.length / 3);

	if (distance == 0){
		distance = 3;
		nComma -= 1;
	}

	var arr = new Array();
	for (var i=0; i<nComma + 1; i++) {
		arr[i] = this.substring(start, start + distance);	

		start += distance;
		distance = 3;
	}

	var sReturn = "";
	var isFirst = true;
	for (var i=0; i<arr.length; i++) {
		sReturn += (isFirst ? "" : ",") + arr[i];
		isFirst = false;
	}

	return sReturn;
};

//숫자를 money포맷으로 3자리씩 끊어 표현한다.
Number.prototype.formatMoney = function() {
	return this.toString().formatMoney();
};

String.prototype.isSSN = function() {
    var sum = 0 ;
    sum = this.charAt(0) * 2 + this.charAt(1) * 3 + this.charAt(2) * 4 + this.charAt(3) * 5 +
          this.charAt(4) * 6 + this.charAt(5) * 7 + this.charAt(6) * 8 + this.charAt(7) * 9 +
          this.charAt(8) * 2 + this.charAt(9) * 3 + this.charAt(10) * 4 + this.charAt(11) * 5;

    if (sum == "0") return false;
    else {
        sum = 11 - sum % 11 ;
        if (sum > 9) sum = sum - 10;

        if (sum == this.charAt(12)) return true;
        else return false;
    }
};

//yyyymmdd 검사
String.prototype.isDate = function() {
	if (this.length != 8) return false;

	var y = parseInt(this.substr(0, 2), 10);
	var m = parseInt(this.substr(4, 2), 10);
	var d = parseInt(this.substr(6, 2), 10);

	var limit_day;
	switch (m) {
		case 1: 
		case 3: 
		case 5: 
		case 7: 
		case 8: 
		case 10: 
		case 12: 
			limit_day = 31; 
			break;
		case 2:
			if ((y - 2008) % 4 == 0) limit_day = 29;
			else limit_day = 28;
			break;
		case 4: 
		case 6: 
		case 9: 
		case 11: 
			limit_day = 30; 
			break;
		default: 
			return false;
	}

	if (d > limit_day) return false;
	if (d < 1) return false;
	
	return true;
};

String.prototype.replaceAll = function (searchStr, replaceStr) {
    return this.split(searchStr).join(replaceStr);
}

//input field에 숫자만 넣어야 할경우에  onKeyPress이벤트에서 호출한다..
//사용예 : <input type=text name="aField" onKeyPress="return isNumberPressed()">
function isNumberPressed() {
 return !(event.keyCode < 48 || event.keyCode > 57);
}

// null과 빈문자열을 디폴트 처리
function nevl(str, sDefault) {
	if (str == null || str == undefined || str.trim() == "") {
		return sDefault;
	}
	else {
		return str;
	}
}

/* Korean initialisation for the jQuery calendar extension. */
/* Written by DaeKwon Kang (ncrash.dk@gmail.com). */
if ($.datepicker != null) {
	jQuery(function($){
		$.datepicker.regional['ko'] = {
			closeText: '닫기',
			prevText: '이전달',
			nextText: '다음달',
			currentText: '오늘',
			monthNames: ['1월(JAN)','2월(FEB)','3월(MAR)','4월(APR)','5월(MAY)','6월(JUN)',
			'7월(JUL)','8월(AUG)','9월(SEP)','10월(OCT)','11월(NOV)','12월(DEC)'],
			monthNamesShort: ['1월(JAN)','2월(FEB)','3월(MAR)','4월(APR)','5월(MAY)','6월(JUN)',
			'7월(JUL)','8월(AUG)','9월(SEP)','10월(OCT)','11월(NOV)','12월(DEC)'],
			dayNames: ['일','월','화','수','목','금','토'],
			dayNamesShort: ['일','월','화','수','목','금','토'],
			dayNamesMin: ['일','월','화','수','목','금','토'],
			weekHeader: 'Wk',
			dateFormat: 'yy.mm.dd',
			firstDay: 0,
			isRTL: false,
			showMonthAfterYear: true,
			yearSuffix: '년'};
		$.datepicker.setDefaults($.datepicker.regional['ko']);
		$.datepicker.setDefaults({
			showOn: "button",
			buttonImage: "/sanghafarmShopAdm/images/btn_calendar.gif",
			buttonImageOnly: true,
			buttonText: ""
		});
	});	
}


/*구글 크롬의로 디버깅시, 타부라우저의 console 객체 스킵*/
if (!window.console) console = {};
console.log = console.log || function(){};
console.warn = console.warn || function(){};
console.error = console.error || function(){};
console.info = console.info || function(){};



function disableScreen() {
	$("body").append("<div class='bgLayer'><img src='/images/loading.gif'></div>");
	$(".bgLayer").css("height", $(document).height() + "px").show();	
	$(".bgLayer img").css("top", (parseInt($(window).height()/2) + parseInt($(window).scrollTop()) - 50) + "px");
	$(".bgLayer img").css("left", (parseInt($(window).width()/2) + parseInt($(window).scrollLeft()) - 50) + "px");
}

function enableScreen() {
	$(".bgLayer").remove();
}

function onlyNumber(event) {
	/*
	event = event || window.event;
	var keyID = (event.which) ? event.which : event.keyCode;
	console.log("keyId : " + keyID);
	if ( (keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105) || keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 || keyID == 9 ) {
		return;
	} 
	else {
		console.log("keyId prevent");
		event.preventDefault();
	}
	*/
	
	event = event || window.event;
	var code = (event.which) ? event.which : event.keyCode;
	console.log("------------------ " + code);
	if(code >= 48 && code <= 57) {
	    return;
	}
	if(code >= 96 && code <= 105) {
	    return;
	}
	if(code === 110 || code === 190) {
	    return;
	}
	if(event.ctrlKey || event.altKey) {
	    return;
	}
	if(code === 9 || code === 36 || code === 35 || code === 37 ||
	   code === 39 || code === 8 || code === 46) {
	    return;
	}
	
	event.preventDefault ? event.preventDefault() : event.returnValue = false;	
}

function removeChar(event) {
	event = event || window.event;
	var keyID = (event.which) ? event.which : event.keyCode;
	if ( keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
		return;
	else
		event.target.value = event.target.value.replace(/[^0-9]/g, "");
}


function loadingAdd(obj) {
    if(obj == "full"){
    	$("blockArea").show();
        $("body").prepend("<div id=\"loadingArea\" class=\"fullLoad\" style=\"z-index:100010\"><img src=\"/static/images/loading.gif\" alt=\"loading...\"></div>");
    } else {
        if($(obj).css("position") != "relative" && $(obj).css("position") != "absolute"){
            $(obj).css("position", "relative");
        }
        $("blockArea").show();
        $(obj).prepend("<div id=\"loadingArea\"><img src=\"/static/images/loading.gif\" alt=\"loading...\"></div>");
    }
}

function loadingRemove(obj) {
    if(obj != undefined) {
    	$("blockArea").hide();
        $(obj).find("#loadingArea").remove();
    } else {
    	$("blockArea").hide();
        $("#loadingArea").remove();
    }
}

function setCodeOptions(obj, list, defaultYn, selected) {
	$("#" + obj).empty();
	if(defaultYn == 'Y') {
		$("<option />", { "value" : "" }).text("선택").appendTo("#" + obj);
	}
	
	if(list != null) {
		list.forEach(function (row) {
			$("<option />", { "value" : row.code }).text(row.name).appendTo("#" + obj);
		});
		if(typeof selected !== 'undefined'){
			$("#" + obj + " option[value=\""+selected+ "\"").prop("selected", true);
		}
	}
}
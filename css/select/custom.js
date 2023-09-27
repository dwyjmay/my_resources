let efusioni = new Object();

//축약 패키지
// efusioni.* 대신에 쓸 패키지 지정
// 프로젝트마다 달리 할 수 있다.
let ef = efusioni;

efusioni.post = function (url, data, callback) {
    $.ajax({
        type: "POST",
        url: url,
        data: data,
        dataType: "json",
        success: function (result) {
            callback(result);
        }
    });
}

/*com.efusioni.summer.Message 전용*/
efusioni.proc = function (form, callback) {
    if (typeof form === "string") {
        $.ajax({
            type: "POST",
            url: form,
            dataType: "json",
            success: function (result) {
                callback(result);
            },
            fail: function () {
                callback({succeed: false, message: "Server Error."});
            }
        });
    } else {
        let isJQueryObject = form instanceof jQuery;
        let jForm = (isJQueryObject ? form : $(form));

        let formData = jForm.serialize();

        $.ajax({
            type: "POST",
            url: jForm.attr("action"),
            data: formData,
            dataType: "json",
            success: function (result) {
                callback(result);
            },
            fail: function () {
                callback({succeed: false, message: "Server Error."});
            }
        });
    }
}

efusioni.multipart = function (multipartForm, callback) {
    let isJqueryObject = multipartForm instanceof jQuery;
    let form = (isJqueryObject ? multipartForm : $(multipartForm));

    //ie bug 우회
    let agent = navigator.userAgent.toLowerCase();
    if ((navigator.appName === 'Netscape' && navigator.userAgent.search('Trident') !== -1) || (agent.indexOf("msie") !== -1)) {
        form.append("<input type=\"hidden\" name=\"iedummy\" value=\"iedummy\">");
    }

    let data = new FormData(form[0]);

    $.ajax({
        type: "POST",
        enctype: "multipart/form-data",
        url: form.attr("action"),
        data: data,
        processData: false,
        contentType: false,
        cache: false,
        dataType: "json",
        timeout: 60000,
        success: function (result) {
            callback(result);
        },
        error: function (e) {
            callback({succeed: false, message: "Server Error."});
        },
        fail: function () {
            callback({succeed: false, message: "Server Error."});
        }
    });
}

efusioni.multipart = function (multipartForm, formField, callback) {
    let isJqueryObject = multipartForm instanceof jQuery;
    let form = (isJqueryObject ? multipartForm : $(multipartForm));

    isJqueryObject = formField instanceof jQuery;
    let field = (isJqueryObject ? formField : $("input[name=" + formField + "]", multipartForm));

    $("input[type=file]", form).not(field).prop("disabled", true);

    //ie bug 우회
    let agent = navigator.userAgent.toLowerCase();
    if ((navigator.appName === 'Netscape' && navigator.userAgent.search('Trident') !== -1) || (agent.indexOf("msie") !== -1)) {
        form.append("<input type=\"hidden\" name=\"iedummy\" value=\"iedummy\">");
    }

    let data = new FormData(form[0]);

    $.ajax({
        type: "POST",
        enctype: "multipart/form-data",
        url: form.attr("action"),
        data: data,
        processData: false,
        contentType: false,
        cache: false,
        dataType: "json",
        timeout: 60000 * 5,
        success: function (result) {
            callback(result);
            $("input[type=file]", form).prop("disabled", false);
        },
        error: function (e) {
            callback({succeed: false, message: "Server Error."});
            $("input[type=file]", form).prop("disabled", false);
        },
        fail: function () {
            callback({succeed: false, message: "Server Error."});
            $("input[type=file]", form).prop("disabled", false);
        }
    });
}


// efusioni.ui : UI 패키지 선언
efusioni.ui = new Object();

//UIManager 선언 시작 --------------------------------------------------------
efusioni.ui._UIManager = function() {
    this.idx = 0;
    this.euis = new Array();
    this.MAX_ZINDEX = 100000;

    /*
        Document의 빈영역을 클릭했을 경우, 펼쳐진 SelectBox를 닫아준다.
    */
    var self = this;
    $(document).click(function(e) {
        var isOnSelect = false;
        for (var i=0; i<self.euis.length; i++) {
            var obj = self.euis[i];
            if (obj.type == "SELECT" && obj.visualElement != null) {
                if ($(e.target).parents("#" + obj.visualElement.attr("id")).length) {
                    isOnSelect = true;
                }
            }
        }

        if (!isOnSelect) {
            for (var i=0; i<self.euis.length; i++) {
                var obj = self.euis[i];
                if (obj.type == "SELECT" && obj.visualElement != null) {
                    $(".euiSelectList", obj.visualElement).hide();
                    $(".euiSelectMain", obj.visualElement).removeClass("on");
                }
            }
        }
    });
};

efusioni.ui._UIManager.prototype.add = function(euiObj) {
    this.euis[this.idx] = euiObj;
    euiObj.euiIdx = this.idx;

    this.idx++;
};

efusioni.ui._UIManager.prototype.get = function(idx) {
    return this.euis[idx];
};

efusioni.ui._UIManager.prototype.size = function() {
    return this.euis.length;
};

efusioni.ui._UIManager.prototype.updateUi = function(formElement) {
    var eui = $(formElement).data("eui");
    if (eui != null) eui.update();
};

efusioni.ui.UIManager = new efusioni.ui._UIManager();
//UIManager 선언 끝 --------------------------------------------------------

//UI Select 선언 시작 --------------------------------------------------------
efusioni.ui.Select = function (formElement, visualTemplate) {
    /*Eui 공통 시작*/
    this.type = "SELECT";
    this.euiIdx = -1;
    this.formElement = formElement;
    this.visualElement = null;
    this.zIndex = null;

    this.formElement.data("eui", this);
    efusioni.ui.UIManager.add(this);
    /*Eui 공통 끝*/

    this.template = visualTemplate;

    this._init();
};

efusioni.ui.Select.prototype.render = function() {
    this._parse();


    this._setTitleListener();
    this._setItemListener();
};

efusioni.ui.Select.prototype.update = function() {
    this._parse();

    this._setTitleListener();
    this._setItemListener();
};

efusioni.ui.Select.prototype._init = function() {
    var tag = this.template.html;
    this.visualElement = $(tag);
    $(this.visualElement).attr("id", "eui_" + this.euiIdx);
    $(this.visualElement).attr("style", this.formElement.attr("style"));

    if(!$(this.formElement).attr("style") || $(this.formElement).attr("style").indexOf("width") < 0){
        $(this.visualElement).css("width", this.formElement.outerWidth() + 'px');
    }

    this.formElement.hide();
    this.formElement.after(this.visualElement);
    $(this.visualElement).attr("class", this.template.visualClass);
    this.zIndex = $(this.visualElement).css("z-index");

    this._setBaseListener();
};

efusioni.ui.Select.prototype._parse = function() {
    var sItem = "";
    $("option", this.formElement).each(function() {
        var _text = $(this).text();
        _text = _text.replace("\\r\\n", "<br>");
        sItem += "<li><button type='button'>" + _text + "</button></li>";
    });

    $(".euiSelectList", this.visualElement).html(sItem);

    this._setTitle();
};

efusioni.ui.Select.prototype._setTitle = function() {
    var self = this;
    $(".euiSelectTitle", this.visualElement).text($("option:selected", this.formElement).text());

    if (this.template.itemOnClass != null) {
        $(".euiSelectList li", this.visualElement).each(function(idx) {
            $(this).removeClass();
            if (idx == $("option:selected", self.formElement).index()) {
                $(this).attr("class", self.template.itemOnClass);
            }
            else {
                $(this).attr("class", "");
            }
        });
    }


    if (this.template.itemSelecClass != null) {
        $(".euiSelectList li", this.visualElement).each(function(idx) {
            $(this).removeClass();
            if (idx == $("option:selected", self.formElement).index()) {
                $(this).attr("class", self.template.itemSelecClass);
            }
            else {
                $(this).attr("class", "");
            }
        });
    }

    if ($(this.formElement).prop("disabled")) {
        $(".euiSelectMain", this.visualElement).addClass("disabled");
        if($(".euiSelectMain", this.visualElement).find("button").length > 0){
            $(".euiSelectMain", this.visualElement).find("button").prop("disabled", true);
        }
    }
    else {
        $(".euiSelectMain", this.visualElement).removeClass("disabled");
        if($(".euiSelectMain", this.visualElement).find("button").length > 0){
            $(".euiSelectMain", this.visualElement).find("button").prop("disabled", false);
        }
    }
};

efusioni.ui.Select.prototype._setBaseListener = function() {
    var self = this;

    /*mouseOver시 펼침을 선택했을 때*/
    if (this.template.isMouseOverFolding != null && this.template.isMouseOverFolding) {
        /*Select Box 기본 Folding */
        $(self.visualElement).mouseenter(function() {
            if (!$(self.formElement).prop("disabled")) {
                for (var i=0; i<efusioni.ui.UIManager.size(); i++) {
                    var obj = efusioni.ui.UIManager.get(i);

                    if (obj.type == "SELECT") {
                        if (self.euiIdx == obj.euiIdx) {
                            if($(".euiSelectMain", self.visualElement).hasClass("on")){
                                $(self.visualElement).css("z-index", self.zIndex);
                                $(".euiSelectList", self.visualElement).hide();
                                $(".euiSelectMain", self.visualElement).removeClass("on");
                            } else {
                                $(self.visualElement).css("z-index", efusioni.ui.UIManager.MAX_ZINDEX);
                                $(".euiSelectList", self.visualElement).show();
                                $(".euiSelectMain", self.visualElement).addClass("on");
                            }
                        }
                        else {
                            /*자신외의 다른 SelectBox들은 클릭시 list item을 닫아줘야 한다.*/
                            $(obj.visualElement).css("z-index", self.zIndex);
                            $(".euiSelectList", obj.visualElement).hide();
                            $(".euiSelectMain", obj.visualElement).removeClass("on");
                        }
                    }
                }
            }
        });

        $(self.visualElement).mouseleave(function() {
            if (!$(self.formElement).prop("disabled")) {
                $(".euiSelectList", self.visualElement).hide();
                $(".euiSelectMain", self.visualElement).removeClass("on");
            }
        });
    }
};

efusioni.ui.Select.prototype._setTitleListener = function() {
    var self = this;
    /*Select Box 기본 Folding */
    if (this.template.isMouseOverFolding == null || !this.template.isMouseOverFolding) {
        /*Select Box 기본 Folding */
        $(".euiSelectMain", self.visualElement).click(function(e) {
            if (!$(self.formElement).prop("disabled")) {
                for (var i=0; i<efusioni.ui.UIManager.size(); i++) {
                    var obj = efusioni.ui.UIManager.get(i);
                    if (obj.type == "SELECT") {
                        if (self.euiIdx == obj.euiIdx) {
                            if($(".euiSelectMain", self.visualElement).hasClass("on")){
                                $(self.visualElement).css("z-index", self.zIndex);
                                $(".euiSelectList", self.visualElement).hide();
                                $(".euiSelectMain", self.visualElement).removeClass("on");
                            } else {
                                $(self.visualElement).css("z-index", efusioni.ui.UIManager.MAX_ZINDEX);
                                $(".euiSelectList", self.visualElement).show();
                                $(".euiSelectMain", self.visualElement).addClass("on");
                            }
                        }
                        else {
                            /*자신외의 다른 SelectBox들은 클릭시 list item을 닫아줘야 한다.*/
                            $(obj.visualElement).css("z-index", self.zIndex);
                            $(".euiSelectList", obj.visualElement).hide();
                            $(".euiSelectMain", obj.visualElement).removeClass("on");
                        }
                    }
                }
            }
            e.preventDefault();
        });
    }
};

efusioni.ui.Select.prototype._setItemListener = function() {
    var self = this;
    /*Item을 클릭했을때, 원본 SelectBox의 이벤트를 Simulate*/
    $(".euiSelectList li button", self.visualElement).click(function(e) {
        if (!$(self.formElement).prop("disabled")) {
            /*onchange성격에 맞게 다른 Item을 클랙했을 경우만*/
            if (self.formElement.prop("selectedIndex") != $(this).parent().index()) {
                self.formElement.prop("selectedIndex", $(this).parent().index());
                self._setTitle();
                /*원본 SelectBox의 이벤트를 호출*/
                self.formElement.change();
            }
            $(".euiSelectList li button", self.visualElement).removeClass("on");
            $(this).addClass("on");
            $(".euiSelectList", self.visualElement).hide();
            $(".euiSelectMain", self.visualElement).removeClass("on");
        }
        e.preventDefault();
    });

    /*itemOn Class를 지정했을시 마우스 over 효과*/
    if (this.template.itemOnClass != null) {
        if (!$(self.formElement).prop("disabled")) {
            $(".euiSelectList li button", this.visualElement).mouseenter(function() {
                $(this).parent().attr("class", self.template.itemOnClass);
            });

            $(".euiSelectList li button", this.visualElement).mouseleave(function() {
                if ($(this).parent().index() != $("option:selected", self.formElement).index()) {
                    $(this).parent().attr("class", "");
                }
            });
        }
    }
};
//UI Select 선언 끝 --------------------------------------------------------
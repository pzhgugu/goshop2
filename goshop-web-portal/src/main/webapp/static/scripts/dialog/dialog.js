/**
 * @require shop:scripts/dialog/dialog.css
 */


__DIALOG_WRAPPER__ = {};

/* IE6有个Bug，如果不给定对话框的宽度的话，在IE6下，对话框将以100%宽度显示 */
DialogManager = {
    'create'        :function(id){
        var d = {};
        if (!__DIALOG_WRAPPER__[id])
        {
            d = new Dialog(id);
            __DIALOG_WRAPPER__[id] = d;
        }
        else
        {
            d = DialogManager.get(id);
        }
        return d;
    },
    'get'           :function(id){
        return __DIALOG_WRAPPER__[id];
    },
    'set'           :function(id, val){
        __DIALOG_WRAPPER__[id] = val;
    },    
    'close'         :function(id){
        if (__DIALOG_WRAPPER__[id].close())
        {
            __DIALOG_WRAPPER__[id] = null;
        }

    },
    'onClose'       :function (){
        return true;
    },
    /* 加载对话框样式 */
    'loadStyle'     :function(){
        var _dialog_js_path = $('#dialog_js').attr('src');
        var _path    = _dialog_js_path.split('/');
        
       var _dialog_css = _path.slice(0, _path.length - 1).join('/') + '/dialog.css';
        $('#dialog_js').after('<link href="' + _dialog_css + '" rel="stylesheet" type="text/css" />');
    }
};
ScreenLocker = {
    'style'     : {
        'position'          : 'absolute',
        'top'               : '0px',
        'left'              : '0px',
        'backgroundColor'   : 'transparent',
        'opacity'           : 0,
        'zIndex'            : 999
    },
    'masker'    : null,
    'lock'      : function(zIndex){
        if (this.masker !== null)
        {
            this.masker.width($(document).width()).height($(document).height());

            return true;
        }

        this.masker = $('<div id="dialog_manage_screen_locker"></div>');

        /* 样式 */
        this.masker.css(this.style);

        if (zIndex)
        {
            this.masker.css('zIndex', zIndex);
        }

        /* 整个文档的宽高 */
        this.masker.width($(document).width()).height($(document).height());

        $(document.body).append(this.masker);
        $("#dialog_manage_screen_locker").show();
    },
    'unlock'    : function(){
        if (this.masker === null)
        {
            return true;
        }
        this.masker.remove();
        this.masker = null;
    }
};

Dialog        = function (id){
    /* 构造函数生成对话框代码，并加入到文档中 */
    this.id = id;
    this.init();
};
Dialog.prototype = {
    /* 唯一标识 */
    'id'            : null,
    /* 文档对象 */
    'dom'           : null,
    'lastPos'       : null,
    'status'        : 'complete',
    'onClose'       : function (){
        return true;
    },
    'tmp'           : {},
    /* 初始化 */
    'init'          : function(){
        this.dom = {'wrapper' : null, 'body':null, 'head':null, 'title':null, 'close_button':null, 'content':null};

        /* 创建外层容器 */
        this.dom.wrapper        = $('<div id="fwin_' + this.id + '" class="dialog_wrapper"></div>').get(0);

        /* 创建对话框主体 */
        this.dom.body           = $('<div class="dialog_body"></div>').get(0);

        /* 创建标题栏 */
        this.dom.head           = $('<h3 class="dialog_head"></h3>').get(0);

        /* 创建标题文本 */
        this.dom.title          = $('<span class="dialog_title_icon"></span>').get(0);

        /* 创建关闭按钮 */
        this.dom.close_button   = $('<span class="dialog_close_button">X</span>').get(0);

        /* 创建内容区域 */
        this.dom.content        = $('<div class="dialog_content"></div>').get(0);

        /* 组合 */
        $(this.dom.head).append($('<span class="dialog_title"></span>').append(this.dom.title)).append(this.dom.close_button);
        $(this.dom.body).append(this.dom.head).append(this.dom.content);
        $(this.dom.wrapper).append(this.dom.body).append('<div style="clear:both; display:block;"></div>');

        /* 初始化样式 */
        $(this.dom.wrapper).css({
            'zIndex'            : 1100,
            'display'           : 'none',
            'position'          : 'absolute'
        });
        $(this.dom.body).css({
            'position'  :   'relative'
        });
        $(this.dom.head).css({
            'cursor'     : 'move'
        });       
        $(this.dom.content).css({
            'margin'     : '0px',
            'padding'    : '0px'
        });

        var self = this;

        /* 初始化组件事件 */
        $(this.dom.close_button).click(function(){
            DialogManager.close(self.id);
        });

        /* 可拖放 */
//        if(typeof draggable != 'undefined'){
            
//			$(this.dom.wrapper).draggable({
//                'handle' : this.dom.head
//            });
//        }

        /* 放入文档流 */
        $(document.body).append(this.dom.wrapper);
    },

    /* 隐藏 */
    'hide'          : function(){
        $(this.dom.wrapper).hide();
    },

    /* 显示 */
    'show'          : function(pos,lock){
        if (pos)
        {
            this.setPosition(pos);
        }

        /* 锁定屏幕 */
        if (lock == 1) ScreenLocker.lock(999);
		//$(this.dom.wrapper).draggable({
        //    'handle' : this.dom.head
        //});

        /* 显示对话框 */
        $(this.dom.wrapper).show();
    },

    /* 关闭 */
    'close'         : function(lock){
        if (!this.onClose())
        {
            return false;
        }
        /* 关闭对话框 */
        $(this.dom.wrapper).remove();

        /* 解锁屏幕 */
        if (typeof lock == 'undefined'){
        	ScreenLocker.unlock();
        }
		DialogManager.set(this.id,null);
        return true;
    },

    /* 对话框标题 */
    'setTitle'      : function(title){
        $(this.dom.title).html(title);
    },

    /* 改变对话框内容 */
    'setContents'   : function(type, options){
        contents = this.createContents(type, options);
        if (typeof(contents) == 'string')
        {
            $(this.dom.content).html(contents);
        }
        else
        {
            $(this.dom.content).empty();
            $(this.dom.content).append(contents);
        }
    },

    /* 设置对话框样式 */
    'setStyle'      : function(style){
        if (typeof(style) == 'object')
        {
            /* 否则为CSS */
            $(this.dom.wrapper).css(style);
        }
        else
        {
            /* 如果是字符串，则认为是样式名 */
            $(this.dom.wrapper).addClass(style);
        }
    },
    'setWidth'      : function(width){
        this.setStyle({'width' : width + 'px'});
    },
    'setHeight'     : function(height){
        this.setStyle({'height' : height + 'px'});
    },

    /* 生成对话框内容 */
    'createContents'  : function(type, options){
        var _html = '',
            self  = this,
            status= 'complete';
        if (!options)
        {
            /* 如果只有一个参数，则认为其传递的是HTML字符串 */
            this.setStatus(status);
            return type;
        }
        switch(type){
            case 'ajax':
                /* 通过Ajax取得HTML，显示到页面上，此过程是异步的 */
                $.get(options, function(data){
                    self.setContents(data);
                    /* 使用上次定位重新定位窗口位置 */
                    self.setPosition(self.lastPos);
                });
                /* 先提示正在加载 */
                _html = this.createContents('loading', {'text' : 'loading...'});
            break;
			case 'ajax_notice':
                /* 通过Ajax取得HTML，显示到页面上，此过程是异步的 */
                $.get(options, function(data) {
                var json = eval('(' + data + ')');
                var MsgTxt = '<div class="dialog_message_body"></div><div class="dialog_message_contents dialog_message_notice">' + json.Msg + '</div><div class="dialog_buttons_bar"></div>'
                self.setContents(MsgTxt);
                    /* 使用上次定位重新定位窗口位置 */
                    self.setPosition(self.lastPos);
                });
                /* 先提示正在加载 */
                _html = this.createContents('loading', { 'text': '正在处理...' });
                break;            
            /* 以下是内置的几种对话框类型 */
            case 'loading':
                _html = '<div class="dialog_loading"><div class="dialog_loading_text">' + options.text + '</div></div>';
                status = 'loading';
            break;
            case 'message':
                var type = 'notice';
                if (options.type)
                {
                    type = options.type;
                }
                _message_body = $('<div class="dialog_message_body"></div>');
                _message_contents = $('<div class="dialog_message_contents dialog_message_' + type + '">' + options.text + '</div>');
                _buttons_bar = $('<div class="dialog_buttons_bar"></div>');
                switch (type){
                    case 'notice':
                    case 'warning':
                        var button_name = '确定';
                        if (options.button_name)
                        {
                            button_name = options.button_name;
                        }
                        _ok_button = $('<input type="button" class="btn1" value="' + button_name + '" />');
                        $(_ok_button).click(function(){
                            if (options.onclick)
                            {
                                if(!options.onclick.call())
                                {
                                    return;
                                }
                            }
                            DialogManager.close(self.id);
                        });
                        $(_buttons_bar).append(_ok_button);
                    break;
                    case 'confirm':
                        var yes_button_name = "确定";
                        var no_button_name = "取消";
                        if (options.yes_button_name)
                        {
                            yes_button_name = options.yes_button_name;
                        }
                        if (options.no_button_name)
                        {
                            no_button_name = options.no_button_name;
                        }
                        _yes_button = $('<input type="button" class="btn1" value="' + yes_button_name + '" />');
                        _no_button = $('<input type="button" class="btn2" value="' + no_button_name + '" />');
                        $(_yes_button).click(function(){
                            if (options.onClickYes)
                            {
                                if (options.onClickYes.call() === false)
                                {
                                    return;
                                }
                            }
                            DialogManager.close(self.id);
                        });
                        $(_no_button).click(function(){
                            if (options.onClickNo)
                            {
                                if (!options.onClickNo.call())
                                {
                                    return;
                                }
                            }
                            DialogManager.close(self.id);
                        });
                        $(_buttons_bar).append(_yes_button).append(_no_button);
                    break;
                }
                _html = $(_message_body).append(_message_contents).append(_buttons_bar);

            break;
        }
        this.setStatus(status);

        return _html;
    },
    /* 定位 */
    'setPosition'   : function(pos){
        /* 上次定位 */
        this.lastPos = pos;
        if (typeof(pos) == 'string')
        {
            switch(pos){
                case 'center':
                    var left = 0;
                    var top  = 0;
                    var dialog_width    = $(this.dom.wrapper).width();
                    var dialog_height   = $(this.dom.wrapper).height();


                    /* left=滚动条的宽度  + (当前可视区的宽度 - 对话框的宽度 ) / 2 */
                    left = $(window).scrollLeft() + ($(window).width() - dialog_width) / 2;

                    /* top =滚动条的高度  + (当前可视区的高度 - 对话框的高度 ) / 2 */
                    var t =  ($(window).height() - dialog_height)>0?($(window).height() - dialog_height):100;
                    top  = $(window).scrollTop()  + t/ 2;
                    //top = $(window).scrollTop() +(document.clientHeight-dialog_height)/2
                    $(this.dom.wrapper).css({left:left + 'px', top:top + 'px'});
                break;
            }
        }
        else
        {
            var _pos = {};
            if (typeof(pos.left) != 'undefined')
            {
                _pos.left = pos.left;
            }
            if (typeof(pos.top)  != 'undefined')
            {
                _pos.top  = pos.top;
            }
            $(this.dom.wrapper).css(_pos);
        }

    },
    /* 设置状态 */
    'setStatus' : function(code){
        this.status = code;
    },
    /* 获取状态 */
    'getStatus' : function(){
        return this.status;
    },
    'disableClose' : function(msg){
        this.tmp['oldOnClose'] = this.onClose;
        this.onClose = function(){
            if(msg)alert(msg);
            return false;
        };
    },
    'enableClose'  : function(){
        this.onClose = this.tmp['oldOnClose'];
        this.tmp['oldOnClose'] = null;
    }
};

DialogManager.loadStyle();

/*common2.2.js*/
DIALOGIMGDIR  = SITEURL+"/"+'resource/js/dialog/images/dialog';

var BROWSER = {};
var USERAGENT = navigator.userAgent.toLowerCase();
browserVersion({'ie':'msie','firefox':'','chrome':'','opera':'','safari':'','mozilla':'','webkit':'','maxthon':'','qq':'qqbrowser'});
if(BROWSER.safari) {
	BROWSER.firefox = true;
}
BROWSER.opera = BROWSER.opera ? opera.version() : 0;

HTMLNODE = document.getElementsByTagName('head')[0].parentNode;
if(BROWSER.ie) {
	BROWSER.iemode = parseInt(typeof document.documentMode != 'undefined' ? document.documentMode : BROWSER.ie);
	HTMLNODE.className = 'ie_all ie' + BROWSER.iemode;
}

var JSLOADED = [];
var JSMENU = [];
JSMENU['active'] = [];
JSMENU['timer'] = [];
JSMENU['drag'] = [];
JSMENU['layer'] = 0;
JSMENU['zIndex'] = {'win':1000,'menu':1100,'dialog':1200,'prompt':1300};
JSMENU['float'] = '';
var CURRENTSTYPE = null;
var EXTRAFUNC = [], EXTRASTR = '';

if(BROWSER.firefox && window.HTMLElement) {
	HTMLElement.prototype.__defineGetter__( "innerText", function(){
		var anyString = "";
		var childS = this.childNodes;
		for(var i=0; i <childS.length; i++) {
			if(childS[i].nodeType==1) {
				anyString += childS[i].tagName=="BR" ? '\n' : childS[i].innerText;
			} else if(childS[i].nodeType==3) {
				anyString += childS[i].nodeValue;
			}
		}
		return anyString;
	});
	HTMLElement.prototype.__defineSetter__( "innerText", function(sText){
		this.textContent=sText;
	});
	HTMLElement.prototype.__defineSetter__('outerHTML', function(sHTML) {
			var r = this.ownerDocument.createRange();
		r.setStartBefore(this);
		var df = r.createContextualFragment(sHTML);
		this.parentNode.replaceChild(df,this);
		return sHTML;
	});

	HTMLElement.prototype.__defineGetter__('outerHTML', function() {
		var attr;
		var attrs = this.attributes;
		var str = '<' + this.tagName.toLowerCase();
		for(var i = 0;i < attrs.length;i++){
			attr = attrs[i];
			if(attr.specified)
			str += ' ' + attr.name + '="' + attr.value + '"';
		}
		if(!this.canHaveChildren) {
			return str + '>';
		}
		return str + '>' + this.innerHTML + '</' + this.tagName.toLowerCase() + '>';
		});

	HTMLElement.prototype.__defineGetter__('canHaveChildren', function() {
		switch(this.tagName.toLowerCase()) {
			case 'area':case 'base':case 'basefont':case 'col':case 'frame':case 'hr':case 'img':case 'br':case 'input':case 'isindex':case 'link':case 'meta':case 'param':
			return false;
			}
		return true;
	});
}

function $$(id) {
	return !id ? null : document.getElementById(id);
}

function _attachEvent(obj, evt, func, eventobj) {
	eventobj = !eventobj ? obj : eventobj;
	if(obj.addEventListener) {
		obj.addEventListener(evt, func, false);
	} else if(eventobj.attachEvent) {
		obj.attachEvent('on' + evt, func);
	}
}

function browserVersion(types) {
	var other = 1;
	for(i in types) {
		var v = types[i] ? types[i] : i;
		if(USERAGENT.indexOf(v) != -1) {
			var re = new RegExp(v + '(\\/|\\s)([\\d\\.]+)', 'ig');
			var matches = re.exec(USERAGENT);
			var ver = matches != null ? matches[2] : 0;
			other = ver !== 0 && v != 'mozilla' ? 0 : other;
		}else {
			var ver = 0;
		}
		eval('BROWSER.' + i + '= ver');
	}
	BROWSER.other = other;
}

function getEvent() {
	if(document.all) return window.event;
	func = getEvent.caller;
	while(func != null) {
		var arg0 = func.arguments[0];
		if (arg0) {
			if((arg0.constructor  == Event || arg0.constructor == MouseEvent) || (typeof(arg0) == "object" && arg0.preventDefault && arg0.stopPropagation)) {
				return arg0;
			}
		}
		func=func.caller;
	}
	return null;
}

function isUndefined(variable) {
	return typeof variable == 'undefined' ? true : false;
}

function in_array(needle, haystack) {
	if(typeof needle == 'string' || typeof needle == 'number') {
		for(var i in haystack) {
			if(haystack[i] == needle) {
					return true;
			}
		}
	}
	return false;
}

function strlen(str) {
	return (BROWSER.ie && str.indexOf('\n') != -1) ? str.replace(/\r?\n/g, '_').length : str.length;
}

function Ajax(recvType, waitId) {

	var aj = new Object();

	aj.loading = '请稍候...';
	aj.recvType = recvType ? recvType : 'XML';
	aj.waitId = waitId ? $$(waitId) : null;

	aj.resultHandle = null;
	aj.sendString = '';
	aj.targetUrl = '';

	aj.setLoading = function(loading) {
		if(typeof loading !== 'undefined' && loading !== null) aj.loading = loading;
	};

	aj.setRecvType = function(recvtype) {
		aj.recvType = recvtype;
	};

	aj.setWaitId = function(waitid) {
		aj.waitId = typeof waitid == 'object' ? waitid : $$(waitid);
	};

	aj.createXMLHttpRequest = function() {
		var request = false;
		if(window.XMLHttpRequest) {
			request = new XMLHttpRequest();
			if(request.overrideMimeType) {
				request.overrideMimeType('text/xml');
			}
		} else if(window.ActiveXObject) {
			var versions = ['Microsoft.XMLHTTP', 'MSXML.XMLHTTP', 'Microsoft.XMLHTTP', 'Msxml2.XMLHTTP.7.0', 'Msxml2.XMLHTTP.6.0', 'Msxml2.XMLHTTP.5.0', 'Msxml2.XMLHTTP.4.0', 'MSXML2.XMLHTTP.3.0', 'MSXML2.XMLHTTP'];
			for(var i=0; i<versions.length; i++) {
				try {
					request = new ActiveXObject(versions[i]);
					if(request) {
						return request;
					}
				} catch(e) {}
			}
		}
		return request;
	};

	aj.XMLHttpRequest = aj.createXMLHttpRequest();
	aj.showLoading = function() {
		if(aj.waitId && (aj.XMLHttpRequest.readyState != 4 || aj.XMLHttpRequest.status != 200)) {
			aj.waitId.style.display = '';
			aj.waitId.innerHTML = '<span><img src="' + DIALOGIMGDIR + '/loading.gif" class="vm"> ' + aj.loading + '</span>';
		}
	};

	aj.processHandle = function() {
		if(aj.XMLHttpRequest.readyState == 4 && aj.XMLHttpRequest.status == 200) {
			if(aj.waitId) {
				aj.waitId.style.display = 'none';
			}
			if(aj.recvType == 'HTML') {
				aj.resultHandle(aj.XMLHttpRequest.responseText, aj);
			} else if(aj.recvType == 'XML') {
				if(!aj.XMLHttpRequest.responseXML || !aj.XMLHttpRequest.responseXML.lastChild || aj.XMLHttpRequest.responseXML.lastChild.localName == 'parsererror') {
					aj.resultHandle('<a href="' + aj.targetUrl + '" target="_blank" style="color:red">内部错误，无法显示此内容</a>' , aj);
				} else {
					aj.resultHandle(aj.XMLHttpRequest.responseXML.lastChild.firstChild.nodeValue, aj);
				}
			}
		}
	};

	aj.get = function(targetUrl, resultHandle) {
		targetUrl = hostconvert(targetUrl);
		setTimeout(function(){aj.showLoading()}, 250);
		aj.targetUrl = targetUrl;
		aj.XMLHttpRequest.onreadystatechange = aj.processHandle;
		aj.resultHandle = resultHandle;
		var attackevasive = isUndefined(attackevasive) ? 0 : attackevasive;
		if(window.XMLHttpRequest) {
			aj.XMLHttpRequest.open('GET', aj.targetUrl);
			aj.XMLHttpRequest.setRequestHeader('X-Requested-With', 'XMLHttpRequest');
			aj.XMLHttpRequest.send(null);
		} else {
			aj.XMLHttpRequest.open("GET", targetUrl, true);
			aj.XMLHttpRequest.setRequestHeader('X-Requested-With', 'XMLHttpRequest');
			aj.XMLHttpRequest.send();
		}
	};
	aj.post = function(targetUrl, sendString, resultHandle) {
		targetUrl = hostconvert(targetUrl);
		setTimeout(function(){aj.showLoading()}, 250);
		aj.targetUrl = targetUrl;
		aj.sendString = sendString;
		aj.XMLHttpRequest.onreadystatechange = aj.processHandle;
		aj.resultHandle = resultHandle;
		aj.XMLHttpRequest.open('POST', targetUrl);
		aj.XMLHttpRequest.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
		aj.XMLHttpRequest.setRequestHeader('X-Requested-With', 'XMLHttpRequest');
		aj.XMLHttpRequest.send(aj.sendString);
	};
	return aj;
}

function getHost(url) {
	var host = "null";
	if(typeof url == "undefined"|| null == url) {
		url = window.location.href;
	}
	var regex = /^\w+\:\/\/([^\/]*).*/;
	var match = url.match(regex);
	if(typeof match != "undefined" && null != match) {
		host = match[1];
	}
	return host;
}

function hostconvert(url) {
	if(!url.match(/^http?:\/\//)) url = SITEURL.replace(/(\/+)$/g, '') + '/' + url;
	var url_host = getHost(url);
	var cur_host = getHost().toLowerCase();
	if(url_host && cur_host != url_host) {
		url = url.replace(url_host, cur_host);
	}
	return url;
}

function newfunction(func) {
	var args = [];
	for(var i=1; i<arguments.length; i++) args.push(arguments[i]);
	return function(event) {
		doane(event);
		window[func].apply(window, args);
		return false;
	}
}

function evalscript(s) {
	if(s.indexOf('<script') == -1) return s;
	var p = /<script[^\>]*?>([^\x00]*?)<\/script>/ig;
	var arr = [];
	while(arr = p.exec(s)) {
		var p1 = /<script[^\>]*?src=\"([^\>]*?)\"[^\>]*?(reload=\"1\")?(?:charset=\"([\w\-]+?)\")?><\/script>/i;
		var arr1 = [];
		arr1 = p1.exec(arr[0]);
		if(arr1) {
			appendscript(arr1[1], '', arr1[2], arr1[3]);
		} else {
			p1 = /<script(.*?)>([^\x00]+?)<\/script>/i;
			arr1 = p1.exec(arr[0]);
			appendscript('', arr1[2], arr1[1].indexOf('reload=') != -1);
		}
	}
	return s;
}

var evalscripts = [];

function appendscript(src, text, reload, charset) {
	var id = hash(src + text);
	if(!reload && in_array(id, evalscripts)) return;
	if(reload && $$(id)) {
		$$(id).parentNode.removeChild($$(id));
	}

	evalscripts.push(id);
	var scriptNode = document.createElement("script");
	scriptNode.type = "text/javascript";
	scriptNode.id = id;
	scriptNode.charset = charset ? charset : (BROWSER.firefox ? document.characterSet : document.charset);
	try {
		if(src) {
			scriptNode.src = src;
			scriptNode.onloadDone = false;
			scriptNode.onload = function () {
				scriptNode.onloadDone = true;
				JSLOADED[src] = 1;
			};
			scriptNode.onreadystatechange = function () {
				if((scriptNode.readyState == 'loaded' || scriptNode.readyState == 'complete') && !scriptNode.onloadDone) {
					scriptNode.onloadDone = true;
					JSLOADED[src] = 1;
				}
			};
		} else if(text){
			scriptNode.text = text;
		}
		document.getElementsByTagName('head')[0].appendChild(scriptNode);
	} catch(e) {}
}

function ajaxupdateevents(obj, tagName) {
	tagName = tagName ? tagName : 'A';
	var objs = obj.getElementsByTagName(tagName);
	for(k in objs) {
		var o = objs[k];
		ajaxupdateevent(o);
	}
}

function ajaxupdateevent(o) {
	if(typeof o == 'object' && o.getAttribute) {
		if(o.getAttribute('ajaxtarget')) {
			if(!o.id) o.id = Math.random();
			var ajaxevent = o.getAttribute('ajaxevent') ? o.getAttribute('ajaxevent') : 'click';
			var ajaxurl = o.getAttribute('ajaxurl') ? o.getAttribute('ajaxurl') : o.href;
			_attachEvent(o, ajaxevent, newfunction('ajaxget', ajaxurl, o.getAttribute('ajaxtarget'), o.getAttribute('ajaxwaitid'), o.getAttribute('ajaxloading'), o.getAttribute('ajaxdisplay')));
			if(o.getAttribute('ajaxfunc')) {
				o.getAttribute('ajaxfunc').match(/(\w+)\((.+?)\)/);
				_attachEvent(o, ajaxevent, newfunction(RegExp.$1, RegExp.$2));
			}
		}
	}
}

function ajaxget(url, showid, waitid, loading, display, recall) {
	waitid = typeof waitid == 'undefined' || waitid === null ? showid : waitid;
	var x = new Ajax();
	x.setLoading(loading);
	x.setWaitId(waitid);
	x.display = typeof display == 'undefined' || display == null ? '' : display;
	x.showId = $$(showid);

	if(url.substr(strlen(url) - 1) == '#') {
		url = url.substr(0, strlen(url) - 1);
		x.autogoto = 1;
	}

	var url = url + '&inajax=1&ajaxtarget=' + showid;
	x.get(url, function(s, x) {
		var evaled = false;
		if(s.indexOf('ajaxerror') != -1) {
			evalscript(s);
			evaled = true;
		}
		if(!evaled && (typeof ajaxerror == 'undefined' || !ajaxerror)) {
			if(x.showId) {
				x.showId.style.display = x.display;
				ajaxinnerhtml(x.showId, s);
				ajaxupdateevents(x.showId);
				if(x.autogoto) scroll(0, x.showId.offsetTop);
			}
		}

		ajaxerror = null;
		if(recall && typeof recall == 'function') {
			recall();
		} else if(recall) {
			eval(recall);
		}
		if(!evaled) evalscript(s);
	});
}

function ajaxpost(formid, showid, waitid, showidclass, submitbtn, recall) {
	var waitid = typeof waitid == 'undefined' || waitid === null ? showid : (waitid !== '' ? waitid : '');
	var showidclass = !showidclass ? '' : showidclass;
	var ajaxframeid = 'ajaxframe';
	var ajaxframe = $$(ajaxframeid);
	var formtarget = $$(formid).target;
	var handleResult = function() {
		var s = '';
		var evaled = false;

//		showloading('none');
		try {	
			s = $$(ajaxframeid).contentWindow.document.XMLDocument.text;
		} catch(e) {
			try {
				s = $$(ajaxframeid).contentWindow.document.documentElement.firstChild.wholeText;
			} catch(e) {
				try {
					s = $$(ajaxframeid).contentWindow.document.documentElement.firstChild.nodeValue;
				} catch(e) {
					s = '内部错误，无法显示此内容';
				}
			}
		}
		if( s != ''  && s.indexOf('ajaxerror') != -1) {
			evalscript(s);
			evaled = true;
		}
		if(showidclass) {
			if(showidclass != 'onerror') {
				$$(showid).className = showidclass;
			} else {
				showError(s);
				ajaxerror = true;
			}
		}
		if(submitbtn) {
			submitbtn.disabled = false;
		}
		if(!evaled && (typeof ajaxerror == 'undefined' || !ajaxerror)) {
			ajaxinnerhtml($$(showid), s);
		}
		ajaxerror = null;
		if($$(formid)) $$(formid).target = formtarget;
		if(typeof recall == 'function') {
			recall();
		} else {
			eval(recall);
		}
		if(!evaled) evalscript(s);
		ajaxframe.loading = 0;
		$$('append_parent').removeChild(ajaxframe.parentNode);
	};
	if(!ajaxframe) {
		var div = document.createElement('div');
		div.style.display = 'none';
		div.innerHTML = '<iframe name="' + ajaxframeid + '" id="' + ajaxframeid + '" loading="1"></iframe>';
		$$('append_parent').appendChild(div);
		ajaxframe = $$(ajaxframeid);
	} else if(ajaxframe.loading) {
		return false;
	}

	_attachEvent(ajaxframe, 'load', handleResult);

	//showloading();
	$$(formid).target = ajaxframeid;
	var action = $$(formid).getAttribute('action');
	action = hostconvert(action);
	$$(formid).action = action.replace(/\&inajax\=1/g, '')+'&inajax=1';
	$$(formid).submit();
	if(submitbtn) {
		submitbtn.disabled = true;
	}
	doane();
	return false;
}

function hash(string, length) {
	var length = length ? length : 32;
	var start = 0;
	var i = 0;
	var result = '';
	filllen = length - string.length % length;
	for(i = 0; i < filllen; i++){
		string += "0";
	}
	while(start < string.length) {
		result = stringxor(result, string.substr(start, length));
		start += length;
	}
	return result;
}

function stringxor(s1, s2) {
	var s = '';
	var hash = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
	var max = Math.max(s1.length, s2.length);
	for(var i=0; i<max; i++) {
		var k = s1.charCodeAt(i) ^ s2.charCodeAt(i);
		s += hash.charAt(k % 52);
	}
	return s;
}

function showloading(display, waiting) {
	var display = display ? display : 'block';
	var waiting = waiting ? waiting : '请稍候...';
	$$('ajaxwaitid').innerHTML = waiting;
	$$('ajaxwaitid').style.display = display;
}

function ajaxinnerhtml(showid, s) {
	if(showid.tagName != 'TBODY') {
		showid.innerHTML = s;
	} else {
		while(showid.firstChild) {
			showid.firstChild.parentNode.removeChild(showid.firstChild);
		}
		var div1 = document.createElement('DIV');
		div1.id = showid.id+'_div';
		div1.innerHTML = '<table><tbody id="'+showid.id+'_tbody">'+s+'</tbody></table>';
		$$('append_parent').appendChild(div1);
		var trs = div1.getElementsByTagName('TR');
		var l = trs.length;
		for(var i=0; i<l; i++) {
			showid.appendChild(trs[0]);
		}
		var inputs = div1.getElementsByTagName('INPUT');
		var l = inputs.length;
		for(var i=0; i<l; i++) {
			showid.appendChild(inputs[0]);
		}
		div1.parentNode.removeChild(div1);
	}
}

function doane(event, preventDefault, stopPropagation) {
	var preventDefault = isUndefined(preventDefault) ? 1 : preventDefault;
	var stopPropagation = isUndefined(stopPropagation) ? 1 : stopPropagation;
	e = event ? event : window.event;
	if(!e) {
		e = getEvent();
	}
	if(!e) {
		return null;
	}
	if(preventDefault) {
		if(e.preventDefault) {
			e.preventDefault();
		} else {
			e.returnValue = false;
		}
	}
	if(stopPropagation) {
		if(e.stopPropagation) {
			e.stopPropagation();
		} else {
			e.cancelBubble = true;
		}
	}
	return e;
}

function showMenu(v) {
	var ctrlid = isUndefined(v['ctrlid']) ? v : v['ctrlid'];
	var showid = isUndefined(v['showid']) ? ctrlid : v['showid'];
	var menuid = isUndefined(v['menuid']) ? showid + '_menu' : v['menuid'];
	var ctrlObj = $$(ctrlid);
	var menuObj = $$(menuid);
	if(!menuObj) return;
	var mtype = isUndefined(v['mtype']) ? 'menu' : v['mtype'];
	var evt = isUndefined(v['evt']) ? 'mouseover' : v['evt'];
	var pos = isUndefined(v['pos']) ? '43' : v['pos'];
	var layer = isUndefined(v['layer']) ? 1 : v['layer'];
	var duration = isUndefined(v['duration']) ? 2 : v['duration'];
	var timeout = isUndefined(v['timeout']) ? 250 : v['timeout'];
	var maxh = isUndefined(v['maxh']) ? 600 : v['maxh'];
	var cache = isUndefined(v['cache']) ? 1 : v['cache'];
	var drag = isUndefined(v['drag']) ? '' : v['drag'];
	var dragobj = drag && $$(drag) ? $$(drag) : menuObj;
	var fade = isUndefined(v['fade']) ? 0 : v['fade'];
	var cover = isUndefined(v['cover']) ? 0 : v['cover'];
	var zindex = isUndefined(v['zindex']) ? JSMENU['zIndex']['menu'] : v['zindex'];
	var ctrlclass = isUndefined(v['ctrlclass']) ? '' : v['ctrlclass'];
	var winhandlekey = isUndefined(v['win']) ? '' : v['win'];
	zindex = cover ? zindex + 500 : zindex;
	if(typeof JSMENU['active'][layer] == 'undefined') {
		JSMENU['active'][layer] = [];
	}

	for(i in EXTRAFUNC['showmenu']) {
		try {
			eval(EXTRAFUNC['showmenu'][i] + '()');
		} catch(e) {}
	}

	if(evt == 'click' && in_array(menuid, JSMENU['active'][layer]) && mtype != 'win') {
		hideMenu(menuid, mtype);
		return;
	}
	if(mtype == 'menu') {
		hideMenu(layer, mtype);
	}

	if(ctrlObj) {
		if(!ctrlObj.getAttribute('initialized')) {
			ctrlObj.setAttribute('initialized', true);
			ctrlObj.unselectable = true;

			ctrlObj.outfunc = typeof ctrlObj.onmouseout == 'function' ? ctrlObj.onmouseout : null;
			ctrlObj.onmouseout = function() {
				if(this.outfunc) this.outfunc();
				if(duration < 3 && !JSMENU['timer'][menuid]) {
					JSMENU['timer'][menuid] = setTimeout(function () {
						hideMenu(menuid, mtype);
					}, timeout);
				}
			};

			ctrlObj.overfunc = typeof ctrlObj.onmouseover == 'function' ? ctrlObj.onmouseover : null;
			ctrlObj.onmouseover = function(e) {
				doane(e);
				if(this.overfunc) this.overfunc();
				if(evt == 'click') {
					clearTimeout(JSMENU['timer'][menuid]);
					JSMENU['timer'][menuid] = null;
				} else {
					for(var i in JSMENU['timer']) {
						if(JSMENU['timer'][i]) {
							clearTimeout(JSMENU['timer'][i]);
							JSMENU['timer'][i] = null;
						}
					}
				}
			};
		}
	}

	if(!menuObj.getAttribute('initialized')) {
		menuObj.setAttribute('initialized', true);
		menuObj.ctrlkey = ctrlid;
		menuObj.mtype = mtype;
		menuObj.layer = layer;
		menuObj.cover = cover;
		if(ctrlObj && ctrlObj.getAttribute('fwin')) {menuObj.scrolly = true;}
		menuObj.style.position = 'absolute';
		menuObj.style.zIndex = zindex + layer;
		menuObj.onclick = function(e) {
			return doane(e, 0, 1);
		};
		if(duration < 3) {
			if(duration > 1) {
				menuObj.onmouseover = function() {
					clearTimeout(JSMENU['timer'][menuid]);
					JSMENU['timer'][menuid] = null;
				};
			}
			if(duration != 1) {
				menuObj.onmouseout = function() {
					JSMENU['timer'][menuid] = setTimeout(function () {
						hideMenu(menuid, mtype);
					}, timeout);
				};
			}
		}
		if(cover) {
			var coverObj = document.createElement('div');
			coverObj.id = menuid + '_cover';
			coverObj.style.position = 'absolute';
			coverObj.style.zIndex = menuObj.style.zIndex - 1;
			coverObj.style.left = coverObj.style.top = '0px';
			coverObj.style.width = '100%';
			coverObj.style.height = Math.max(document.documentElement.clientHeight, document.body.offsetHeight) + 'px';
			coverObj.style.backgroundColor = 'transparent';
			coverObj.style.filter = 'progid:DXImageTransform.Microsoft.Alpha(opacity=0)';
			coverObj.style.opacity = 0;
			coverObj.onclick = function () { hideMenu(); };
			$$('append_parent').appendChild(coverObj);
			_attachEvent(window, 'load', function () {
				coverObj.style.height = Math.max(document.documentElement.clientHeight, document.body.offsetHeight) + 'px';
			}, document);
		}
	}
	if(drag) {
		dragobj.style.cursor = 'move';
		dragobj.onmousedown = function(event) {try{dragMenu(menuObj, event, 1);}catch(e){}};
	}

	if(cover) $$(menuid + '_cover').style.display = '';
	if(fade) {
		var O = 0;
		var fadeIn = function(O) {
			if(O > 100) {
				clearTimeout(fadeInTimer);
				return;
			}
			menuObj.style.filter = 'progid:DXImageTransform.Microsoft.Alpha(opacity=' + O + ')';
			menuObj.style.opacity = O / 100;
			O += 20;
			var fadeInTimer = setTimeout(function () {
				fadeIn(O);
			}, 40);
		};
		fadeIn(O);
		menuObj.fade = true;
	} else {
		menuObj.fade = false;
	}
	menuObj.style.display = '';
	if(ctrlObj && ctrlclass) {
		ctrlObj.className += ' ' + ctrlclass;
		menuObj.setAttribute('ctrlid', ctrlid);
		menuObj.setAttribute('ctrlclass', ctrlclass);
	}
	if(pos != '*') {
		setMenuPosition(showid, menuid, pos);
	}
	if(BROWSER.ie && BROWSER.ie < 7 && winhandlekey && $$('fwin_' + winhandlekey)) {
		$$(menuid).style.left = (parseInt($$(menuid).style.left) - parseInt($$('fwin_' + winhandlekey).style.left)) + 'px';
		$$(menuid).style.top = (parseInt($$(menuid).style.top) - parseInt($$('fwin_' + winhandlekey).style.top)) + 'px';
	}
	if(maxh && menuObj.scrollHeight > maxh) {
		menuObj.style.height = maxh + 'px';
		if(BROWSER.opera) {
			menuObj.style.overflow = 'auto';
		} else {
			menuObj.style.overflowY = 'auto';
		}
	}

	if(!duration) {
		setTimeout('hideMenu(\'' + menuid + '\', \'' + mtype + '\')', timeout);
	}

	if(!in_array(menuid, JSMENU['active'][layer])) JSMENU['active'][layer].push(menuid);
	menuObj.cache = cache;
	if(layer > JSMENU['layer']) {
		JSMENU['layer'] = layer;
	}
}
var dragMenuDisabled = false;
function dragMenu(menuObj, e, op) {
	e = e ? e : window.event;
	if(op == 1) {
		if(dragMenuDisabled || in_array(e.target ? e.target.tagName : e.srcElement.tagName, ['TEXTAREA', 'INPUT', 'BUTTON', 'SELECT'])) {
			return;
		}
		JSMENU['drag'] = [e.clientX, e.clientY];
		JSMENU['drag'][2] = parseInt(menuObj.style.left);
		JSMENU['drag'][3] = parseInt(menuObj.style.top);
		document.onmousemove = function(e) {try{dragMenu(menuObj, e, 2);}catch(err){}};
		document.onmouseup = function(e) {try{dragMenu(menuObj, e, 3);}catch(err){}};
		doane(e);
	}else if(op == 2 && JSMENU['drag'][0]) {
		var menudragnow = [e.clientX, e.clientY];
		menuObj.style.left = (JSMENU['drag'][2] + menudragnow[0] - JSMENU['drag'][0]) + 'px';
		menuObj.style.top = (JSMENU['drag'][3] + menudragnow[1] - JSMENU['drag'][1]) + 'px';
		menuObj.removeAttribute('top_');menuObj.removeAttribute('left_');
		doane(e);
	}else if(op == 3) {
		JSMENU['drag'] = [];
		document.onmousemove = null;
		document.onmouseup = null;
	}
}
function setMenuPosition(showid, menuid, pos) {
	var showObj = $$(showid);
	var menuObj = menuid ? $$(menuid) : $$(showid + '_menu');
	if(isUndefined(pos) || !pos) pos = '43';
	var basePoint = parseInt(pos.substr(0, 1));
	var direction = parseInt(pos.substr(1, 1));
	var important = pos.indexOf('!') != -1 ? 1 : 0;
	var sxy = 0, sx = 0, sy = 0, sw = 0, sh = 0, ml = 0, mt = 0, mw = 0, mcw = 0, mh = 0, mch = 0, bpl = 0, bpt = 0;

	if(!menuObj || (basePoint > 0 && !showObj)) return;
	if(showObj) {
		sxy = fetchOffset(showObj);
		sx = sxy['left'];
		sy = sxy['top'];
		sw = showObj.offsetWidth;
		sh = showObj.offsetHeight;
	}
	mw = menuObj.offsetWidth;
	mcw = menuObj.clientWidth;
	mh = menuObj.offsetHeight;
	mch = menuObj.clientHeight;

	switch(basePoint) {
		case 1:
			bpl = sx;
			bpt = sy;
			break;
		case 2:
			bpl = sx + sw;
			bpt = sy;
			break;
		case 3:
			bpl = sx + sw;
			bpt = sy + sh;
			break;
		case 4:
			bpl = sx;
			bpt = sy + sh;
			break;
	}
	switch(direction) {
		case 0:
			menuObj.style.left = (document.body.clientWidth - menuObj.clientWidth) / 2 + 'px';
			mt = (document.documentElement.clientHeight - menuObj.clientHeight) / 2;
			break;
		case 1:
			ml = bpl - mw;
			mt = bpt - mh;
			break;
		case 2:
			ml = bpl;
			mt = bpt - mh;
			break;
		case 3:
			ml = bpl;
			mt = bpt;
			break;
		case 4:
			ml = bpl - mw;
			mt = bpt;
			break;
	}
	var scrollTop = Math.max(document.documentElement.scrollTop, document.body.scrollTop);
	var scrollLeft = Math.max(document.documentElement.scrollLeft, document.body.scrollLeft);
	if(!important) {
		if(in_array(direction, [1, 4]) && ml < 0) {
			ml = bpl;
			if(in_array(basePoint, [1, 4])) ml += sw;
		} else if(ml + mw > scrollLeft + document.body.clientWidth && sx >= mw) {
			ml = bpl - mw;
			if(in_array(basePoint, [2, 3])) {
				ml -= sw;
			} else if(basePoint == 4) {
				ml += sw;
			}
		}
		if(in_array(direction, [1, 2]) && mt < 0) {
			mt = bpt;
			if(in_array(basePoint, [1, 2])) mt += sh;
		} else if(mt + mh > scrollTop + document.documentElement.clientHeight && sy >= mh) {
			mt = bpt - mh;
			if(in_array(basePoint, [3, 4])) mt -= sh;
		}
	}
	if(pos.substr(0, 3) == '210') {
		ml += 69 - sw / 2;
		mt -= 5;
		if(showObj.tagName == 'TEXTAREA') {
			ml -= sw / 2;
			mt += sh / 2;
		}
	}
	if(direction == 0 || menuObj.scrolly) {
		if(BROWSER.ie && BROWSER.ie < 7) {
			if(direction == 0) mt += scrollTop;
		} else {
			if(menuObj.scrolly) mt -= scrollTop;
			menuObj.style.position = 'fixed';
		}
	}
	if(ml) menuObj.style.left = ml + 'px';
	if(mt) menuObj.style.top = mt + 'px';
	if(direction == 0 && BROWSER.ie && !document.documentElement.clientHeight) {
		menuObj.style.position = 'absolute';
		menuObj.style.top = (document.body.clientHeight - menuObj.clientHeight) / 2 + 'px';
	}
	if(menuObj.style.clip && !BROWSER.opera) {
		menuObj.style.clip = 'rect(auto, auto, auto, auto)';
	}
}

function hideMenu(attr, mtype) {
	attr = isUndefined(attr) ? '' : attr;
	mtype = isUndefined(mtype) ? 'menu' : mtype;
	if(attr == '') {
		for(var i = 1; i <= JSMENU['layer']; i++) {
			hideMenu(i, mtype);
		}
		return;
	} else if(typeof attr == 'number') {
		for(var j in JSMENU['active'][attr]) {
			hideMenu(JSMENU['active'][attr][j], mtype);
		}
		return;
	}else if(typeof attr == 'string') {
		var menuObj = $$(attr);
		if(!menuObj || (mtype && menuObj.mtype != mtype)) return;
		var ctrlObj = '', ctrlclass = '';
		if((ctrlObj = $$(menuObj.getAttribute('ctrlid'))) && (ctrlclass = menuObj.getAttribute('ctrlclass'))) {
			var reg = new RegExp(' ' + ctrlclass);
			ctrlObj.className = ctrlObj.className.replace(reg, '');
		}
		clearTimeout(JSMENU['timer'][attr]);
		var hide = function() {
			if(menuObj.cache) {
				if(menuObj.style.visibility != 'hidden') {
					menuObj.style.display = 'none';
					if(menuObj.cover) $$(attr + '_cover').style.display = 'none';
				}
			}else {
				menuObj.parentNode.removeChild(menuObj);
				if(menuObj.cover) $$(attr + '_cover').parentNode.removeChild($$(attr + '_cover'));
			}
			var tmp = [];
			for(var k in JSMENU['active'][menuObj.layer]) {
				if(attr != JSMENU['active'][menuObj.layer][k]) tmp.push(JSMENU['active'][menuObj.layer][k]);
			}
			JSMENU['active'][menuObj.layer] = tmp;
		};
		if(menuObj.fade) {
			var O = 100;
			var fadeOut = function(O) {
				if(O == 0) {
					clearTimeout(fadeOutTimer);
					hide();
					return;
				}
				menuObj.style.filter = 'progid:DXImageTransform.Microsoft.Alpha(opacity=' + O + ')';
				menuObj.style.opacity = O / 100;
				O -= 20;
				var fadeOutTimer = setTimeout(function () {
					fadeOut(O);
				}, 40);
			};
			fadeOut(O);
		} else {
			hide();
		}
	}
}

function getCurrentStyle(obj, cssproperty, csspropertyNS) {
	if(obj.style[cssproperty]){
		return obj.style[cssproperty];
	}
	if (obj.currentStyle) {
		return obj.currentStyle[cssproperty];
	} else if (document.defaultView.getComputedStyle(obj, null)) {
		var currentStyle = document.defaultView.getComputedStyle(obj, null);
		var value = currentStyle.getPropertyValue(csspropertyNS);
		if(!value){
			value = currentStyle[cssproperty];
		}
		return value;
	} else if (window.getComputedStyle) {
		var currentStyle = window.getComputedStyle(obj, "");
		return currentStyle.getPropertyValue(csspropertyNS);
	}
}

function fetchOffset(obj, mode) {
	var left_offset = 0, top_offset = 0, mode = !mode ? 0 : mode;

	if(obj.getBoundingClientRect && !mode) {
		var rect = obj.getBoundingClientRect();
		var scrollTop = Math.max(document.documentElement.scrollTop, document.body.scrollTop);
		var scrollLeft = Math.max(document.documentElement.scrollLeft, document.body.scrollLeft);
		if(document.documentElement.dir == 'rtl') {
			scrollLeft = scrollLeft + document.documentElement.clientWidth - document.documentElement.scrollWidth;
		}
		left_offset = rect.left + scrollLeft - document.documentElement.clientLeft;
		top_offset = rect.top + scrollTop - document.documentElement.clientTop;
	}
	if(left_offset <= 0 || top_offset <= 0) {
		left_offset = obj.offsetLeft;
		top_offset = obj.offsetTop;
		while((obj = obj.offsetParent) != null) {
			position = getCurrentStyle(obj, 'position', 'position');
			if(position == 'relative') {
				continue;
			}
			left_offset += obj.offsetLeft;
			top_offset += obj.offsetTop;
		}
	}
	return {'left' : left_offset, 'top' : top_offset};
}

var showDialogST = null;
function showDialog(msg, mode, t, func, cover, funccancel, leftmsg, confirmtxt, canceltxt, closetime, locationtime) {
	if (mode == 'js'){
		eval(func);
		hideMenu(null, 'dialog');
		return ;
	}

	clearTimeout(showDialogST);
	cover = isUndefined(cover) ? (mode == 'info' ? 0 : 1) : cover;
	leftmsg = isUndefined(leftmsg) ? '' : leftmsg;
	mode = in_array(mode, ['confirm', 'notice', 'info', 'succ']) ? mode : 'alert';
	var menuid = 'fwin_dialog';
	var menuObj = $$(menuid);
	var showconfirm = 1;
	confirmtxtdefault = '确定';
	closetime = isUndefined(closetime) ? '' : closetime;
	closefunc = function () {
		if(typeof func == 'function') func();
		else eval(func);
		hideMenu(menuid, 'dialog');
	};
	if(closetime) {
		leftmsg = closetime + ' 秒后窗口关闭';
		showDialogST = setTimeout(closefunc, closetime * 1000);
		showconfirm = 0;
	}
	locationtime = isUndefined(locationtime) ? '' : locationtime;
	if(locationtime) {
		leftmsg = locationtime + ' 秒后页面跳转';
		showDialogST = setTimeout(closefunc, locationtime * 1000);
		showconfirm = 0;
	}
	confirmtxt = confirmtxt ? confirmtxt : confirmtxtdefault;
	canceltxt = canceltxt ? canceltxt : '取消';

	if(menuObj) hideMenu('fwin_dialog', 'dialog');
	menuObj = document.createElement('div');
	menuObj.style.display = 'none';
	menuObj.className = 'dialog_body';
	menuObj.id = menuid;
	$$('append_parent').appendChild(menuObj);
	var hidedom = '';
	if(!BROWSER.ie) {
		hidedom = '<style type="text/css">object{visibility:hidden;}</style>';
	}
	var s = hidedom + '<h3 class="dialog_head"><span class="dialog_title">';
	s += t ? t : '<span class="dialog_title_icon">提示信息</span>';
	s += '</span><span class="dialog_close_button" id="fwin_dialog_close" onclick="hideMenu(\'' + menuid + '\', \'dialog\')" title="关闭">X</span></h3>';
	if(mode == 'info') {
		s += msg ? msg : '';
	} else {
		s += '<div class="eject_con"><div class="dialog_message_contents">';
		s += '<i class="' + (mode == 'alert' ? 'alert_error' : (mode == 'succ' ? 'alert_right' : 'alert_info')) + '"></i>' + msg + '</div></div>';
		s += '<div class="dialog_buttons_bar">' + (leftmsg ? '<time class="countdown">'+'<i class="icon-time"></i>' + leftmsg + '</time>' : '') + (showconfirm ? '<a href="javascript:void(0)" id="fwin_dialog_submit" class="dialog-bottom-btn dialog-bottom-btn mr10">'+confirmtxt+'</a>' : '');
		s += mode == 'confirm' ? '<a href="javascript:void(0)" id="fwin_dialog_cancel" class="dialog-bottom-btn" onclick="hideMenu(\'' + menuid + '\', \'dialog\')">'+canceltxt+'</a>' : '';
		s += '</div>';
	}
	menuObj.innerHTML = s;
	if($$('fwin_dialog_submit')) $$('fwin_dialog_submit').onclick = function() {
		if(typeof func == 'function') func();
		else eval(func);
		hideMenu(menuid, 'dialog');
	};
	if($$('fwin_dialog_cancel')) {
		$$('fwin_dialog_cancel').onclick = function() {
			if(typeof funccancel == 'function') funccancel();
			else eval(funccancel);
			hideMenu(menuid, 'dialog');
		};
		$$('fwin_dialog_close').onclick = $$('fwin_dialog_cancel').onclick;
	}
	showMenu({'mtype':'dialog','menuid':menuid,'duration':3,'pos':'00','zindex':JSMENU['zIndex']['dialog'],'cache':0,'cover':cover});
	try {
		if($$('fwin_dialog_submit')) $$('fwin_dialog_submit').focus();
	} catch(e) {}
}

function showSucc(msg) {
	var p = /<script[^\>]*?>([^\x00]*?)<\/script>/ig;
	msg = msg.replace(p, '');
	if(msg !== '') {
		showDialog(msg, 'succ', '提示信息', null, true, null, '', '', '', 3);
	}
}

function showError(msg) {
	var p = /<script[^\>]*?>([^\x00]*?)<\/script>/ig;
	msg = msg.replace(p, '');
	if(msg !== '') {
		showDialog(msg, 'alert', '错误信息', null, true, null, '', '', '', 3);
	}
}

function hideWindow(k, all, clear) {
	all = isUndefined(all) ? 1 : all;
	clear = isUndefined(clear) ? 1 : clear;
	hideMenu('fwin_' + k, 'win');
	if(clear && $$('fwin_' + k)) {
		$$('append_parent').removeChild($$('fwin_' + k));
	}
	if(all) {
		hideMenu();
	}
}

function ajax_get_confirm(msg, url){
	if (msg != ''){
		showDialog(msg, 'confirm', '', function(){ajaxget(url);});
	}else{
		ajaxget(url);
	}
}
function get_confirm(msg, url){
    if(msg != ''){
       showDialog(msg, 'confirm', '', function(){ window.location = url;});
    }else{
    	window.location = url;
    }
}

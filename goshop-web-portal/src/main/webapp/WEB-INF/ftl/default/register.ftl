<#assign S_URL=request.contextPath />
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta content="text/html; charset=UTF-8" http-equiv="Content-Type">
    <title>电商平台 - 用户注册</title>
    <meta content="" name="keywords">
    <meta content="" name="description">
    <meta content="GoShop" name="author">
    <meta content="GoShop" name="copyright">
    <style type="text/css">
        body {
            _behavior: url(${S_URL}/static/styles/csshover.htc);
        }
    </style>
    <link type="text/css" rel="stylesheet" href="${S_COMMON_URL}/styles/shop/base.css">
    <link type="text/css" rel="stylesheet" href="${S_COMMON_URL}/styles/shop/home_header.css">
    <link type="text/css" rel="stylesheet" href="${S_URL}/static/styles/home_login.css">
    <link rel="stylesheet" href="${S_URL}/static/styles/font-awesome/css/font-awesome.min.css">
    <!--[if IE 7]>
    <link rel="stylesheet" href="${S_URL}/static/styles/font-awesome/css/font-awesome-ie7.min.css">
    <![endif]-->
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="${S_COMMON_URL}/scripts/utils/html5shiv.js"></script>
    <script src="${S_COMMON_URL}/scripts/utils/respond.js"></script>
    <![endif]-->
    <!--[if IE 6]>
    <script src="${S_COMMON_URL}/scripts/utils/IE6_PNG.js"></script>
    <script>
        DD_belatedPNG.fix('.pngFix');
    </script>
    <script>
        // <![CDATA[
if((window.navigator.appName.toUpperCase().indexOf("MICROSOFT")>=0)&&(document.execCommand))
try{
document.execCommand("BackgroundImageCache", false, true);
   }
catch(e){}
// ]]>
</script>
<![endif]-->
    <script>
        var COOKIE_PRE = '5BF5_';
        var _CHARSET = 'utf-8';
        var SITEURL = '${S_URL}';
    </script>
    <script src="${S_COMMON_URL}/scripts/jquery/jquery.js"></script>
    <script src="${S_COMMON_URL}/scripts/jquery/jquery-browser.js"></script>
    <script src="${S_COMMON_URL}/scripts/shop/common.js"></script>
    <script src="${S_COMMON_URL}/scripts/jquery-ui/jquery.ui.js"></script>
    <script src="${S_COMMON_URL}/scripts/jquery/jquery.validation.js"></script>
    <script src="${S_COMMON_URL}/scripts/jquery/jquery.masonry.js"></script>
    <script charset="utf-8" id="dialog_js" src="${S_COMMON_URL}/scripts/dialog/dialog.js">
    </script>
    <link type="text/css" rel="stylesheet" href="${S_COMMON_URL}/scripts/dialog/dialog.css">

    <style type="text/css">
        <!--
        .STYLE1 {
            color: #FF0000;
            font-weight: bold;
            font-size: 24px;
        }

        -->
    </style>

</head>
<body>

<div id="append_parent"></div>
<div id="ajaxwaitid"></div>


<#include "simple_header.ftl"/>
<!-- PublicHeadLayout End -->


<style type="text/css">
    .public-top-layout, .head-app, .head-search-bar, .head-user-menu, .public-nav-layout, .nch-breadcrumb-layout, #faq {
        display: none !important;
    }

    .public-head-layout {
        margin: 10px auto -10px auto;
    }

    .wrapper {
        width: 1000px;
    }

    #footer {
        border-top: none !important;
        padding-top: 30px;
    }
</style>
<div class="nc-login-layout">
    <div class="nc-login">
        <div class="nc-login-title">
            <h3>用户注册</h3>
        </div>
        <div class="nc-login-content">
            <form action="register/save.html?for=json" method="post"
                  id="register_form">
                <input type="hidden" value="${S_TOKEN}" name="S_TOKEN">
                <dl>
                    <dt>用户名</dt>
                    <dd style="min-height:54px;">
                        <input type="text" title="3-20位字符，可由中文、英文、数字及“_”、“-”组成" class="text tip error" name="loginName"
                               id="loginName">
                        <label></label></dd>
                </dl>
                <dl>
                    <dt>设置密码</dt>
                    <dd style="min-height:54px;">
                        <input type="password" title="6-16位字符，可由英文、数字及标点符号组成" class="text tip error" name="password"
                               id="password">
                        <label></label></dd>
                </dl>
                <dl>
                    <dt>确认密码</dt>
                    <dd style="min-height:54px;">
                        <input type="password" title="请再次输入您的密码" class="text tip error" name="password_confirm"
                               id="password_confirm">
                        <label></label></dd>
                </dl>
                <dl>
                    <dt>邮箱</dt>
                    <dd style="min-height:54px;">
                        <input type="text" title="请输入常用的邮箱，将用来找回密码、接受订单通知等" class="text tip error" name="memberEmail"
                               id="memberEmail">
                        <label></label></dd>
                </dl>
                <dl>
                    <dt>验证码</dt>
                    <dd style="min-height:54px;">
                        <input type="text" title="请输入验证码，不区分大小写" size="10" maxlength="4" class="text w50 fl tip error"
                               name="captcha" id="captcha">
                        <img border="0" class="fl ml5" id="codeimage" name="codeimage" onclick="javascript:document.getElementById('codeimage').src='${S_URL}/validationCodeServlet.png?t=' + Math.random();"
                             src="${S_URL}/validationCodeServlet.png">
                        <a onclick="javascript:document.getElementById('codeimage').src='${S_URL}/validationCodeServlet.png?t=' + Math.random();"
                           class="ml5" href="javascript:void(0)">看不清，换一张</a>
                        <label></label></dd>
                </dl>
                <dl>
                    <dt>&nbsp;</dt>
                    <dd>
                        <input type="button" title="立即注册" class="submit" value="立即注册" id="Submit">
                        <input type="checkbox" checked="checked" value="1" id="clause" class="vm ml10 valid"
                               name="agree">
                        <span class="ml5" for="clause">阅读并同意<a title="阅读并同意" class="agreement" target="_blank"
                                                               href="#">服务协议</a></span>
                        <label></label>
                    </dd>
                </dl>
            </form>
            <div class="clear"></div>
        </div>
        <div class="nc-login-bottom"></div>
    </div>
    <div class="nc-login-left">
        <h3>注册之后您可以</h3>
        <ol>
            <li class="ico05"><i></i>购买商品支付订单</li>
            <li class="ico01"><i></i>申请开店销售商品</li>
            <li class="ico03"><i></i>空间好友推送分享</li>
            <li class="ico02"><i></i>收藏商品关注店铺</li>
            <li class="ico06"><i></i>商品咨询服务评价</li>
            <li class="ico04"><i></i>安全交易诚信无忧</li>
            <div class="clear"></div>
        </ol>
        <h3 class="mt20">如果您是本站用户</h3>

        <div class="nc-login-now mt10"><span class="ml20">我已经注册过帐号，立即<a class="register" title=""
                                                                        href="${S_URL}/login.html">登录</a></span><span>或是<a
                href="${S_URL}/forget_password.html" class="forget">找回密码？</a></span></div>
    </div>
</div>
<script charset="utf-8" src="${S_COMMON_URL}/scripts/jquery/jquery.poshytip.js" type="text/javascript"></script>
<script>

    //注册表单验证
    $(function () {
        $('#Submit').click(function () {
            if ($("#register_form").valid()) {
                ajaxpost('register_form', '', '', 'onerror');
            } else {
                document.getElementById('codeimage').src = '${S_URL}/validationCodeServlet.png?t=' + Math.random();
            }
        });
        jQuery.validator.addMethod("lettersonly", function (value, element) {
            return this.optional(element) || /^[^:%,'\*\"\s\<\>\&]+$/i.test(value);
        }, "Letters only please");
        jQuery.validator.addMethod("lettersmin", function (value, element) {
            return this.optional(element) || ($.trim(value.replace(/[^\u0000-\u00ff]/g, "aa")).length >= 3);
        }, "Letters min please");
        jQuery.validator.addMethod("lettersmax", function (value, element) {
            return this.optional(element) || ($.trim(value.replace(/[^\u0000-\u00ff]/g, "aa")).length <= 15);
        }, "Letters max please");
        $("#register_form").validate({
            errorPlacement: function (error, element) {
                var error_td = element.parent('dd');
                error_td.find('label').hide();
                error_td.append(error);
            },
            submitHandler: function (form) {
                ajaxpost('register_form', '', '', 'onerror')
            },
            rules: {
                loginName: {
                    required: true,
                    lettersmin: true,
                    lettersmax: true,
                    lettersonly: true,
                    remote: {
                        url: '${SHOP_REST_URL}/register/check/name',
                        type: 'get',
                        dataType:"jsonp",
                        data: {
                            value: function () {
                                return $('#loginName').val();
                            }
                        }
                    }
                },
                password: {
                    required: true,
                    minlength: 6,
                    maxlength: 20
                },
                password_confirm: {
                    required: true,
                    equalTo: '#password'
                },
                memberEmail: {
                    required: true,
                    email: true,
                    remote: {
                        url: '${SHOP_REST_URL}/register/check/email',
                        type: 'get',
                        dataType:"jsonp",
                        data: {
                            memberEmail: function () {
                                return $('#memberEmail').val();
                            }
                        }
                    }
                },
                captcha: {
                    required: true,
                    minlength: 4,
                    remote: {
                        url: '${S_URL}/register/check/captcha.html',
                        type: 'get',
                        data: {
                            captcha: function () {
                                return $('#captcha').val();
                            }
                        }
                    }
                },
                agree: {
                    required: true
                }
            },
            messages: {
                loginName: {
                    required: '用户名不能为空',
                    lettersmin: '用户名必须在3-15个字符之间',
                    lettersmax: '用户名必须在3-15个字符之间',
                    lettersonly: '用户名不能包含敏感字符',
                    remote: '该用户名已经存在'
                },
                password: {
                    required: '密码不能为空',
                    minlength: '密码长度应在6-20个字符之间',
                    maxlength: '密码长度应在6-20个字符之间'
                },
                password_confirm: {
                    required: '请再次输入您的密码',
                    equalTo: '两次输入的密码不一致'
                },
                memberEmail: {
                    required: '电子邮箱不能为空',
                    email: '这不是一个有效的电子邮箱',
                    remote: '该电子邮箱已经存在'
                },
                captcha: {
                    required: '请输入验证码',
                    minlength: '验证码不正确',
                    remote: '验证码不正确'
                },
                agree: {
                    required: '请阅读并同意该协议'
                }
            }
        });
    });
</script>


<#include "footer.ftl" />

</body>
</html>
<#assign S_URL=request.contextPath />
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml"><head>
    <meta content="text/html; charset=UTF-8" http-equiv="Content-Type">
    <title>电商</title>
    <script src="${S_URL}/static/scripts/jquery/jquery.js" type="text/javascript"></script>
    <script src="${S_URL}/static/scripts/jquery/jquery-browser.js"></script>
    <script src="${S_URL}/static/scripts/shop/common.js" type="text/javascript"></script>
    <script src="${S_URL}/static/scripts/jquery/jquery.tscookie.js" type="text/javascript"></script>
    <script src="${S_URL}/static/scripts/jquery/jquery.validation.js" type="text/javascript"></script>
    <link type="text/css" rel="stylesheet" href="${S_URL}/static/styles/login.css">
    <style type="text/css">
        body {
            background-color: #666666;
            background-image: url("");
            background-repeat: no-repeat;
            background-position: center top;
            background-attachment: fixed;
            background-clip: border-box;
            background-size: cover;
            background-origin: padding-box;
            width: 100%;
            padding: 0;
        }
    </style>
</head>
<body style="background-image: url('${S_URL}/static/images/login/bg_2.jpg');">

<div class="bg-dot"></div>
<div class="login-layout">
    <div class="top">
        <h5>GoShop【B2B2C】电商系统<em></em></h5>
        <h2>平台管理中心</h2>
        <h6>商城&nbsp;&nbsp;|&nbsp;&nbsp;资讯&nbsp;&nbsp;|&nbsp;&nbsp;圈子&nbsp;&nbsp;|&nbsp;&nbsp;微商城&nbsp;&nbsp;|&nbsp;&nbsp;统计</h6>
    </div>
    <div class="box">
        <form id="form_login" method="post">

      <span>
      <label>帐号</label>
      <input type="text" required="" class="input-text" autocomplete="off" id="username" name="username">
      </span> <span>
      <label>密码</label>
      <input type="password" title="密码不少于6个字符" pattern="[\S]{4}[\S]*" required="" autocomplete="off" class="input-password" id="password" name="password">
      </span> <span>
      <div class="code">
          <div class="arrow"></div>
          <div class="code-img">
              <img border="0" id="codeimage" name="codeimage" src="${S_URL}/validationCodeServlet.png">
          </div>
          <a title="关闭" class="close" id="hide" href="JavaScript:void(0);"><i></i></a>
          <a title="看不清,点击更换验证码" class="change" onclick="javascript:codeImage();" href="JavaScript:void(0);"><i></i></a> </div>
      <input type="text" value="" autocomplete="off" title="验证码为4个字符" pattern="[A-z0-9]{4}" placeholder="输入验证" id="captcha" class="input-code" required="" name="captcha">
      </span> <span>

      <input type="submit" value="登录" class="input-button" name="">
      </span>
        </form>
    </div>
</div>
<div class="bottom">
    <h5>Powered by GoShop</h5>
    <h6 title="">&copy; 2015-2016 <a target="_blank" href="#"></a></h6>
</div>
<script type="text/javascript">
    $(document).ready(function(){
        //Random background image
        var random_bg=Math.floor(Math.random()*4+1);
        var bg='url(${S_URL}/static/images/bg_'+random_bg+'.jpg)';
        $("body").css("background-image",bg);
        //Hide Show verification code
        $("#hide").click(function(){
            $(".code").fadeOut("slow");
        });
        $("#captcha").focus(function(){
            $(".code").fadeIn("fast");
        });
        //跳出框架在主窗口登录
        if(top.location!=this.location)	top.location=this.location;
        $('#username').focus();
        $("#captcha").nc_placeholder();
    });
    function codeImage(){
        $('#codeimage').attr("src",'${S_URL}/validationCodeServlet.png?t=' + Math.random());
    }
</script>
</body></html>

<#assign S_URL=request.contextPath />
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" content="text/html;" http-equiv="Content-Type">
    <title>我的家</title>
    <link href="${S_URL}/static/styles/skin_0.css" rel="stylesheet" type="text/css"/>
    <script src="${S_URL}/static/scripts/jquery/jquery.js" type="text/javascript"></script>
    <script src="${S_URL}/static/scripts/jquery/jquery.validation.js" type="text/javascript"></script>
    <script src="${S_URL}/static/scripts/jquery/jquery.cookie.js" type="text/javascript"></script>
    <!--[if lt IE 9]>
    <script src="${S_URL}/static/scripts/utils/html5shiv.js" type="text/javascript"></script>
    <script src="${S_URL}/static/scripts/utils/respond.min.js" type="text/javascript"></script>
    <![endif]-->

    <script>
        //
        $(document).ready(function () {
            $('span.bar-btn').click(function () {
                $('ul.bar-list').toggle('fast');
            });
        });

        $(document).ready(function () {
            var pagestyle = function () {
                var iframe = $("#workspace");
                var h = $(window).height() - iframe.offset().top;
                var w = $(window).width() - iframe.offset().left;
                if (h < 300) h = 300;
                if (w < 973) w = 973;
                iframe.height(h);
                iframe.width(w);
            }
            pagestyle();
            $(window).resize(pagestyle);
           /* //turn location
            if ($.cookie('now_location_act') != null) {
                openItem($.cookie('now_location_op') + ',' + $.cookie('now_location_act') + ',' + $.cookie('now_location_nav'));
            } else {
                $('#mainMenu>ul').first().css('display', 'block');
                //第一次进入后台时，默认定到欢迎界面
                $('#item_welcome').addClass('selected');
                $('#workspace').attr('src', '${S_URL}/admin/dashboard/welcome');
            }*/
            $('#iframe_refresh').click(function () {
                var fr = document.frames ? document.frames("workspace") : document.getElementById("workspace").contentWindow;
                ;
                fr.location.reload();
            });

        });
        //收藏夹
        function addBookmark(url, label) {
            if (document.all) {
                window.external.addFavorite(url, label);
            }
            else if (window.sidebar) {
                window.sidebar.addPanel(label, url, '');
            }
        }


        function openItem(args) {
            closeBg();
            //cookie
            spl = args.split(',');
            op = spl[0];
            try {
                act = spl[1];
                nav = spl[2];
            }
            catch (ex) {
            }
            if (typeof(act) == 'undefined') {
                var nav = args;
            }
            $('.actived').removeClass('actived');
            $('#nav_' + nav).addClass('actived');

            $('.selected').removeClass('selected');

            //show
            $('#mainMenu ul').css('display', 'none');
            $('#sort_' + nav).css('display', 'block');

            if (typeof(act) == 'undefined') {
                //顶部菜单事件
                html = $('#sort_' + nav + '>li>dl>dd>ol>li').first().html();
                str = html.match(/openItem\('(.*)'\)/ig);
                arg = str[0].split("'");
                spl = arg[1].split(',');
                op = spl[0];
                act = spl[1];
                nav = spl[2];
                first_obj = $('#sort_' + nav + '>li>dl>dd>ol>li').first().children('a');
                $(first_obj).addClass('selected');
                //crumbs
                $('#crumbs').html('<span>' + $('#nav_' + nav + ' > span').html() + '</span><span class="arrow">&nbsp;</span><span>' + $(first_obj).text() + '</span>');
            } else {
                //左侧菜单事件
                //location
               /* $.cookie('now_location_nav', nav);
                $.cookie('now_location_act', act);
                $.cookie('now_location_op', op);*/
                $("a[name='item_" + op + act + "']").addClass('selected');
                //crumbs
                $('#crumbs').html('<span>' + $('#nav_' + nav + ' > span').html() + '</span><span class="arrow">&nbsp;</span><span>' + $('#item_' + op + act).html() + '</span>');
            }
            src = '${S_URL}/' + act + '/' + op;
            $('#workspace').attr('src', src);
        }

        $(function () {
            bindAdminMenu();
        })
        function bindAdminMenu() {

            $("[nc_type='parentli']").click(function () {
                var key = $(this).attr('dataparam');
                if ($(this).find("dd").css("display") == "none") {
                    $("[nc_type='" + key + "']").slideDown("fast");
                    $(this).find('dt').css("background-position", "-322px -170px");
                    $(this).find("dd").show();
                } else {
                    $("[nc_type='" + key + "']").slideUp("fast");
                    $(this).find('dt').css("background-position", "-483px -170px");
                    $(this).find("dd").hide();
                }
            });
        }
    </script>
    <script type="text/javascript">
        //显示灰色JS遮罩层
        function showBg(ct, content) {
            var bH = $("body").height();
            var bW = $("body").width();
            var objWH = getObjWh(ct);
            $("#pagemask").css({width: bW, height: bH, display: "none"});
            var tbT = objWH.split("|")[0] + "px";
            var tbL = objWH.split("|")[1] + "px";
            $("#" + ct).css({top: tbT, left: tbL, display: "block"});
            $(window).scroll(function () {
                resetBg()
            });
            $(window).resize(function () {
                resetBg()
            });
        }
        function getObjWh(obj) {
            var st = document.documentElement.scrollTop;//滚动条距顶部的距离
            var sl = document.documentElement.scrollLeft;//滚动条距左边的距离
            var ch = document.documentElement.clientHeight;//屏幕的高度
            var cw = document.documentElement.clientWidth;//屏幕的宽度
            var objH = $("#" + obj).height();//浮动对象的高度
            var objW = $("#" + obj).width();//浮动对象的宽度
            var objT = Number(st) + (Number(ch) - Number(objH)) / 2;
            var objL = Number(sl) + (Number(cw) - Number(objW)) / 2;
            return objT + "|" + objL;
        }
        function resetBg() {
            var fullbg = $("#pagemask").css("display");
            if (fullbg == "block") {
                var bH2 = $("body").height();
                var bW2 = $("body").width();
                $("#pagemask").css({width: bW2, height: bH2});
                var objV = getObjWh("dialog");
                var tbT = objV.split("|")[0] + "px";
                var tbL = objV.split("|")[1] + "px";
                $("#dialog").css({top: tbT, left: tbL});
            }
        }

        //关闭灰色JS遮罩层和操作窗口
        function closeBg() {
            $("#pagemask").css("display", "none");
            $("#dialog").css("display", "none");
        }
    </script>
    <script type="text/javascript">
        $(function () {
            var $li = $("#skin li");
            $li.click(function () {
                alert("现在不支持换肤！");
                return;
                $("#" + this.id).addClass("selected").siblings().removeClass("selected");
                $("#cssfile").attr("href", "http://localhost/shopnc/admin/templates/default/css/" + (this.id) + ".css");
               // $.cookie("MyCssSkin", this.id, {path: '/', expires: 10});

                $('iframe').contents().find('#cssfile2').attr("href", "http://localhost/shopnc/admin/templates/default/css/" + (this.id) + ".css");
            });

            /*var cookie_skin = $.cookie("MyCssSkin");
            if (cookie_skin) {
                $("#" + cookie_skin).addClass("selected").siblings().removeClass("selected");
                $("#cssfile").attr("href", "http://localhost/shopnc/admin/templates/default/css/" + cookie_skin + ".css");
                $.cookie("MyCssSkin", cookie_skin, {path: '/', expires: 10});
            }*/
            openItem('welcome,home,dashboard');
        });
        function addFavorite(url, title) {
            try {
                window.external.addFavorite(url, title);
            } catch (e) {
                try {
                    window.sidebar.addPanel(title, url, '');
                } catch (e) {
                    showDialog("请按 Ctrl+D 键添加到收藏夹", 'notice');
                }
            }
        }

    </script>

</head>


<body scroll="no" style="margin: 0px;">
<div id="pagemask" style="display: none;"></div>
<div style="display:none" id="dialog">
    <div class="title">
        <h3>管理中心导航</h3>
        <span><a onclick="closeBg();" href="JavaScript:void(0);">关闭</a></span></div>
    <div class="content">
        <dl>
            <dt>会员</dt>
            <dd><a onclick="openItem('member,member,member')" href="javascript:void(0)">会员管理</a></dd>
        </dl>
        <dl>
            <dt>CMS</dt>
            <dd><a onclick="openItem('cms_manage,cms_manage,cms')" href="javascript:void(0)">CMS管理</a></dd>
            <dd><a onclick="openItem('cms_index,cms_index,cms')" href="javascript:void(0)">首页管理</a></dd>
            <dd><a onclick="openItem('article_list,article_lang,cms')" href="javascript:void(0)">文章管理</a></dd>
            <dd><a onclick="openItem('index,cms_article_class,cms')"   href="javascript:void(0)">文章分类</a></dd>
            <dd><a onclick="openItem('index,cms_slide,cms')" href="javascript:void(0)">幻灯片管理</a></dd>
            <dd><a onclick="openItem('2,article_lang_type,cms')" href="javascript:void(0)">新聞管理</a></dd>
            <dd><a onclick="openItem('1,article_lang_type,cms')" href="javascript:void(0)">藝術活動管理</a></dd>
            <dd><a onclick="openItem('3,article_lang_type,cms')" href="javascript:void(0)">公眾活動管理</a></dd>
            <dd><a onclick="openItem('4,article_lang_type,cms')" href="javascript:void(0)">网站文章管理</a></dd>
        </dl>
    </div>
</div>
<table width="100%" cellspacing="0" cellpadding="0" height="100%" id="frametable" style="width: 100%;">
    <tbody>
    <tr>
        <td height="90" class="mainhd" colspan="2">
        <#include "header.ftl"/>
        </td>
    </tr>
    <tr>
        <td width="161" valign="top" class="menutd">
        <#include "left.ftl"/>
                <#include "footer.ftl"/>
        </td>
        <td width="100%" valign="top">
            <iframe width="100%" height="100%" frameborder="0" onload="window.parent" scrolling="yes"
                    style="overflow: visible; height: 300px; width: 1182px;" name="workspace" id="workspace"
                    src=""></iframe>
        </td>
    </tr>
    </tbody>
</table>


</body>
</html>
<#assign S_URL=request.contextPath />
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" content="text/html;" http-equiv="Content-Type">
    <title>我的家</title>
    <link href="${S_URL}/static/styles/skin_0.css" rel="stylesheet" type="text/css"/>
    <script src="${S_COMMON_URL}/scripts/jquery/jquery.js" type="text/javascript"></script>
    <script src="${S_COMMON_URL}/scripts/jquery/jquery.validation.js" type="text/javascript"></script>
    <script src="${S_COMMON_URL}/scripts/jquery/jquery.cookie.js" type="text/javascript"></script>
    <!--[if lt IE 9]>
    <script src="${S_COMMON_URL}/scripts/utils/html5shiv.js" type="text/javascript"></script>
    <script src="${S_COMMON_URL}/scripts/utils/respond.min.js" type="text/javascript"></script>
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
            <dt>设置</dt>
            <dd><a onclick="openItem('base,setting,setting')" href="javascript:void(0)">站点设置</a></dd>
            <dd><a onclick="openItem('qq,account,setting')" href="javascript:void(0)">账号同步</a></dd>
            <dd><a onclick="openItem('param,upload,setting')" href="javascript:void(0)">上传设置</a></dd>
            <dd><a onclick="openItem('seo,setting,setting')" href="javascript:void(0)">SEO设置</a></dd>
            <dd><a onclick="openItem('email,message,setting')" href="javascript:void(0)">消息通知</a></dd>
            <dd><a onclick="openItem('system,payment,setting')" href="javascript:void(0)">支付方式</a></dd>
            <dd><a onclick="openItem('admin,admin,setting')" href="javascript:void(0)">权限设置</a></dd>
            <dd><a onclick="openItem('index,express,setting')" href="javascript:void(0)">快递公司</a></dd>
            <dd><a onclick="openItem('index,offpay_area,setting')" href="javascript:void(0)">配送地区</a></dd>
            <dd><a onclick="openItem('clear,cache,setting')" href="javascript:void(0)">清理缓存</a></dd>
            <dd><a onclick="openItem('perform,perform,setting')" href="javascript:void(0)">性能优化</a></dd>
            <dd><a onclick="openItem('search,search,setting')" href="javascript:void(0)">搜索设置</a></dd>
            <dd><a onclick="openItem('list,admin_log,setting')" href="javascript:void(0)">操作日志</a></dd>
        </dl>
        <dl>
            <dt>商品</dt>
            <dd><a onclick="openItem('goods_class,goods_class,goods')" href="javascript:void(0)">分类管理</a></dd>
            <dd><a onclick="openItem('brand,brand,goods')" href="javascript:void(0)">品牌管理</a></dd>
            <dd><a onclick="openItem('goods,goods,goods')" href="javascript:void(0)">商品管理</a></dd>
            <dd><a onclick="openItem('type,type,goods')" href="javascript:void(0)">类型管理</a></dd>
            <dd><a onclick="openItem('spec,spec,goods')" href="javascript:void(0)">规格管理</a></dd>
            <dd><a onclick="openItem('list,goods_album,goods')" href="javascript:void(0)">图片空间</a></dd>
        </dl>
        <dl>
            <dt>店铺</dt>
            <dd><a onclick="openItem('store,store,store')" href="javascript:void(0)">店铺管理</a></dd>
            <dd><a onclick="openItem('store_grade,store_grade,store')" href="javascript:void(0)">店铺等级</a></dd>
            <dd><a onclick="openItem('store_class,store_class,store')" href="javascript:void(0)">店铺分类</a></dd>
            <dd><a onclick="openItem('store_domain_setting,domain,store')" href="javascript:void(0)">二级域名</a></dd>
            <dd><a onclick="openItem('stracelist,sns_strace,store')" href="javascript:void(0)">店铺动态</a></dd>
        </dl>
        <dl>
            <dt>会员</dt>
            <dd><a onclick="openItem('member,member,member')" href="javascript:void(0)">会员管理</a></dd>
            <dd><a onclick="openItem('notice,notice,member')" href="javascript:void(0)">会员通知</a></dd>
            <dd><a onclick="openItem('addpoints,points,member')" href="javascript:void(0)">积分管理</a></dd>
            <dd><a onclick="openItem('predeposit,predeposit,member')" href="javascript:void(0)">预存款</a></dd>
            <dd><a onclick="openItem('sharesetting,sns_sharesetting,member')" href="javascript:void(0)">分享绑定</a>
            </dd>
            <dd><a onclick="openItem('class_list,sns_malbum,member')" href="javascript:void(0)">会员相册</a></dd>
            <dd><a onclick="openItem('tracelist,snstrace,member')" href="javascript:void(0)">买家动态</a></dd>
            <dd><a onclick="openItem('member_tag,sns_member,member')" href="javascript:void(0)">会员标签</a></dd>
        </dl>
        <dl>
            <dt>交易</dt>
            <dd><a onclick="openItem('index,order,trade')" href="javascript:void(0)">订单管理</a></dd>
            <dd><a onclick="openItem('refund_manage,refund,trade')" href="javascript:void(0)">退款管理</a></dd>
            <dd><a onclick="openItem('return_manage,refund,trade')" href="javascript:void(0)">退货管理</a></dd>
            <dd><a onclick="openItem('consulting,consulting,trade')" href="javascript:void(0)">咨询管理</a></dd>
            <dd><a onclick="openItem('inform_list,inform,trade')" href="javascript:void(0)">举报管理</a></dd>
            <dd><a onclick="openItem('evalgoods_list,evaluate,trade')" href="javascript:void(0)">评价管理</a></dd>
            <dd><a onclick="openItem('complain_new_list,complain,trade')" href="javascript:void(0)">投诉管理</a></dd>
        </dl>
        <dl>
            <dt>网站</dt>
            <dd><a onclick="openItem('articlelist,articleClass,website')" href="javascript:void(0)">文章分类</a></dd>
            <dd><a onclick="openItem('article,article,website')" href="javascript:void(0)">文章管理</a></dd>
            <dd><a onclick="openItem('document,document,website')" href="javascript:void(0)">系统文章</a></dd>
            <dd><a onclick="openItem('navigation,navigation,website')" href="javascript:void(0)">页面导航</a></dd>
            <dd><a onclick="openItem('ap_manage,adv,website')" href="javascript:void(0)">广告管理</a></dd>
            <dd><a onclick="openItem('web_config,web_config,website')" href="javascript:void(0)">首页管理</a></dd>
            <dd><a onclick="openItem('rec_list,rec_position,website')" href="javascript:void(0)">推荐位</a></dd>
        </dl>
        <dl>
            <dt>运营</dt>
            <dd><a onclick="openItem('setting,operation,operation')" href="javascript:void(0)">基本设置</a></dd>
            <dd><a onclick="openItem('groupbuy_template_list,groupbuy,operation')"
                   href="javascript:void(0)">团购管理</a></dd>
            <dd><a onclick="openItem('xianshi_apply,promotion_xianshi,operation')"
                   href="javascript:void(0)">限时折扣</a></dd>
            <dd><a onclick="openItem('mansong_apply,promotion_mansong,operation')" href="javascript:void(0)">满即送</a>
            </dd>
            <dd><a onclick="openItem('bundling_list,promotion_bundling,operation')"
                   href="javascript:void(0)">优惠套装</a></dd>
            <dd><a onclick="openItem('goods_list,promotion_booth,operation')" href="javascript:void(0)">推荐展位</a>
            </dd>
            <dd><a onclick="openItem('voucher_apply,voucher,operation')" href="javascript:void(0)">代金券</a></dd>
            <dd><a onclick="openItem('index,bill,operation')" href="javascript:void(0)">结算管理</a></dd>
            <dd><a onclick="openItem('activity,activity,operation')" href="javascript:void(0)">活动管理</a></dd>
            <dd><a onclick="openItem('pointprod,pointprod,operation')" href="javascript:void(0)">兑换礼品</a></dd>
        </dl>
        <dl>
            <dt>统计</dt>
            <dd><a onclick="openItem('newmember,stat_member,stat')" href="javascript:void(0)">会员统计</a></dd>
            <dd><a onclick="openItem('newstore,stat_store,stat')" href="javascript:void(0)">店铺统计</a></dd>
            <dd><a onclick="openItem('goods,stat_trade,stat')" href="javascript:void(0)">销量分析</a></dd>
            <dd><a onclick="openItem('promotion,stat_marketing,stat')" href="javascript:void(0)">营销分析</a></dd>
            <dd><a onclick="openItem('refund,stat_aftersale,stat')" href="javascript:void(0)">售后分析</a></dd>
        </dl>
        <dl>
            <dt>微商城</dt>
            <dd><a onclick="openItem('manage,microshop,microshop')" href="javascript:void(0)">微商城管理</a></dd>
            <dd><a onclick="openItem('goods_manage,microshop,microshop')" href="javascript:void(0)">随心看管理</a></dd>
            <dd><a onclick="openItem('goodsclass_list,microshop,microshop')" href="javascript:void(0)">随心看分类</a>
            </dd>
            <dd><a onclick="openItem('personal_manage,microshop,microshop')" href="javascript:void(0)">个人秀管理</a>
            </dd>
            <dd><a onclick="openItem('personalclass_list,microshop,microshop')" href="javascript:void(0)">个人秀分类</a>
            </dd>
            <dd><a onclick="openItem('store_manage,microshop,microshop')" href="javascript:void(0)">店铺街管理</a></dd>
            <dd><a onclick="openItem('comment_manage,microshop,microshop')" href="javascript:void(0)">评论管理</a></dd>
            <dd><a onclick="openItem('adv_manage,microshop,microshop')" href="javascript:void(0)">广告管理</a></dd>
        </dl>
        <dl>
            <dt>CMS</dt>
            <dd><a onclick="openItem('cms_manage,cms_manage,cms')" href="javascript:void(0)">CMS管理</a></dd>
            <dd><a onclick="openItem('cms_index,cms_index,cms')" href="javascript:void(0)">首页管理</a></dd>
            <dd><a onclick="openItem('cms_article_list,cms_article,cms')" href="javascript:void(0)">文章管理</a></dd>
            <dd><a onclick="openItem('index,cms_article_class,cms')"   href="javascript:void(0)">文章分类</a></dd>
            <dd><a onclick="openItem('cms_picture_list,cms_picture,cms')" href="javascript:void(0)">画报管理</a></dd>
            <dd><a onclick="openItem('cms_picture_class_list,cms_picture_class,cms')"
                   href="javascript:void(0)">画报分类</a></dd>
            <dd><a onclick="openItem('cms_special_list,cms_special,cms')" href="javascript:void(0)">专题管理</a></dd>
            <dd><a onclick="openItem('cms_navigation_list,cms_navigation,cms')" href="javascript:void(0)">导航管理</a>
            </dd>
            <dd><a onclick="openItem('cms_tag_list,cms_tag,cms')" href="javascript:void(0)">标签管理</a></dd>
            <dd><a onclick="openItem('comment_manage,cms_comment,cms')" href="javascript:void(0)">评论管理</a></dd>
        </dl>
        <dl>
            <dt>圈子</dt>
            <dd><a onclick="openItem('index,circle_setting,circle')" href="javascript:void(0)">圈子设置</a></dd>
            <dd><a onclick="openItem('index,circle_memberlevel,circle')" href="javascript:void(0)">成员头衔设置</a></dd>
            <dd><a onclick="openItem('class_list,circle_class,circle')" href="javascript:void(0)">圈子分类管理</a></dd>
            <dd><a onclick="openItem('circle_list,circle_manage,circle')" href="javascript:void(0)">圈子管理</a></dd>
            <dd><a onclick="openItem('theme_list,circle_theme,circle')" href="javascript:void(0)">圈子话题管理</a></dd>
            <dd><a onclick="openItem('member_list,circle_member,circle')" href="javascript:void(0)">圈子成员管理</a></dd>
            <dd><a onclick="openItem('inform_list,circle_inform,circle')" href="javascript:void(0)">圈子举报管理</a></dd>
            <dd><a onclick="openItem('adv_manage,circle_setting,circle')" href="javascript:void(0)">圈子首页广告</a></dd>
            <dd><a onclick="openItem('index,circle_cache,circle')" href="javascript:void(0)">更新圈子缓存</a></dd>
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
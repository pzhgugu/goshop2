
<div class="layout-header"> <!-- Title/Logo - can use text instead of image -->
    <div id="title"><a href="index.php"></a></div>
    <!-- Top navigation -->
    <div class="top-nav" id="topnav">
        <ul>
            <li title="您好:<@shiro.principal property="loginName"/>" class="adminid">您好&nbsp;:&nbsp;<strong><@shiro.principal property="loginName"/></strong></li>
            <li><a target="workspace" href="index.php?act=index&amp;op=modifypw"><span>修改密码</span></a></li>
            <li><a title="退出" href="logout"><span>退出</span></a></li>
            <li><a title="商城首页" target="_blank" href="http://localhost/shopnc/shop"><span>商城首页</span></a></li>
        </ul>
    </div>
    <!-- End of Top navigation -->
    <!-- Main navigation -->
    <nav class="main-nav" id="nav">
        <ul>
            <li><a onclick="openItem('dashboard');" href="javascript:;" id="nav_dashboard" class="link actived"><span>控制台</span></a>
            </li>
            <li><a onclick="openItem('setting');" href="javascript:;" id="nav_setting" class="link"><span>设置</span></a>
            </li>
            <li><a onclick="openItem('goods');" href="javascript:;" id="nav_goods" class="link"><span>商品</span></a></li>
            <li><a onclick="openItem('store');" href="javascript:;" id="nav_store" class="link"><span>店铺</span></a></li>
            <li><a onclick="openItem('member');" href="javascript:;" id="nav_member" class="link"><span>会员</span></a>
            </li>
            <li><a onclick="openItem('trade');" href="javascript:;" id="nav_trade" class="link"><span>交易</span></a></li>
            <li><a onclick="openItem('website');" href="javascript:;" id="nav_website" class="link"><span>网站</span></a>
            </li>
            <li><a onclick="openItem('operation');" href="javascript:;" id="nav_operation" class="link"><span>运营</span></a>
            </li>
            <li><a onclick="openItem('stat');" href="javascript:;" id="nav_stat" class="link"><span>统计</span></a></li>
            <li><a onclick="openItem('microshop');" href="javascript:;" id="nav_microshop" class="link"><span>微商城</span></a>
            </li>
            <li><a onclick="openItem('cms');" href="javascript:;" id="nav_cms" class="link "><span>CMS</span></a>
            </li>
            <li><a onclick="openItem('circle');" href="javascript:;" id="nav_circle" class="link"><span>圈子</span></a>
            </li>
        </ul>
    </nav>
    <div class="loca"><strong>您的位置:</strong>

        <div class="crumbs" id="crumbs"><span>CMS</span><span class="arrow">&nbsp;</span><span>CMS管理</span></div>
    </div>
    <div class="toolbar">
        <ul class="skin" id="skin"><span>换肤</span>
            <li title="默认风格" class="" id="skin_0"></li>
            <li title="Mac风格" class="" id="skin_1"></li>
        </ul>
        <div class="sitemap"><a onclick="showBg('dialog','dialog_content');" href="#rhis"
                                id="siteMapBtn"><span>管理地图</span></a></div>
        <div class="toolmenu"><span class="bar-btn"></span>
            <ul class="bar-list">
                <li><a href="javascript:void(0)" onclick="openItem('clear,cache,setting');">更新站点缓存</a></li>
                <li><a id="iframe_refresh" href="http://localhost/shopnc/admin">刷新管理中心</a></li>
                <li><a onclick="addFavorite('http://localhost/shopnc/admin', '管理中心-我的家');return false;" rel="sidebar"
                       title="管理中心-我的家" href="http://localhost/shopnc/admin">收藏管理中心</a></li>
            </ul>
        </div>
    </div>
</div>
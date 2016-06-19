
<div class="layout-header"> <!-- Title/Logo - can use text instead of image -->
    <div id="title"><a href="#"></a></div>
    <!-- Top navigation -->
    <div class="top-nav" id="topnav">
        <ul>
            <li title="您好:<@shiro.principal property="loginName"/>" class="adminid">您好&nbsp;:&nbsp;<strong><@shiro.principal property="loginName"/></strong></li>
            <li><a target="workspace" href="#"><span>修改密码</span></a></li>
            <li><a title="退出" href="logout"><span>退出</span></a></li>
            <li><a title="网站首页" target="_blank" href="${S_URL}/sf"><span>网站首页</span></a></li>
        </ul>
    </div>
    <!-- End of Top navigation -->
    <!-- Main navigation -->
    <nav class="main-nav" id="nav">
        <ul>
            <li><a onclick="openItem('dashboard');" href="javascript:;" id="nav_dashboard" class="link actived"><span>控制台</span></a>
            </li>
            <li><a onclick="openItem('member');" href="javascript:;" id="nav_member" class="link"><span>会员</span></a>
            </li>
            <li><a onclick="openItem('cms');" href="javascript:;" id="nav_cms" class="link "><span>CMS</span></a>
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
                <li><a id="iframe_refresh" href="#">刷新管理中心</a></li>
                <li><a onclick="addFavorite('#', '管理中心-我的家');return false;" rel="sidebar"
                       title="管理中心-我的家" href="#">收藏管理中心</a></li>
            </ul>
        </div>
    </div>
</div>
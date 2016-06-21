
<div class="public-top-layout w">
    <div class="topbar wrapper">
        <div class="user-entry">
            您好<span><@shiro.guest>游客</@shiro.guest><@shiro.user> <@shiro.principal property="loginName"/></@shiro.user>
    </span>
            ，欢迎来到      <a alt="首页" title="首页" href="#"><span>电商系统</span></a>
        <@shiro.guest><span>[<a href="${S_URL}/login.html">登录</a>]</span><span>[<a href="${S_URL}/register.html">注册</a>]</span></@shiro.guest>
        <@shiro.user><span>[<a href="${S_URL}/logout.html">退出</a>]</span>
            <span class="seller-login"><a title="登录商家管理中心" target="_blank" href="${S_URL}/se/"><i class="icon-signin"></i>商家管理中心</a></span>
        </@shiro.user>
        </div>

        <div class="quick-menu">
            <dl>
                <dt><a href="#">我的订单</a><i></i></dt>
                <dd>
                    <ul>
                        <li><a href="#">待付款订单</a></li>
                        <li><a href="#">待确认收货</a></li>
                        <li><a href="#">待评价交易</a></li>
                    </ul>
                </dd>
            </dl>
            <dl>
                <dt><a href="#">我的收藏</a><i></i></dt>
                <dd>
                    <ul>
                        <li><a href="#">商品收藏</a></li>
                        <li><a href="#">店铺收藏</a></li>
                    </ul>
                </dd>
            </dl>
            <dl>
                <dt>客户服务<i></i></dt>
                <dd>
                    <ul>
                        <li><a href="#">帮助中心</a></li>
                        <li><a href="#">售后服务</a></li>
                        <li><a href="#">客服中心</a></li>
                    </ul>
                </dd>
            </dl>
        </div>
    </div>
</div>
<script type="application/javascript">
  $(function(){
    $(".quick-menu dl").hover(function() {
              $(this).addClass("hover");
            },
            function() {
              $(this).removeClass("hover");
            });

  });
</script>
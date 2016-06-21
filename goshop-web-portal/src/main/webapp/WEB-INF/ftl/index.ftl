<#assign S_URL=request.contextPath />
<html>
<head>
    <title></title>
</head>
<body>
电商首页

<@shiro.guest>
欢迎游客访问，<a href="${S_URL}/login.html">登录</a> <a href="${S_URL}/register.html">注册</a>
</@shiro.guest>

<@shiro.user>
欢迎[<@shiro.principal property="loginName"/>]登录，<a href="${S_URL}/logout.html">退出</a>
, <a href="${S_URL}/store_join/agreement.html">店铺申请</a>
,<a href="${S_URL}/member/base_set.html">个人中心</a>
</@shiro.user>
</body>
</html>

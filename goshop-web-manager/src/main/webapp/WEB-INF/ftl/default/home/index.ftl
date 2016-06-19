<#assign S_URL=request.contextPath />
<html>
<head>
    <base id="base" href="${S_URL}">
    <title></title>
</head>
<body>


<#import "top.ftl" as top />
${top.username}

<@top.copyright  date="2000-01-01"/>
<#assign username="古古" in top>
${top.username}
---------------------
<#include "top.ftl" />
-------------------
管理首页
<@shiro.guest>
    欢迎游客访问，<a href="${S_URL}/login.html">登录</a>
</@shiro.guest>

<@shiro.user>
    欢迎[<@shiro.principal property="loginName"/>]登录，<a href="${S_URL}/logout">退出</a>
</@shiro.user>
</body>
</html>

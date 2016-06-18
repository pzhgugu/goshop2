<#assign username="刘德华">
我是头部
${username}

<#macro copyright date>
<p>Copyright (C) ${date} Julia Smith. All rights reserved.</p>
</#macro>


${request.requestUri}
----------------------------------
${request.queryString}
----------------------------------

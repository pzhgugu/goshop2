<#assign S_URL=request.contextPath />
<!DOCTYPE html>
<html><head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="UTF-8">
    <title>电商系统</title>
    <link href="${S_COMMON_URL}/styles/shop/skin_0.css" rel="stylesheet" type="text/css">
</head>
<body>
<div class="page">
    <div class="fixed-bar">
        <div class="item-title">
            <h3>GoShop系统消息</h3>
        </div>
    </div>
    <div class="fixed-empty"></div>
    <table class="table tb-type2 msg">
        <tbody class="noborder">
        <tr>
            <td rowspan="5" class="msgbg"></td>
            <td class="tip">${P_MESSAGE}</td>
        </tr>
        <tr>
            <td class="tip2">若不选择将自动跳转</td>
        </tr>
        <tr>
            <td>          <a href="${P_RETURN_URL}" class="btns"><span>返回上一页</span></a>
                <script type="text/javascript"> window.setTimeout("javascript:location.href='${P_RETURN_URL}'", 2000); </script>
            </td>
        </tr>
        </tbody>
    </table>
</div>
</body></html>
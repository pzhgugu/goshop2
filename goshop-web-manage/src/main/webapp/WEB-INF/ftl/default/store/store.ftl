<#assign S_URL=request.contextPath />
<!DOCTYPE html>
<html>
<head>
    <meta content="IE=edge;chrome=1" http-equiv="X-UA-Compatible">
    <meta content="text/html; charset=UTF-8" http-equiv="Content-Type">
    <title>店铺管理</title>

    <script src="${S_COMMON_URL}/scripts/jquery/jquery.js"></script>
    <script src="${S_COMMON_URL}/scripts/jquery/jquery-browser.js"></script>
    <script src="${S_COMMON_URL}/scripts/jquery/waypoints.js"></script>
    <script src="${S_COMMON_URL}/scripts/jquery/jquery.validation.js"></script>
    <script src="${S_COMMON_URL}/scripts/jquery-ui/jquery.ui.js"></script>
    <script src="${S_COMMON_URL}/scripts/utils/area_array.js"></script>
    <script src="${S_COMMON_URL}/scripts/shop/common.js"></script>
    <script src="${S_URL}/static/scripts/admincp.js"></script>
    <link id="cssfile2" type="text/css" rel="stylesheet" href="${S_URL}/static/styles/skin_0.css">
    <script type="text/javascript">
        SITEURL = '${S_URL}';
    </script>
</head>
<body>
<div id="append_parent"></div>
<div id="ajaxwaitid"></div>

<div class="page">
    <div class="fixed-bar">
        <div class="item-title">
            <h3>店铺</h3>
            <ul class="tab-base">
                <li><a class="current" href="JavaScript:void(0);"><span>管理</span></a></li>
                <li><a href="${S_URL}/store_join"><span>开店申请</span></a></li>
            </ul>
        </div>
    </div>
    <div class="fixed-empty"></div>
    <form id="formSearch" name="formSearch" method="get">
        <table class="tb-type1 noborder search">
            <tbody>
            <tr><th><label>所属等级</label></th>
                <td><select name="grade_id">
                    <option value="">请选择...</option>
                    <option value="1">系统默认</option>
                    <option value="2">白金店铺</option>
                    <option value="3">钻石店铺</option>
                </select></td><th><label for="owner_and_name">店主</label></th>
                <td><input type="text" class="txt" id="owner_and_name" name="owner_and_name" value=""></td><td></td><th><label>店铺类型</label></th>
                <td>
                    <select name="store_type">
                        <option value="">请选择...</option>
                        <option value="open">开启</option>
                        <option value="close">关闭</option>
                        <option value="expire">即将到期</option>
                        <option value="expired">已到期</option>
                    </select>
                </td>
                <th><label for="store_name">店铺</label></th>
                <td><input type="text" class="txt" id="store_name" name="store_name" value=""></td>
                <td><a title="查询" class="btn-search " id="ncsubmit" href="javascript:void(0);">&nbsp;</a>
                </td>
            </tr></tbody>
        </table>
    </form>
    <table id="prompt" class="table tb-type2">
        <tbody>
        <tr class="space odd">
            <th colspan="12"><div class="title">
                <h5>操作提示</h5>
                <span class="arrow"></span></div></th>
        </tr>
        <tr class="odd" style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
            <td><ul>
                <li>如果当前时间超过店铺有效期或店铺处于关闭状态，前台将不能继续浏览该店铺，但是店主仍然可以编辑该店铺</li>
            </ul></td>
        </tr>
        </tbody>
    </table>
    <form id="store_form" method="post">
        <input type="hidden" value="ok" name="form_submit">
        <table class="table tb-type2">
            <thead>
            <tr class="thead">
                <th>店铺</th>
                <th>店主账号</th>
                <th>店主卖家帐号</th>
                <th class="align-center">所属等级</th>
                <th class="align-center">有效期至</th>
                <th class="align-center">状态</th>
                <th class="align-center">操作</th>
            </tr>
            </thead>
            <tbody>

<#list P_PAGE.list as o>
            <tr class="hover edit open" style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
                <td>
                    <a target="_blank" href="#">${o.storeName}</a></td>
                <td>${o.memberName}</td>
                <td>${o.sellerName}</td>
                <td class="align-center">${P_STORE_GRADE_MAP[o.gradeId+'']}</td>
                <td class="nowarp align-center">${(o.storeEndTime?string("yyyy-MM-dd"))!"无限制"}</td>
                <td class="align-center w72"><#if o.storeState==0>关闭
                <#elseif o.storeState==1>开启
                <#else>审核中
                </#if></td>
                <td class="align-center w120">
                    <a href="show?storeId=${o.storeId}">查看</a>&nbsp;&nbsp;<a href="edit?storeId=${o.storeId}">编辑</a>&nbsp;&nbsp;
                </td>
            </tr>
</#list>
            </tbody>
            <tfoot>
            <tr class="tfoot">
                <td></td>
                <td colspan="16">
                <#if (P_PAGE.pages>1)>
                    <#import "../pagination.ftl" as pagination />
                    <@pagination.page  pageInfo=P_PAGE pageNumName="p" />
                </#if>
                </td>
            </tr>
            </tfoot>
        </table>
    </form>
</div>
<script charset="utf-8" src="${S_URL}/static/scripts/jquery.edit.js" type="text/javascript"></script>
<script>
    $(function(){
        $('#ncsubmit').click(function(){
            $('input[name="op"]').val('store');$('#formSearch').submit();
        });
    });
</script>

</body>
</html>
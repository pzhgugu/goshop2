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
                <li><a href="${S_URL}/store/store"><span>管理</span></a></li>
                <li><a class="current" href="JavaScript:void(0);"><span>开店申请</span></a></li>
            </ul>
        </div>
    </div>
    <div class="fixed-empty"></div>
    <form name="formSearch" method="get">
        <input type="hidden" name="act" value="store">
        <input type="hidden" name="op" value="store_joinin">
        <table class="tb-type1 noborder search">
            <tbody>
            <tr>
                <th><label for="store_name">店铺</label></th>
                <td><input type="text" class="txt" id="store_name" name="store_name" value=""></td>
                <th><label for="owner_and_name">店主</label></th>
                <td><input type="text" class="txt" id="owner_and_name" name="owner_and_name" value=""></td>
                <th><label>所属等级</label></th>
                <td><select name="grade_id">
                    <option value="">请选择...</option>
                    <#list P_STORE_GRADE as storeGrade>
                    <option value="${storeGrade.sgId}">${storeGrade.sgName}</option>
                    </#list>
                </select></td>
                <td>
                    <select name="joinin_state">
                        <option value="">请选择...</option>
                        <option value="10">新申请</option>
                        <option value="11">已付款</option>
                        <option value="20">待付款</option>
                        <option value="30">审核失败</option>
                        <option value="31">付款审核失败</option>
                        <option value="40">开店成功</option>
                    </select>
                </td>
                <td><a title="查询" class="btn-search " href="javascript:document.formSearch.submit();">&nbsp;</a>
                </td>
            </tr>
            </tbody>
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
                <li></li>
            </ul></td>
        </tr>
        </tbody>
    </table>
    <form name="store_form" id="store_form" method="post">
        <input type="hidden" value="ok" name="form_submit">
        <input type="hidden" value="" id="type" name="type">
        <table class="table tb-type2">
            <thead>
            <tr class="thead">
                <th>店铺</th>
                <th>店主账号</th>
                <th>所在地</th>
                <th class="align-center">所属等级</th>
                <th class="align-center">状态</th>
                <th class="align-center">操作</th>
            </tr>
            </thead>
            <tbody>
<#list P_PAGE.list as o>
            <tr class="hover edit" style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
                <td>${o.storeName}</td>
                <td>${o.memberName}</td>
                <td class="w150">${o.companyAddress}</td>
                <td class="align-center">${o.sgName}</td>
                <td class="align-center">
                    <#if o.joininState=='10'>新申请
                    <#elseif o.joininState=='11'>已付款
                    <#elseif o.joininState=='20'>待付款
                    <#elseif o.joininState=='30'>审核失败
                    <#elseif o.joininState=='31'>付款审核失败
                    <#elseif o.joininState=='40'>开店成功
                    </#if>
                </td>
                <td class="w72 align-center">
    <#if o.joininState=='40'>
            <a href="store_join/detail?member_id=${o.memberId}">查看</a>
        <#else>
            <a href="store_join/detail?member_id=${o.memberId}">审核</a>
    </#if>
                </td>
            </tr>
</#list>
            </tbody>
            <tfoot>
            <tr class="tfoot">
                <td></td>
                <td colspan="15">
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
    function audit_submit(type){
        $('#type').val(type);
        $("#store_form").submit();
        return true;
    }
</script>

</body>

</html>
<#assign S_URL=request.contextPath />
<!DOCTYPE html>
<html>
<head>
    <meta content="IE=edge;chrome=1" http-equiv="X-UA-Compatible">
    <meta content="text/html; charset=UTF-8" http-equiv="Content-Type">
    <title>店铺等级</title>
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
            <h3>店铺等级</h3>
            <ul class="tab-base">
                <li><a class="current" href="JavaScript:void(0);"><span>管理</span></a></li>
                <li><a href="save"><span>新增</span></a></li>
            </ul>
        </div>
    </div>
    <div class="fixed-empty"></div>
    <form name="formSearch" method="post" action="query_name">
        <table class="tb-type1 noborder search">
            <tbody>
            <tr style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
                <th><label for="like_sg_name">等级名称</label></th>
                <td><input type="text" class="txt" id="like_sg_name" name="like_sg_name" value=""></td>
                <td><a title="查询" class="btn-search " href="javascript:document.formSearch.submit();">&nbsp;</a>
                </td>
            </tr>
            </tbody>
        </table>
    </form>
    <form name="" method="post" id="form_grade">
        <table class="table tb-type2">
            <thead>
            <tr class="thead">
                <th class="w24">&nbsp;</th>
                <th>级别</th>
                <th>等级名称</th>
                <th class="align-center">可发布商品数</th>
                <th class="align-center">可上传图片数</th>
                <th class="align-center">可选模板套数</th>
                <th class="align-center">收费标准</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
<#list P_PAGE.list as o>
            <tr class="hover" style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
                <#if o.sgSort==0><td></td>
                <#else>
                    <td><input type="checkbox" class="checkitem" value="${o.sgId}" name="check_sg_id"></td>
                </#if>
                <td class="w36">${o.sgSort}</td>
                <td>${o.sgName}</td>
                <td class="align-center">${o.sgGoodsLimit}</td>
                <td class="align-center">${o.sgAlbumLimit}</td>
                <td class="align-center">${o.sgTemplateNumber!1}</td>
                <td class="align-center">${o.sgPrice}</td>
                <td class="w270"><a href="save?id=${o.sgId}">编辑</a> |
                    <#if o.sgSort==0>默认等级不能删除<#else>
                        <a href="javascript:if(confirm('您确定要删除该店铺等级吗？'))window.location = 'delete?id=${o.sgId}';">删除</a>
                    </#if> |
                    <a href="#">设置可选模板</a></td>
            </tr>
</#list>
            </tbody>
            <tfoot>

            <tr class="tfoot">
                <td><input type="checkbox" id="checkallBottom" class="checkall"></td>
                <td colspan="15"><label for="checkallBottom">全选</label>
                    &nbsp;&nbsp;<a onclick="if(confirm('您确定要删除该店铺等级吗？')){$('#form_grade').submit();}" class="btn" href="JavaScript:void(0);"><span>删除</span></a>
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

</body></html>
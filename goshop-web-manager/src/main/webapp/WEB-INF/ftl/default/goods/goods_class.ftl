<#assign S_URL=request.contextPath />
<!DOCTYPE html>
<html>
<head>
    <meta content="IE=edge;chrome=1" http-equiv="X-UA-Compatible">
    <meta content="text/html; charset=UTF-8" http-equiv="Content-Type">
    <title>商品分类列表</title>

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
        ADMIN_TEMPLATES_URL= '${S_URL}';
        RESOURCE_SITE_URL= '${S_URL}';
    </script>
</head>

<body>
<div id="append_parent"></div>
<div id="ajaxwaitid"></div>

<div class="page">
    <div class="fixed-bar">
        <div class="item-title">
            <h3>商品分类</h3>
            <ul class="tab-base">
                <li><a class="current"><span>管理</span></a></li>
                <li><a href="${S_URL}/goods_class/save"><span>新增</span></a></li>
                <li><a href="#"><span>导出</span></a></li>
                <li><a href="#"><span>导入</span></a></li>
                <li><a href="#"><span>TAG管理</span></a></li>
            </ul>
        </div>
    </div>
    <div class="fixed-empty"></div>
    <table id="prompt" class="table tb-type2">
        <tbody>
        <tr class="space odd" style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
            <th colspan="12" class="nobg"><div class="title"><h5>操作提示</h5><span class="arrow"></span></div></th>
        </tr>
        <tr class="odd" style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
            <td>
                <ul>
                    <li>当店主添加商品时可选择商品分类，用户可根据分类查询商品列表</li>
                    <li>点击分类名前“+”符号，显示当前分类的下级分类</li>
                    <li><a>对分类作任何更改后，都需要到 设置 -&gt; 清理缓存 清理商品分类，新的设置才会生效</a></li>
                </ul></td>
        </tr>
        </tbody>
    </table>
    <form method="post">
        <input type="hidden" value="ok" name="form_submit">
        <input type="hidden" value="" id="submit_type" name="submit_type">
        <table class="table tb-type2">
            <thead>
            <tr class="thead">
                <th></th>
                <th>排序</th>
                <th>分类名称</th>
                <th>类型</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <#list P_PAGE.list as o>
            <tr class="hover edit" style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
                <td class="w48">
                    <input type="checkbox" class="checkitem" value="${o.gcId}" name="check_gc_id[]">
                    <#if (o.grade>0) >
                        <img nc_type="flex" src="${S_URL}/static/images/tv-expandable.gif"  status="open"  fieldid="${o.gcId}">
                    </#if>
                </td>
                <td class="w48 sort">
                    <span class="editable " nc_type="inline_edit" fieldname="gc_sort" fieldid="${o.gcId}" datatype="number" ajax_branch="goods_class_sort" title="可编辑">${o.gcSort}</span></td>
                <td class="w50pre name">
                    <span class="editable" nc_type="inline_edit" fieldname="gc_name" ajax_branch="goods_class_name" fieldid="${o.gcId}" required="1" title="可编辑">${o.gcName}</span>
                    <a href="save?gc_parent_id=${o.gcId}" class="btn-add-nofloat marginleft"><span>新增下级</span></a>
                </td>
                <td>${o.typeName!""}</td>
                <td class="w84"><a href="save?gc_id=${o.gcId}">编辑</a> | <a href="javascript:if(confirm('删除该分类将会同时删除该分类的所有下级分类，您确定要删除吗'))window.location = 'delete?gc_id=${o.gcId}';">删除</a></td>
            </tr>
            </#list>
            </tbody>
            <tfoot>

            <tr class="tfoot">
                <td><input type="checkbox" id="checkall_2" class="checkall"></td>
                <td colspan="15" id="batchAction"><span class="all_checkbox">
            <label for="checkall_2">全选</label>
            </span>&nbsp;&nbsp;<a onclick="if(confirm('删除该分类将会同时删除该分类的所有下级分类，您确定要删除吗')){$('#submit_type').val('del');$('form:first').submit();}" class="btn" href="JavaScript:void(0);"><span>删除</span></a>
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
<script charset="utf-8" src="${S_URL}/static/scripts/jquery.goods_class.js" type="text/javascript"></script>
</body>

</html>
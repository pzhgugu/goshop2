<#assign S_URL=request.contextPath />

<!DOCTYPE html>
<html>
<head>
    <meta content="IE=edge;chrome=1" http-equiv="X-UA-Compatible">
    <meta content="text/html; charset=UTF-8" http-equiv="Content-Type">
    <title>电商测试</title>

    <script src="${S_COMMON_URL}/scripts/jquery/jquery.js"></script>
    <script src="${S_COMMON_URL}/scripts/jquery/jquery-browser.js"></script>
    <script src="${S_COMMON_URL}/scripts/jquery/waypoints.js"></script>
    <script src="${S_COMMON_URL}/scripts/jquery/jquery.validation.js"></script>
    <script src="${S_COMMON_URL}/scripts/jquery-ui/jquery.ui.js"></script>
    <script src="${S_COMMON_URL}/scripts/utils/area_array.js"></script>
    <script src="${S_COMMON_URL}/scripts/shop/common.js"></script>
    <script src="${S_URL}/static/scripts/admincp.js"></script>
    <link id="cssfile2" type="text/css" rel="stylesheet" href="${S_URL}/static/styles/skin_0.css">

    <script charset="utf-8" src="${S_URL}/static/scripts/jquery.edit.js" type="text/javascript"></script>
    <script charset="utf-8" src="${S_URL}/static/scripts/jquery.store_class.js" type="text/javascript"></script>

    <script src="${S_COMMON_URL}/scripts/jquery/jquery.autocomplete.js"></script>
    <link type="text/css" rel="stylesheet" href="${S_COMMON_URL}/scripts/jquery/jquery.autocomplete.css">
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
            <h3>附件搜索</h3>
            <ul class="tab-base">
                <li><a class="current" href="${S_URL}/solr/att/list"><span>所有附件</span></a></li>

                <#list P_FACET as facet>
                <li><a href="${S_URL}/solr/att/list?att_type=${facet.name}"><span>${facet}</span></a></li>
                </#list>
            </ul>
        </div>
    </div>
    <div class="fixed-empty"></div>
    <form id="formSearch" name="formSearch" method="get">
        <table class="tb-type1 noborder search">
            <tbody>
            <tr>
                <th><label for="att_name"> 附件</label></th>
                <td><input type="text" class="txt" id="att_name" name="att_name" value="${RequestParameters['att_name']!''}"></td>
                <th><label for="att_type">附件类型</label></th>
                <td><input type="text" class="txt" id="att_type" name="att_type" value="${RequestParameters['att_type']!''}"></td>
                <td><a title="查询" class="btn-search " id="ncsubmit" href="javascript:void(0);">&nbsp;</a></td>
            </tr>
            </tbody>
        </table>
    </form>
    <table id="prompt" class="table tb-type2">
        <tbody>
        <tr class="space odd" style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
            <th colspan="12"><div class="title">
                <h5>操作提示</h5>
                <span class="arrow"></span></div></th>
        </tr>
        <tr class="odd" style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
            <td><ul>
                <li>上架，当商品处于非上架状态时，前台将不能浏览该商品，店主和管理员都可控制商品上架状态</li>
                <li>违规下架，当商品处于违规下架状态时，前台将不能浏览该商品，只有管理员可控制商品违规下架状态，并且商品不能上架</li>
            </ul></td>
        </tr>
        </tbody>
    </table>
    <form action="http://localhost/shopnc/admin/index.php?act=goods&amp;op=goods_del" id="form_goods" method="post">
        <input type="hidden" value="ok" name="form_submit">
        <table class="table tb-type2">
            <thead>
            <tr class="thead">
                <th class="align-center">文件上传名称</th>
                <th class="align-center">文件大小</th>
                <th class="align-center">文件访问路径</th>
                <th class="align-center">文件类型</th>
                <th class="align-center">contentType</th>
                <th class="align-center">创建人</th>
                <th class="align-center">创建时间</th>
            </tr>
            </thead>
            <tbody>
            <#list P_PAGE.list as att>
            <tr class="hover edit" style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
                <td >${att.loadFileName}</td>
                <td >${att.fileSize}</td>
                <td >${att.path}</td>
                <td >${att.type}</td>
                <td>${att.contentType}</td>
                <td >${att.creator}</td>
                <td >${att.created?string("yyyy-MM-dd")}</td>
            </tr>
            </#list>

            </tbody>
            <tfoot>
            <tr class="tfoot">
                <td colspan="16">
                    <#import "pagination.ftl" as pagination />
                    <@pagination.page  pageInfo=P_PAGE pageNumName="p" />

                </td>
            </tr>
            </tfoot>
        </table>
    </form>
</div>


<script type="text/javascript">
    function parse(data) {
        var parsed = [];
        var rows =[];
        for(var i in data){
            var row =[];
            row[0]=data[i].n;
            row[1]=data[i].i;
            parsed[parsed.length] = {
                data: row,
                value: row[0],
                result: row[0]
            };
        }
        return parsed;
    };

    $().ready(function() {

        $("#att_name").autocomplete("${S_URL}/solr/att/auto",
                {
                    dataType:'json',
                    multiple: true,
                    matchContains: true,
                    width: 300,
                    multipleSeparator: " ",//分隔符
                    parse:parse,
                    formatItem: function(data, i, n, value) {
                        return value +" 数量为"+ data[1];
                        //"<table width='400px'><tr><td align='left'>" + row.Key + "</td><td align='right'><font style='color: #009933; font-family: 黑体; font-style: italic'>约" + row.Value + "个宝贝</font>&nbsp;&nbsp;</td></tr></table>";
                    }
                });

        $('#ncsubmit').click(function(){
            $('input[name="op"]').val('goods');$('#formSearch').submit();
        });

    });

</script>


</body></html>
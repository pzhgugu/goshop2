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
                <li><a href="store_grade"><span>管理</span></a></li>
                <#if RequestParameters['id']??>
                    <li><a href="save"><span>新增</span></a></li>
                    <li><a class="current" href="JavaScript:void(0);"><span>编辑</span></a></li>
                <#else>
                    <li><a class="current" href="JavaScript:void(0);"><span>新增</span></a></li>
                </#if>
            </ul>
        </div>
    </div>
    <div class="fixed-empty"></div>
    <form method="post" id="grade_form">
        <input type="hidden" name="sgId" id="sgId" value="${P_STORE_GRADE.sgId!''}">
        <table class="table tb-type2">
            <tbody>
            <tr class="noborder" style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
                <td class="required" colspan="2"><label for="sgName" class="validation">等级名称:</label></td>
            </tr>
            <tr class="noborder" style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
                <td class="vatop rowform"><input type="text" class="txt" name="sgName" id="sgName" value="${P_STORE_GRADE.sgName!''}"></td>
                <td class="vatop tips"></td>
            </tr>
            <tr style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
                <td class="required" colspan="2"><label for="sgGoodsLimit">可发布商品数:</label></td>
            </tr>
            <tr class="noborder" style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
                <td class="vatop rowform"><input type="text" class="txt" name="sgGoodsLimit" id="sgGoodsLimit" value="${P_STORE_GRADE.sgGoodsLimit!0}"></td>
                <td class="vatop tips">0表示没有限制</td>
            </tr>
            <tr style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;"><td class="required" colspan="2"><label> 可上传图片数:</label></td>
            </tr>
            <tr class="noborder" style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
                <td class="vatop rowform"><input type="text" class="txt" name="sgAlbumLimit" id="sgAlbumLimit" value="${P_STORE_GRADE.sgAlbumLimit!1000}"></td><td class="vatop tips"></td>
            </tr>
            <tr style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
                <td class="required" colspan="2"><label for="skin_limit">可选模板套数:</label>
                </td>
            </tr>
            <tr class="noborder" style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
                <td class="vatop rowform"><span class="grey">(在店铺等级列表设置)</span></td>
                <td class="vatop tips"></td>
            </tr>
            <tr>
                <td class="required" colspan="2"><label for="sgPrice" class="validation">收费标准:</label></td>
            </tr>
            <tr class="noborder">
                <td class="vatop rowform"><input type="text" class="txt" name="sgPrice" id="sgPrice" value="${P_STORE_GRADE.sgPrice!0}"></td>
                <td class="vatop tips">收费标准，在会员开通或升级店铺时将显示在前台</td>
            </tr>
            <tr>
                <td class="required" colspan="2"><label for="sgDescription">申请说明:</label></td>
            </tr>
            <tr class="noborder">
                <td class="vatop rowform"><textarea name="sgDescription" id="sgDescription" class="tarea" rows="6">${P_STORE_GRADE.sgDescription!''}</textarea></td>
                <td class="vatop tips">申请说明，在会员开通或升级店铺时将显示在前台</td>
            </tr>
            <tr>
                <!-- <td colspan="2" class="required"><label>排序:</label></td> -->
                <td class="required" colspan="2"><label class="validation">级别: </label></td>
            </tr>
            <tr class="noborder">
                <td class="vatop rowform"><input type="text" class="txt" name="sgSort" id="sgSort" value="${P_STORE_GRADE.sgSort!''}"></td>
                <td class="vatop tips">数值越大表明级别越高</td>
            </tr>
            </tbody>
            <tfoot>
            <tr class="tfoot">
                <td colspan="15"><a id="submitBtn" class="btn" href="JavaScript:void(0);"><span>提交</span></a></td>
            </tr>
            </tfoot>
        </table>
    </form>
</div>

<script>
    //按钮先执行验证再提交表单
    $(function(){$("#submitBtn").click(function(){
        if($("#grade_form").valid()){
            $("#grade_form").submit();
        }
    });
    });
    //
    $(document).ready(function(){
        $('#grade_form').validate({
            errorPlacement: function(error, element){
                error.appendTo(element.parent().parent().prev().find('td:first'));
            },

            rules : {
                sgName : {
                    required : true,
                    remote   : {
                        url :'check_name',
                        type:'get',
                        data:{
                            sgName : function(){
                                return $('#sgName').val();
                            },
                            sgId  : "${RequestParameters['id']!''}"
                        }
                    }
                },
                sgPrice : {
                    required  : true
                },
                sgGoodsLimit : {
                    digits  : true
                },
                sg_space_limit : {
                    digits : true
                },
                sgSort : {
                    required  : true,
                    digits  : true,
                    remote   : {
                        url :'check_sort',
                        type:'get',
                        data:{
                            sgSort : function(){
                                return $('#sgSort').val();
                            },
                            sgId  : "${RequestParameters['id']!''}"
                        }
                    }
                }
            },
            messages : {
                sgName : {
                    required : '等级名称不能为空',
                    remote   : '该等级名称已经存在，请您换一个'
                },
                sgPrice : {
                    required  : "收费标准不能为空"
                },
                sgGoodsLimit : {
                    digits : '仅能为整数'
                },
                sg_space_limit : {
                    digits  : '仅能为整数'
                },
                sgSort  : {
                    required : '级别信息不能为空',
                    digits   : '仅能为整数',
                    remote   : '级别已经存在'
                }
            }
        });
    });
</script>
</body></html>
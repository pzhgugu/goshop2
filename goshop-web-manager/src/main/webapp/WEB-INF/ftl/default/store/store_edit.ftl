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
<style type="text/css">
    .d_inline {
        display:inline;
    }
</style>

<div class="page">
    <div class="fixed-bar">
        <div class="item-title">
            <h3>店铺</h3>
            <ul class="tab-base">
                <li><a href="${S_URL}/store/store"><span>管理</span></a></li>
                <li><a href="${S_URL}/store_join"><span>开店申请</span></a></li>
                <li><a class="current" href="JavaScript:void(0);"><span>编辑</span></a></li>
            </ul>
        </div>
    </div>
    <div class="fixed-empty"></div>
    <form method="post" id="store_form">
        <input type="hidden" value="${P_STORE.storeId}" name="storeId">
        <table class="table tb-type2">
            <tbody>
            <tr class="noborder" style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
                <td class="required" colspan="2"><label>店主账号:</label></td>
            </tr>
            <tr class="noborder" style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
                <td class="vatop rowform">${P_STORE.memberName}</td>
                <td class="vatop tips"></td>
            </tr>
            <tr style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
                <td class="required" colspan="2"><label for="storeName" class="validation"> 店铺:</label></td>
            </tr>
            <tr class="noborder" style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
                <td class="vatop rowform">
                    <input type="text" class="txt" name="storeName" id="storeName" value="${P_STORE.storeName}"></td>
                <td class="vatop tips"></td>
            </tr>
            <tr style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
                <td class="required" colspan="2"><label>所属分类:</label></td>
            </tr>
            <tr class="noborder" style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
                <td class="vatop rowform"><select name="scId">
                    <option value="0">请选择...</option>
                <#list P_PARENT_STORECLASS as storeClass>
                    <option value="${storeClass.id}" <#if storeClass.id==P_STORE.scId>selected="selected"</#if>>&nbsp;&nbsp;${storeClass.name}</option>
                    <#if storeClass.children??>
                        <#list storeClass.children as storeClassChildren>
                            <option value="${storeClassChildren.id}" <#if storeClassChildren.id==P_STORE.scId>selected="selected"</#if>>
                                &nbsp;&nbsp;&nbsp;&nbsp;${storeClassChildren.name}</option>
                        </#list>
                    </#if>
                </#list>
                </select></td>
                <td class="vatop tips"></td>
            </tr>
            </tbody>
            <tbody>
            <tr style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
                <td class="required" colspan="2"><label>
                    <label for="gradeId"> 所属等级: </label>
                </label></td>
            </tr>
            <tr class="noborder" style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
                <td class="vatop rowform"><select name="gradeId" id="gradeId">
                    <#list P_STORE_GRADE as grade>
                    <option value="${grade.sgId}" <#if grade.sgId==P_STORE.gradeId>selected="selected"</#if>>${grade.sgName}</option>
                    </#list>
                </select></td>
                <td class="vatop tips"></td>
            </tr>
            <tr style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
                <td class="required" colspan="2"><label>有效期至:</label></td>
            </tr>
            <tr class="noborder" style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
                <td class="vatop rowform">
                    <input type="text" class="txt date" name="storeEndTime" id="storeEndTime" value="${(P_STORE.storeEndTime?string("yyyy-MM-dd"))!}" readonly="readonly"></td>
                <td class="vatop tips">格式：2009-4-30，留空表示不限时间</td>
            </tr>
            <tr>
                <td class="required" colspan="2"><label>
                    <label for="state">状态:</label>
                </label></td>
            </tr>
            <tr class="noborder">
                <td class="vatop rowform onoff"><label class="cb-enable <#if P_STORE.storeState==1> selected</#if>" for="store_state1"><span>开启</span></label>
                    <label class="cb-disable <#if P_STORE.storeState==0> selected</#if>" for="store_state0"><span>关闭</span></label>
                    <input type="radio" value="1" onclick="$('#tr_store_close_info').hide();" <#if P_STORE.storeState==1> checked="checked"</#if> name="storeState" id="store_state1">
                    <input type="radio" value="0" onclick="$('#tr_store_close_info').show();" <#if P_STORE.storeState==0> checked="checked"</#if> name="storeState" id="store_state0"></td>
                <td class="vatop tips"></td>
            </tr>
            </tbody>
            <tbody id="tr_store_close_info" <#if P_STORE.storeState==1>style="display: none;"</#if>>
            <tr>
                <td class="required" colspan="2"><label for="storeCloseInfo">关闭原因:</label></td>
            </tr>
            <tr class="noborder">
                <td class="vatop rowform">
                    <textarea id="storeCloseInfo" class="tarea" rows="6" name="storeCloseInfo">${P_STORE.storeCloseInfo!}</textarea></td>
                <td class="vatop tips"></td>
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
<script charset="utf-8" src="${S_COMMON_URL}/scripts/shop/common_select.js" type="text/javascript"></script>
<script src="${S_COMMON_URL}/scripts/jquery-ui/jquery.ui.js" type="text/javascript"></script>
<script charset="utf-8" src="${S_COMMON_URL}/scripts/jquery-ui/i18n/zh-CN.js"></script>
<link href="${S_COMMON_URL}/scripts/jquery-ui/themes/ui-lightness/jquery.ui.css" type="text/css" rel="stylesheet">
<script type="text/javascript">
    var SITEURL = "${S_URL}";
    function del_auth(key){
        var store_id='2';
        $.get("#",{'key':key,'store_id':store_id},function(date){
            if(date){
                $("#"+key).remove();
                $("#"+key+"_del").remove();
                alert('认证文件删除成功');
            }
            else{
                alert('认证文件删除失败');
            }
        });
    }
    $(function(){

        $('#storeEndTime').datepicker();
        regionInit("region");
        $('input[class="edit_region"]').click(function(){
            $(this).css('display','none');
            $(this).parent().children('select').css('display','');
            $(this).parent().children('span').css('display','none');
        });
//按钮先执行验证再提交表单

        $("#submitBtn").click(function(){
            if($("#store_form").valid()){
                $("#store_form").submit();
            }
        });

//
        $('#store_form').validate({
            errorPlacement: function(error, element){
                error.appendTo(element.parentsUntil('tr').parent().prev().find('td:first'));
            },

            rules : {
                storeName: {
                    required : true
                }
            },
            messages : {
                storeName: {
                    required: '请输入店铺名称'
                }
            }
        });
    });
</script>

<div class="ui-datepicker ui-widget ui-widget-content ui-helper-clearfix ui-corner-all" id="ui-datepicker-div"></div></body>

</html>
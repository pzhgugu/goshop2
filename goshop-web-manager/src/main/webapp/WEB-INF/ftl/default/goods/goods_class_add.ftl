<#assign S_URL=request.contextPath />
<!DOCTYPE html>
<html>
<head>
    <meta content="IE=edge;chrome=1" http-equiv="X-UA-Compatible">
    <meta content="text/html; charset=UTF-8" http-equiv="Content-Type">
    <title>商品分类新增</title>

    <script src="${S_COMMON_URL}/scripts/jquery/jquery.js"></script>
    <script src="${S_COMMON_URL}/scripts/jquery/jquery-browser.js"></script>
    <script src="${S_COMMON_URL}/scripts/jquery/waypoints.js"></script>
    <script src="${S_COMMON_URL}/scripts/jquery/jquery.validation.js"></script>
    <script src="${S_COMMON_URL}/scripts/jquery-ui/jquery.ui.js"></script>
    <script src="${S_COMMON_URL}/scripts/utils/area_array.js"></script>
    <script src="${S_COMMON_URL}/scripts/shop/common.js"></script>
    <script src="${S_URL}/static/scripts/admincp.js"></script>
    <script charset="utf-8" src="${S_COMMON_URL}/scripts/shop/common_select.js" type="text/javascript"></script>
    <script src="${S_COMMON_URL}/scripts/shop/perfect-scrollbar.min.js" type="text/javascript"></script>
    <script src="${S_COMMON_URL}/scripts/jquery/jquery.mousewheel.js" type="text/javascript"></script>

    <link id="cssfile2" type="text/css" rel="stylesheet" href="${S_URL}/static/styles/skin_0.css">
    <script type="text/javascript">
        SITEURL = '${S_URL}';
        SELECT_URL = '${S_URL}';
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
                <li><a href="${S_URL}/goods_class/goods_class"><span>管理</span></a></li>
<#if P_GOODS_CLASS??>
    <li><a href="${S_URL}/goods_class/save"><span>新增</span></a></li>
    <li><a class="current"><span>编辑</span></a></li>
<#else>
    <li><a class="current"><span>新增</span></a></li>
</#if>
                <li><a href="#"><span>导出</span></a></li>
                <li><a href="#"><span>导入</span></a></li>
                <li><a href="#"><span>TAG管理</span></a></li></ul>    </div>
    </div>
    <div class="fixed-empty"></div>
    <form method="post" enctype="multipart/form-data" id="goods_class_form">
        <input type="hidden" value="<#if P_GOODS_CLASS??>${P_GOODS_CLASS.gcId}</#if>" name="gcId">
        <table class="table tb-type2">
            <tbody>
            <tr class="noborder" style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
                <td class="required" colspan="2"><label for="gcName" class="validation">分类名称:</label></td>
            </tr>
            <tr class="noborder" style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
                <td class="vatop rowform">
                    <input type="text" class="txt" maxlength="20" id="gcName" name="gcName" value="<#if P_GOODS_CLASS??>${P_GOODS_CLASS.gcName!''}</#if>"></td>
                <td class="vatop tips"></td>
            </tr>
            <tr style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
                <td colspan="2"><label for="pic">分类图片:</label></td>
            </tr>
            <tr class="noborder" style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
                <td class="vatop rowform"><span class="type-file-box"><input type="text" class="type-file-text" id="textfield1" name="textfield">
            <input type="button" class="type-file-button" value="" id="button1" name="button">
            <input type="file" nc_type="change_pic" hidefocus="true" size="30" id="pic" class="type-file-file" name="pic">
            </span></td>
                <td class="vatop tips">只有第一级分类可以上传图片，建议用16px * 16px，超出后自动隐藏</td>
            </tr>
            <tr style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
                <td class="required" colspan="2"><label for="parent_id">上级分类:</label></td>
            </tr>
            <tr class="noborder" style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
                <td class="vatop rowform"><select id="gcParentId" name="gcParentId">
                    <option value="0">请选择...</option>
<#if P_GOODS_CLASS??>
    <#list P_GOODS_CLASS_LIST as goodsClass>
        <option value="${goodsClass.gcId}" <#if goodsClass.gcId==P_GOODS_CLASS.gcParentId>selected="selected"</#if>>&nbsp;&nbsp;${goodsClass.gcName}</option>
        <#if (goodsClass.children?size>0) >
            <#list goodsClass.children as cGc>
                <option value="${cGc.gcId}" <#if cGc.gcId==P_GOODS_CLASS.gcParentId>selected="selected"</#if>>&nbsp;&nbsp;&nbsp;&nbsp;${cGc.gcName}</option>
            </#list>
        </#if>
    </#list>
<#else >
    <#list P_GOODS_CLASS_LIST as goodsClass>
        <option value="${goodsClass.gcId}" <#if P_PARENT_ID??><#if goodsClass.gcId==P_PARENT_ID>selected="selected"</#if></#if>>&nbsp;&nbsp;${goodsClass.gcName}</option>
        <#if (goodsClass.children?size>0) >
            <#list goodsClass.children as cGc>
                <option value="${cGc.gcId}" <#if P_PARENT_ID??><#if cGc.gcId==P_PARENT_ID>selected="selected"</#if></#if>>&nbsp;&nbsp;&nbsp;&nbsp;${cGc.gcName}</option>
            </#list>
        </#if>
    </#list>
</#if>

                </select></td>
                <td class="vatop tips">如果选择上级分类，那么新增的分类则为被选择上级分类的子分类</td>
            </tr>
            <tr style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
                <td id="gcategory" class="required" colspan="2">
                    <label for="gcName">类型:</label>
                    <select class="class-select valid">
                        <option value="0">请选择...</option>
                        <#list P_GOODS_CLASS_LIST as goodsClass>
                            <option value="${goodsClass.gcId}">${goodsClass.gcName}</option>
                        </#list>
                    </select>
                    （快捷定位）          </td>
            </tr>
            <tr class="noborder" style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
                <td class="vatop rowform"><input type="hidden" value="" id="t_name" name="t_name">
                    <div id="type_div" style="position:relative; max-height:240px; overflow: hidden;" class="ps-container">
<#if P_GOODS_CLASS??>
                        <div>
                            <dl style="margin:10px 0;">
                                <dd style="display:inline-block; margin-right:10px;">
                                    <input type="radio" <#if P_GOODS_CLASS.typeId==0>checked="checked"</#if> value="0" name="typeId">
                                    <span>无类型</span>
                                </dd>
                            </dl>
                        <#list P_GOODS_TYPE_LIST as goodsType>
                            <dl style="margin:10px 0;"><dt style="font-weight:600;" id="type_dt_14">${goodsType.className}</dt>
                                <dd style="display:inline-block; margin-right:10px;">
                                    <input type="radio" value="${goodsType.typeId}" <#if P_GOODS_CLASS.typeId==goodsType.typeId>checked="checked"</#if> name="typeId">
                                    <span>${goodsType.typeName}</span>
                                </dd>
                            </dl>
                        </#list>
<#else>
                    <div>
                    <dl style="margin:10px 0;">
                        <dd style="display:inline-block; margin-right:10px;">
                            <input type="radio" checked="checked" value="0" name="typeId">
                            <span>无类型</span>
                        </dd>
                    </dl>
                    <#list P_GOODS_TYPE_LIST as goodsType>
                        <dl style="margin:10px 0;"><dt style="font-weight:600;" id="type_dt_14">${goodsType.className}</dt>
                            <dd style="display:inline-block; margin-right:10px;">
                                <input type="radio" value="${goodsType.typeId}" name="typeId">
                                <span>${goodsType.typeName}</span>
                            </dd>
                        </dl>
                    </#list>
</#if>
                        </div><div class="ps-scrollbar-x" style="left: 0px; bottom: 3px; width: 0px;"></div><div class="ps-scrollbar-y" style="top: 0px; right: 3px; height: 0px;"></div></div>
<#if P_GOODS_CLASS??>
    <div class=" mtm"><input type="checkbox" id="t_associated" checked="checked" value="1" name="t_associated"><label for="t_associated">关联到子分类</label></div>
</#if>
                </td>
                <td class="vatop tips">如果当前下拉选项中没有适合的类型，可以去<a href="JavaScript:void(0);" onclick="window.parent.openItem('type,type,goods')">类型管理</a>功能中添加新的类型</td>
            </tr>
            <tr>
                <td class="required" colspan="2"><label>排序:</label></td>
            </tr>
            <tr class="noborder" style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
                <td class="vatop rowform"><input type="text" class="txt" id="gcSort" name="gcSort" value="<#if P_GOODS_CLASS??>${P_GOODS_CLASS.gcSort!''}</#if>"></td>
                <td class="vatop tips">数字范围为0~255，数字越小越靠前</td>
            </tr>
            </tbody>
            <tfoot>
            <tr>
                <td colspan="2"><a id="submitBtn" class="btn" href="JavaScript:void(0);"><span>提交</span></a></td>
            </tr>
            </tfoot>
        </table>
    </form>
</div>
<script>
    //按钮先执行验证再提交表单
    $(function(){

        $('#type_div').perfectScrollbar();

        $("#submitBtn").click(function(){
            if($("#goods_class_form").valid()){
                $("#goods_class_form").submit();
            }
        });

        $("#pic").change(function(){
            $("#textfield1").val($(this).val());
        });
        $('input[type="radio"][name="typeId"]').click(function(){
            if($(this).val() == '0'){
                $('#t_name').val('');
            }else{
                $('#t_name').val($(this).next('span').html());
            }
        });

        $('#goods_class_form').validate({
            errorPlacement: function(error, element){
                error.appendTo(element.parent().parent().prev().find('td:first'));
            },
            rules : {
                gcName : {
                    required : true,
                    remote   : {
                        url :'check_class_name',
                        type:'get',
                        data:{
                            gcName : function(){
                                return $('#gcName').val();
                            },
                            gcParentId : function() {
                                return $('#gcParentId').val();
                            },
                            gc_id : ''
                        }
                    }
                },
                gcSort : {
                    number   : true
                }
            },
            messages : {
                gcName : {
                    required : '分类名称不能为空',
                    remote   : '该分类名称已经存在了，请您换一个'
                },
                gcSort  : {
                    number   : '分类排序仅能为数字'
                }
            }
        });

        // 所属分类
        $("#gcParentId").live('change',function(){
            type_scroll($(this));
        });
        // 类型搜索
        $("#gcategory > select").live('change',function(){
            type_scroll($(this));
        });
    });
    var typeScroll = 0;
    function type_scroll(o){
        var id = o.val();
        if(!$('#type_dt_'+id).is('dt')){
            return false;
        }
        $('#type_div').scrollTop(-typeScroll);
        var sp_top = $('#type_dt_'+id).offset().top;
        var div_top = $('#type_div').offset().top;
        $('#type_div').scrollTop(sp_top-div_top);
        typeScroll = sp_top-div_top;
    }
    gcategoryInit('gcategory');
</script>
</body>

</html>
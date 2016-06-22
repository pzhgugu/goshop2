<#assign S_URL=request.contextPath />
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta charset="utf-8">
    <title>商家入驻</title>
    <link type="text/css" rel="stylesheet" href="${S_COMMON_URL}/styles/shop/base.css">
    <link type="text/css" rel="stylesheet" href="${S_URL}/static/styles/store_joinin.css">
    <link type="text/css" rel="stylesheet" href="${S_COMMON_URL}/scripts/dialog/dialog.css">
    <link type="text/css" rel="stylesheet" href="${S_COMMON_URL}/scripts/jquery-ui/themes/ui-lightness/jquery.ui.css">
    <script src="${S_COMMON_URL}/scripts/jquery/jquery.js"></script>
    <script src="${S_COMMON_URL}/scripts/jquery/jquery-browser.js"></script>
    <script src="${S_COMMON_URL}/scripts/jquery/waypoints.js"></script>
    <script src="${S_COMMON_URL}/scripts/jquery/jquery.validation.js"></script>
    <script src="${S_COMMON_URL}/scripts/jquery-ui/jquery.ui.js"></script>
    <script src="${S_COMMON_URL}/scripts/utils/area_array.js"></script>
    <script src="${S_COMMON_URL}/scripts/shop/common.js"></script>
    <script src="${S_COMMON_URL}/scripts/shop/common_select.js"></script>
</head>

<body>
<#include "header.ftl"/>

<div class="container wrapper">
    <#include "sidebar.ftl"/>

    <div class="main">
        <!-- 店铺信息 -->

        <div class="apply-store-info" id="apply_store_info">
            <div class="apply-company-info" id="apply_company_info">
                <div class="note"><i></i>店铺经营类目为商城商品分类，请根据实际运营情况添加一个或多个经营类目。</div>
                <form method="post" action="${S_URL}/store_join/step4.html" id="form_store_info">
                    <table cellspacing="0" cellpadding="0" border="0" class="all">
                        <thead>
                        <tr>
                            <th colspan="20">店铺经营信息</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <th class="w150"><i>*</i>商家帐号：</th>
                            <td><input type="text" class="w200" name="sellerName" id="sellerName">
                                <span></span>

                                <p class="emphasis">此帐号为日后登录并管理商家中心时使用，注册后不可修改，请牢记。</p></td>
                        </tr>
                        <tr>
                            <th class="w150"><i>*</i>店铺名称：</th>
                            <td><input type="text" class="w200" name="storeName" id="storeName">
                                <span></span>

                                <p class="emphasis">店铺名称注册后不可修改，请认真填写。</p></td>
                        </tr>
                        <tr>
                            <th><i>*</i>店铺等级：</th>
                            <td><select id="sgId" name="sgId">
                                <option value="0">请选择</option>
                                <#list P_STOREGRADE as storeGrade>
                                    <option data-explain="${storeGrade.sgDescription}"
                                            value="${storeGrade.sgId}">${storeGrade.sgName}</option>
                                </#list>
                            </select>
                                <input type="hidden" name="sgName" id="sgName">
                                <span></span>

                                <div class="grade_explain" id="grade_explain"></div>
                            </td>
                        </tr>
                        <tr>
                            <th><i>*</i>店铺分类：</th>
                            <td><select id="scId" name="scId">
                                <option value="0">请选择</option>
                                <#list P_PARENT_STORECLASS as storeClass>
                                    <option value="${storeClass.id}">&nbsp;&nbsp;${storeClass.name}</option>
                                    <#if storeClass.children??>
                                        <#list storeClass.children as storeClassChildren>
                                            <option value="${storeClassChildren.id}">
                                                &nbsp;&nbsp;&nbsp;&nbsp;${storeClassChildren.name}</option>
                                        </#list>
                                    </#if>
                                </#list>
                            </select>
                                <input type="hidden" name="scName" id="scName">
                                <span></span>

                                <p class="emphasis">请根据您所经营的内容认真选择店铺分类，注册后商家不可自行修改。</p></td>
                        </tr>
                        <tr>
                            <th><i>*</i>经营类目：</th>
                            <td><a class="btn" id="btn_select_category" href="###"
                                   style="display: none;">+选择添加类目</a>

                                <div style="" id="gcategory">
                                    <select id="gcategory_class1" class="valid">
                                        <option value="0">请选择</option>
                                        <#list P_PARENT_GOODSCLASS as goodsClass>
                                            <option value="${goodsClass.gcId}">${goodsClass.gcName}</option>
                                        </#list>
                                    </select>
                                    <input type="button" value="确认" id="btn_add_category">
                                    <input type="button" value="取消" id="btn_cancel_category">
                                </div>
                                <input type="hidden" name="store_class" id="store_class">
                                <span></span>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <table cellspacing="0" cellpadding="0" border="0" class="type" id="table_category">
                                    <thead>
                                    <tr>
                                        <th>一级类目</th>
                                        <th>二级类目</th>
                                        <th>三级类目</th>
                                        <th>操作</th>
                                    </tr>
                                    </thead>
                                </table>
                            </td>
                        </tr>
                        </tbody>
                        <tfoot>
                        <tr>
                            <td colspan="20">&nbsp;</td>
                        </tr>
                        </tfoot>
                    </table>
                </form>
                <div class="bottom"><a class="btn" href="javascript:;" id="btn_apply_store_next">下一步</a></div>
            </div>
        </div>
    </div>

    <#include "../button.ftl"/>
    <#include "../footer.ftl"/>
    <script type="text/javascript">
        SITEURL = '${S_URL}';
        SELECT_URL="${SHOP_REST_URL}";
        $(document).ready(function () {
            gcategoryInit("gcategory");

            $('#form_store_info').validate({
                errorPlacement: function (error, element) {
                    element.nextAll('span').first().after(error);
                },
                rules: {
                    sellerName: {
                        required: true,
                        maxlength: 50,
                        remote   : {
                            url :'${SHOP_REST_URL}/store_join/verification/sellerName',
                            type:'get',
                            dataType:'jsonp',
                            data: {storeName: $('#sellerName').val()}
                        }
                    },
                    storeName: {
                        required: true,
                        maxlength: 50,
                        remote   : {
                            url :'${SHOP_REST_URL}/store_join/verification/storeName',
                            type:'get',
                            dataType:'jsonp',
                            data: {storeName: $('#storeName').val()}
                        }
                    },
                    sgName: {
                        required: true
                    },
                    scName: {
                        required: true
                    },
                    store_class: {
                        required: true,
                        min: 1
                    }
                },
                messages: {
                    sellerName: {
                        required: '请填写卖家用户名',
                        maxlength: jQuery.validator.format("最多{0}个字"),
                        remote:"卖家帐号已存在"
                    },
                    storeName: {
                        required: '请填写店铺名称',
                        maxlength: jQuery.validator.format("最多{0}个字"),
                        remote:"店铺名称已存在"
                    },
                    sgName: {
                        required: '请选择店铺等级'
                    },
                    scName: {
                        required: '请选择店铺分类'
                    },
                    store_class: {
                        required: '请选择经营类目',
                        min: '请选择经营类目'
                    }
                }
            });

            $('#btn_select_category').on('click', function () {
                $('#gcategory').show();
                $('#btn_select_category').hide();
                $('#gcategory_class1').val(0).nextAll("select").remove();
            });

            $('#btn_add_category').on('click', function () {
                var tr_category = '<tr class="store-class-item">';
                var category_id = '';
                var category_name = '';
                var class_count = 0;
                var validation = true;
                $('#gcategory').find('select').each(function () {
                    if (parseInt($(this).val(), 10) > 0) {
                        var name = $(this).find('option:selected').text();
                        tr_category += '<td>';
                        tr_category += name;
                        tr_category += '</td>';
                        category_id += $(this).val() + ',';
                        category_name += name + ',';
                        class_count++;
                    } else {
                        validation = false;
                    }
                });
                if (validation) {
                    for (; class_count < 3; class_count++) {
                        tr_category += '<td></td>';
                    }
                    tr_category += '<td><a nctype="btn_drop_category" href="javascript:;">删除</a></td>';
                    tr_category += '<input name="store_class_ids[]" type="hidden" value="' + category_id + '" />';
                    tr_category += '<input name="store_class_names[]" type="hidden" value="' + category_name + '" />';
                    tr_category += '</tr>';
                    $('#table_category').append(tr_category);
                    $('#gcategory').hide();
                    $('#btn_select_category').show();
                    select_store_class_count();
                } else {
                    showError('请选择分类');
                }
            });

            $('#table_category').on('click', '[nctype="btn_drop_category"]', function () {
                $(this).parent('td').parent('tr').remove();
                select_store_class_count();
            });

            // 统计已经选择的经营类目
            function select_store_class_count() {
                var store_class_count = $('#table_category').find('.store-class-item').length;
                $('#store_class').val(store_class_count);
            }

            $('#btn_cancel_category').on('click', function () {
                $('#gcategory').hide();
                $('#btn_select_category').show();
            });

            $('#sgId').on('change', function () {
                if (!!$(this).val()) {
                    $('#grade_explain').text($(this).find('option:selected').attr('data-explain'));
                    $('#sgName').val($(this).find('option:selected').text());
                } else {
                    $('#sgName').val('');
                }
            });

            $('#scId').on('change', function () {
                if (!!$(this).val()) {
                    $('#scName').val($(this).find('option:selected').text());
                } else {
                    $('#scName').val('');
                }
            });


            $('#btn_apply_store_next').on('click', function () {
                if ($('#form_store_info').valid()) {
                    $('#form_store_info')[0].submit();
                }
            });
        });
    </script>
</body>

</html>
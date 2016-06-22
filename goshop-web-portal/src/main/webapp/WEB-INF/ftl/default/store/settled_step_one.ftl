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
    </head>


    <body>
    <#include "header.ftl"/>

    <div class="container wrapper">
        <#include "sidebar.ftl"/>
        <div class="main">
            <!-- 公司信息 -->

            <div class="apply-company-info" id="apply_company_info">
                <div class="note"><i></i>以下所需要上传的电子版资质文件仅支持JPG\GIF\PNG格式图片，大小请控制在1M之内。</div>
                <form enctype="multipart/form-data" method="post" action="${S_URL}/store_join/step2.html"
                      id="form_company_info">
                    <table cellspacing="0" cellpadding="0" border="0" class="all">
                        <thead>
                        <tr>
                            <th colspan="2">公司及联系人信息</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <th><i>*</i>公司名称：</th>
                            <td><input type="text" class="w200" name="companyName">
                                <span></span></td>
                        </tr>
                        <tr>
                            <th><i>*</i>公司所在地：</th>
                            <td><input type="hidden" value="" name="companyAddress" id="companyAddress">
                                <span></span></td>
                        </tr>
                        <tr>
                            <th><i>*</i>公司详细地址：</th>
                            <td><input type="text" class="w200" name="companyAddressDsetail">
                                <span></span></td>
                        </tr>
                        <tr>
                            <th><i>*</i>公司电话：</th>
                            <td><input type="text" class="w100" name="companyPhone">
                                <span></span></td>
                        </tr>
                        <tr>
                            <th><i>*</i>员工总数：</th>
                            <td><input type="text" class="w50" name="companyEmployeeCount">
                                &nbsp;人 <span></span></td>
                        </tr>
                        <tr>
                            <th><i>*</i>注册资金：</th>
                            <td><input type="text" class="w50" name="companyRegisteredCapital">
                                &nbsp;万元<span></span></td>
                        </tr>
                        <tr>
                            <th><i>*</i>联系人姓名：</th>
                            <td><input type="text" class="w100" name="contactsName">
                                <span></span></td>
                        </tr>
                        <tr>
                            <th><i>*</i>联系人电话：</th>
                            <td><input type="text" class="w100" name="contactsPhone">
                                <span></span></td>
                        </tr>
                        <tr>
                            <th><i>*</i>电子邮箱：</th>
                            <td><input type="text" class="w200" name="contactsEmail">
                                <span></span></td>
                        </tr>
                        </tbody>
                        <tfoot>
                        <tr>
                            <td colspan="20">&nbsp;</td>
                        </tr>
                        </tfoot>
                    </table>
                    <table cellspacing="0" cellpadding="0" border="0" class="all">
                        <thead>
                        <tr>
                            <th colspan="20">营业执照信息（副本）</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <th><i>*</i>营业执照号：</th>
                            <td><input type="text" class="w200" name="businessLicenceNumber">
                                <span></span></td>
                        </tr>
                        <tr>
                            <th><i>*</i>营业执照所在地：</th>
                            <td><input type="hidden" name="businessLicenceAddress" id="businessLicenceAddress">
                                <span></span></td>
                        </tr>
                        <tr>
                            <th><i>*</i>营业执照有效期：</th>
                            <td><input type="text" class="w90" name="businessLicenceStart" id="businessLicenceStart"
                                       readonly="readonly">
                                <span></span>-
                                <input type="text" class="w90" name="businessLicenceEnd" id="businessLicenceEnd"
                                       readonly="readonly">
                                <span></span></td>
                        </tr>
                        <tr>
                            <th><i>*</i>法定经营范围：</th>
                            <td><textarea class="w200" rows="3" name="businessSphere"></textarea>
                                <span></span></td>
                        </tr>
                        <tr>
                            <th><i>*</i>营业执照号电子版：</th>
                            <td><input type="file" class="w200" name="businessLicenceNumber_electronic">
                                <span class="block">请确保图片清晰，文字可辨并有清晰的红色公章。</span></td>
                        </tr>
                        </tbody>
                        <tfoot>
                        <tr>
                            <td colspan="20">&nbsp;</td>
                        </tr>
                        </tfoot>
                    </table>
                    <table cellspacing="0" cellpadding="0" border="0" class="all">
                        <thead>
                        <tr>
                            <th colspan="20">组织机构代码证</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <th><i>*</i>组织机构代码：</th>
                            <td><input type="text" class="w200" name="organizationCode">
                                <span></span></td>
                        </tr>
                        <tr>
                            <th><i>*</i>组织机构代码证电子版：</th>
                            <td><input type="file" name="organization_code_electronic">
                                <span class="block">请确保图片清晰，文字可辨并有清晰的红色公章。</span></td>
                        </tr>
                        </tbody>
                        <tfoot>
                        <tr>
                            <td colspan="20">&nbsp;</td>
                        </tr>
                        </tfoot>
                    </table>
                    <table cellspacing="0" cellpadding="0" border="0" class="all">
                        <thead>
                        <tr>
                            <th colspan="20">一般纳税人证明<em>注：所属企业具有一般纳税人证明时，此项为必填。</em></th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <th class="w150"><i>*</i>一般纳税人证明：</th>
                            <td><input type="file" name="general_taxpayer">
                                <span class="block">请确保图片清晰，文字可辨并有清晰的红色公章。</span></td>
                        </tr>
                        </tbody>
                        <tfoot>
                        <tr>
                            <td colspan="20">&nbsp;</td>
                        </tr>
                        </tfoot>
                    </table>
                </form>
                <div class="bottom"><a class="btn" href="javascript:;" id="btn_apply_company_next">下一步</a></div>
            </div>
        </div>

    </div>

    <#include "../button.ftl"/>
    <#include "../footer.ftl"/>




    <script type="text/javascript">
        $(document).ready(function () {

            $('#companyAddress').nc_region();
            $('#businessLicenceAddress').nc_region();

            $('#businessLicenceStart').datepicker({dateFormat: 'yy-mm-dd'});
            $('#businessLicenceEnd').datepicker({dateFormat: 'yy-mm-dd'});

            $('#btn_apply_agreement_next').on('click', function () {
                if ($('#input_apply_agreement').prop('checked')) {
                    $('#apply_agreement').hide();
                    $('#apply_company_info').show();
                } else {
                    alert('请阅读并同意协议');
                }
            });

            $('#form_company_info').validate({
                errorPlacement: function (error, element) {
                    element.nextAll('span').first().after(error);
                },
                rules: {
                    companyName: {
                        required: true,
                        maxlength: 50
                    },
                    companyAddress: {
                        required: true,
                        maxlength: 50
                    },
                    companyAddressDsetail: {
                        required: true,
                        maxlength: 50
                    },
                    companyPhone: {
                        required: true,
                        maxlength: 20
                    },
                    companyEmployeeCount: {
                        required: true,
                        digits: true
                    },
                    companyRegisteredCapital: {
                        required: true,
                        digits: true
                    },
                    contactsName: {
                        required: true,
                        maxlength: 20
                    },
                    contactsPhone: {
                        required: true,
                        maxlength: 20
                    },
                    contactsEmail: {
                        required: true,
                        email: true
                    },
                    businessLicenceNumber: {
                        required: true,
                        maxlength: 20
                    },
                    businessLicenceAddress: {
                        required: true,
                        maxlength: 50
                    },
                    businessLicenceStart: {
                        required: true
                    },
                    businessLicenceEnd: {
                        required: true
                    },
                    businessSphere: {
                        required: true,
                        maxlength: 500
                    },
                    businessLicenceNumber_electronic: {
                        required: true
                    },
                    organizationCode: {
                        required: true,
                        maxlength: 20
                    },
                    organization_code_electronic: {
                        required: true
                    }
                },
                messages: {
                    companyName: {
                        required: '请输入公司名称',
                        maxlength: jQuery.validator.format("最多{0}个字")
                    },
                    companyAddress: {
                        required: '请选择区域地址',
                        maxlength: jQuery.validator.format("最多{0}个字")
                    },
                    companyAddressDsetail: {
                        required: '请输入公司详细地址',
                        maxlength: jQuery.validator.format("最多{0}个字")
                    },
                    companyPhone: {
                        required: '请输入公司电话',
                        maxlength: jQuery.validator.format("最多{0}个字")
                    },
                    companyEmployeeCount: {
                        required: '请输入员工总数',
                        digits: '必须为数字'
                    },
                    companyRegisteredCapital: {
                        required: '请输入注册资金',
                        digits: '必须为数字'
                    },
                    contactsName: {
                        required: '请输入联系人姓名',
                        maxlength: jQuery.validator.format("最多{0}个字")
                    },
                    contactsPhone: {
                        required: '请输入联系人电话',
                        maxlength: jQuery.validator.format("最多{0}个字")
                    },
                    contactsEmail: {
                        required: '请输入常用邮箱地址',
                        email: '请填写正确的邮箱地址'
                    },
                    businessLicenceNumber: {
                        required: '请输入营业执照号',
                        maxlength: jQuery.validator.format("最多{0}个字")
                    },
                    businessLicenceAddress: {
                        required: '请选择营业执照所在地',
                        maxlength: jQuery.validator.format("最多{0}个字")
                    },
                    businessLicenceStart: {
                        required: '请选择生效日期'
                    },
                    businessLicenceEnd: {
                        required: '请选择结束日期'
                    },
                    businessSphere: {
                        required: '请填写营业执照法定经营范围',
                        maxlength: jQuery.validator.format("最多{0}个字")
                    },
                    businessLicenceNumber_electronic: {
                        required: '请选择上传营业执照号电子版文件'
                    },
                    organizationCode: {
                        required: '请填写组织机构代码',
                        maxlength: jQuery.validator.format("最多{0}个字")
                    },
                    organization_code_electronic: {
                        required: '请选择上传组织机构代码证电子版文件'
                    }
                }
            });

            $('#btn_apply_company_next').on('click', function () {
                if ($('#form_company_info').valid()) {
                    $('#form_company_info').submit();
                }
            });
        });
    </script>
    </body>
</html>
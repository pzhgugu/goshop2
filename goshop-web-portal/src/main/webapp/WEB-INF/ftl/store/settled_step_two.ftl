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

            <!-- 公司资质 -->

            <div class="apply-credentials-info" id="apply_credentials_info">
                <div class="note"><i></i>以下所需要上传的电子版资质文件仅支持JPG\GIF\PNG格式图片，大小请控制在1M之内。</div>
                <form enctype="multipart/form-data" method="post" action="${S_URL}/store_join/step3.html"
                      id="form_credentials_info">
                    <table cellspacing="0" cellpadding="0" border="0" class="all">
                        <thead>
                        <tr>
                            <th colspan="20">开户银行信息</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <th class="w150"><i>*</i>银行开户名：</th>
                            <td><input type="text" class="w200 valid" name="bankAccountName">
                                <span></span></td>
                        </tr>
                        <tr>
                            <th><i>*</i>公司银行账号：</th>
                            <td><input type="text" class="w200 valid" name="bankAccountNumber">
                                <span></span></td>
                        </tr>
                        <tr>
                            <th><i>*</i>开户银行支行名称：</th>
                            <td><input type="text" class="w200 valid" name="bankName">
                                <span></span></td>
                        </tr>
                        <tr>
                            <th><i>*</i>支行联行号：</th>
                            <td><input type="text" class="w200 valid" name="bankCode">
                                <span></span></td>
                        </tr>
                        <tr>
                            <th><i>*</i>开户银行所在地：</th>
                            <td><input type="hidden" name="bankAddress" id="bankAddress"><span></span></td>
                        </tr>
                        <tr>
                            <th><i>*</i>开户银行许可证电子版：</th>
                            <td><input type="file" name="bank_licence_electronic">
                                <span class="block">请确保图片清晰，文字可辨并有清晰的红色公章。</span></td>
                        </tr>
                        <tr>
                            <th></th>
                            <td><input type="checkbox" name="isSettlementAccount" id="isSettlementAccount">
                                <label for="isSettlementAccount">此账号为结算账号</label></td>
                        </tr>
                        </tbody>
                        <tfoot>
                        <tr>
                            <td colspan="20">&nbsp;</td>
                        </tr>
                        </tfoot>
                    </table>
                    <div id="div_settlement">
                        <table cellspacing="0" cellpadding="0" border="0" class="all">
                            <thead>
                            <tr>
                                <th colspan="20">结算账号信息</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <th class="w150"><i>*</i>银行开户名：</th>
                                <td><input type="text" class="w200" name="settlementBankAccountName"
                                           id="settlementBankAccountName">
                                    <span></span></td>
                            </tr>
                            <tr>
                                <th><i>*</i>公司银行账号：</th>
                                <td><input type="text" class="w200" name="settlementBankAccountNumber"
                                           id="settlementBankAccountNumber">
                                    <span></span></td>
                            </tr>
                            <tr>
                                <th><i>*</i>开户银行支行名称：</th>
                                <td><input type="text" class="w200" name="settlementBankName" id="settlementBankName">
                                    <span></span></td>
                            </tr>
                            <tr>
                                <th><i>*</i>支行联行号：</th>
                                <td><input type="text" class="w200" name="settlementBankCode" id="settlementBankCode">
                                    <span></span></td>
                            </tr>
                            <tr>
                                <th><i>*</i>开户银行所在地：</th>
                                <td><input type="hidden" name="settlementBankAddress"
                                           id="settlementBankAddress"><span></span></td>
                            </tr>
                            </tbody>
                            <tfoot>
                            <tr>
                                <td colspan="20">&nbsp;</td>
                            </tr>
                            </tfoot>
                        </table>
                    </div>
                    <table cellspacing="0" cellpadding="0" border="0" class="all">
                        <thead>
                        <tr>
                            <th colspan="20">税务登记证</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <th class="w150"><i>*</i>税务登记证号：</th>
                            <td><input type="text" class="w200" name="taxRegistrationCertificate">
                                <span></span></td>
                        </tr>
                        <tr>
                            <th><i>*</i>纳税人识别号：</th>
                            <td><input type="text" class="w200" name="taxpayerId">
                                <span></span></td>
                        </tr>
                        <tr>
                            <th><i>*</i>税务登记证号电子版：</th>
                            <td><input type="file" name="taxRegistrationCertificate_electronic">
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
                <div class="bottom"><a class="btn" href="javascript:;" id="btn_apply_credentials_next">下一步</a></div>
            </div>
        </div>

        <script type="text/javascript">
            $(document).ready(function () {
                var use_settlement_account = true;
                $("#bankAddress").nc_region();
                $("#settlementBankAddress").nc_region();

                $("#isSettlementAccount").on("click", function () {
                    if ($(this).prop("checked")) {
                        use_settlement_account = false;
                        $("#div_settlement").hide();
                        $("#settlementBankAccountName").val("");
                        $("#settlementBankAccountNumber").val("");
                        $("#settlementBankName").val("");
                        $("#settlementBankCode").val("");
                        $("#settlementBankAddress").val("");
                    } else {
                        use_settlement_account = true;
                        $("#div_settlement").show();
                    }
                });

                $('#form_credentials_info').validate({
                    errorPlacement: function (error, element) {
                        element.nextAll('span').first().after(error);
                    },
                    rules: {
                        bankAccountName: {
                            required: true,
                            maxlength: 50
                        },
                        bankAccountNumber: {
                            required: true,
                            maxlength: 20
                        },
                        bankName: {
                            required: true,
                            maxlength: 50
                        },
                        bankCode: {
                            required: true,
                            maxlength: 20
                        },
                        bankAddress: {
                            required: true
                        },
                        bank_licence_electronic: {
                            required: true
                        },
                        settlementBankAccountName: {
                            required: function () {
                                return use_settlement_account;
                            },
                            maxlength: 50
                        },
                        settlementBankAccountNumber: {
                            required: function () {
                                return use_settlement_account;
                            },
                            maxlength: 20
                        },
                        settlementBankName: {
                            required: function () {
                                return use_settlement_account;
                            },
                            maxlength: 50
                        },
                        settlementBankCode: {
                            required: function () {
                                return use_settlement_account;
                            },
                            maxlength: 20
                        },
                        settlementBankAddress: {
                            required: function () {
                                return use_settlement_account;
                            }
                        },
                        taxRegistrationCertificate: {
                            required: true,
                            maxlength: 20
                        },
                        taxpayerId: {
                            required: true,
                            maxlength: 20
                        },
                        taxRegistrationCertificate_electronic: {
                            required: true
                        }

                    },
                    messages: {
                        bankAccountName: {
                            required: '请填写银行开户名',
                            maxlength: jQuery.validator.format("最多{0}个字")
                        },
                        bankAccountNumber: {
                            required: '请填写公司银行账号',
                            maxlength: jQuery.validator.format("最多{0}个字")
                        },
                        bankName: {
                            required: '请填写开户银行支行名称',
                            maxlength: jQuery.validator.format("最多{0}个字")
                        },
                        bankCode: {
                            required: '请填写支行联行号',
                            maxlength: jQuery.validator.format("最多{0}个字")
                        },
                        bankAddress: {
                            required: '请选择开户银行所在地'
                        },
                        bank_licence_electronic: {
                            required: '请选择上传开户银行许可证电子版文件'
                        },
                        settlementBankAccountName: {
                            required: '请填写银行开户名',
                            maxlength: jQuery.validator.format("最多{0}个字")
                        },
                        settlementBankAccountNumber: {
                            required: '请填写公司银行账号',
                            maxlength: jQuery.validator.format("最多{0}个字")
                        },
                        settlementBankName: {
                            required: '请填写开户银行支行名称',
                            maxlength: jQuery.validator.format("最多{0}个字")
                        },
                        settlementBankCode: {
                            required: '请填写支行联行号',
                            maxlength: jQuery.validator.format("最多{0}个字")
                        },
                        settlementBankAddress: {
                            required: '请选择开户银行所在地'
                        },
                        taxRegistrationCertificate: {
                            required: '请填写税务登记证号',
                            maxlength: jQuery.validator.format("最多{0}个字")
                        },
                        taxpayerId: {
                            required: '请填写纳税人识别号',
                            maxlength: jQuery.validator.format("最多{0}个字")
                        },
                        taxRegistrationCertificate_electronic: {
                            required: '请选择上传税务登记证号电子版文件'
                        }
                    }
                });

                $('#btn_apply_credentials_next').on('click', function () {
                    if ($('#form_credentials_info').valid()) {
                        $('#form_credentials_info').submit();
                    }
                });

            });
        </script>


        <#include "../button.ftl"/>
        <#include "../footer.ftl"/>
    </body>
</html>
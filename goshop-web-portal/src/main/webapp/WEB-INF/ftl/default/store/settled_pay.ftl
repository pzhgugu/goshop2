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

<div class="container wrapper">
    <div class="joinin-pay">
        <table cellspacing="0" cellpadding="0" border="0" class="store-joinin">
            <thead>
            <tr>
                <th colspan="6">公司及联系人信息</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <th class="w150">公司名称：</th>
                <td colspan="5">${P_STORE_JOIN.companyName}</td>
            </tr>
            <tr>
                <th class="w150">公司所在地：</th>
                <td>${P_STORE_JOIN.companyAddress}</td>
                <th class="w150">公司详细地址：</th>
                <td colspan="3">${P_STORE_JOIN.companyAddressDetail!""}</td>
            </tr>
            <tr>
                <th class="w150">公司电话：</th>
                <td>${P_STORE_JOIN.companyPhone}</td>
                <th class="w150">员工总数：</th>
                <td>${P_STORE_JOIN.companyEmployeeCount}&nbsp;人</td>
                <th class="w150">注册资金：</th>
                <td>${P_STORE_JOIN.companyRegisteredCapital}&nbsp;万元</td>
            </tr>
            <tr>
                <th class="w150">联系人姓名：</th>
                <td>${P_STORE_JOIN.contactsName}</td>
                <th class="w150">联系人电话：</th>
                <td>${P_STORE_JOIN.contactsPhone}</td>
                <th class="w150">电子邮箱：</th>
                <td>${P_STORE_JOIN.contactsEmail}</td>
            </tr>
            </tbody>
        </table>
        <table cellspacing="0" cellpadding="0" border="0" class="store-joinin">
            <thead>
            <tr>
                <th colspan="2">营业执照信息（副本）</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <th class="w150">营业执照号：</th>
                <td>${P_STORE_JOIN.businessLicenceNumber}</td>
            </tr>
            <tr>

                <th class="w150">营业执照所在地：</th>
                <td>${P_STORE_JOIN.businessLicenceAddress}</td>
            </tr>
            <tr>

                <th class="w150">营业执照有效期：</th>
                <td>${(P_STORE_JOIN.businessLicenceStart?string("yyyy-MM-dd"))!} - ${(P_STORE_JOIN.businessLicenceEnd?string("yyyy-MM-dd"))!}</td>
            </tr>
            <tr>
                <th class="w150">法定经营范围：</th>
                <td colspan="20">${P_STORE_JOIN.businessSphere}</td>
            </tr>
            <tr>
                <th class="w150">营业执照号<br>
                    电子版：
                </th>
                <td colspan="20"><a href="${S_URL}/att.html?path=${P_STORE_JOIN.businessLicenceNumberElectronic}"
                                    nctype="nyroModal"> <img alt=""
                                                             src="${S_URL}/att.html?path=${P_STORE_JOIN.businessLicenceNumberElectronic}">
                </a></td>
            </tr>
            </tbody>
        </table>
        <table cellspacing="0" cellpadding="0" border="0" class="store-joinin">
            <thead>
            <tr>
                <th colspan="2">组织机构代码证</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <th class="w150">组织机构代码：</th>
                <td>${P_STORE_JOIN.organizationCode}</td>
            </tr>
            <tr>
                <th class="w150">组织机构代码证<br> 电子版：</th>
                <td><a href="${S_URL}/att.html?path=${P_STORE_JOIN.organizationCodeElectronic}" nctype="nyroModal">
                    <img alt="" src="${S_URL}/att.html?path=${P_STORE_JOIN.organizationCodeElectronic}"> </a></td>
            </tr>
            </tbody>
        </table>
        <table cellspacing="0" cellpadding="0" border="0" class="store-joinin">
            <thead>
            <tr>
                <th colspan="2">一般纳税人证明：</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <th class="w150">一般纳税人证明：</th>
                <td><a href="${S_URL}/att.html?path=${P_STORE_JOIN.generalTaxpayer}" nctype="nyroModal">
                    <img alt="" src="${S_URL}/att.html?path=${P_STORE_JOIN.generalTaxpayer}"> </a></td>
            </tr>
            </tbody>
        </table>
        <table cellspacing="0" cellpadding="0" border="0" class="store-joinin">
            <thead>
            <tr>
                <th colspan="2">开户银行信息：</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <th class="w150">银行开户名：</th>
                <td>${P_STORE_JOIN.bankAccountName}</td>
            </tr>
            <tr>
                <th class="w150">公司银行账号：</th>
                <td>${P_STORE_JOIN.bankAccountNumber}</td>
            </tr>
            <tr>
                <th class="w150">开户银行支行名称：</th>
                <td>${P_STORE_JOIN.bankName}</td>
            </tr>
            <tr>
                <th class="w150">支行联行号：</th>
                <td>${P_STORE_JOIN.bankCode}</td>
            </tr>
            <tr>
                <th class="w150">开户银行所在地：</th>
                <td colspan="20">${P_STORE_JOIN.bankAddress}</td>
            </tr>
            <tr>
                <th class="w150">开户银行许可证<br>电子版：</th>
                <td colspan="20"><a href="${S_URL}/att.html?path=${P_STORE_JOIN.bankLicenceElectronic}"
                                    nctype="nyroModal">
                    <img alt="" src="${S_URL}/att.html?path=${P_STORE_JOIN.bankLicenceElectronic}"> </a></td>
            </tr>
            </tbody>

        </table>
        <table cellspacing="0" cellpadding="0" border="0" class="store-joinin">
            <thead>
            <tr>
                <th colspan="2">结算账号信息：</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <th class="w150">银行开户名：</th>
                <td>${P_STORE_JOIN.settlementBankAccountName}</td>
            </tr>
            <tr>
                <th class="w150">公司银行账号：</th>
                <td>${P_STORE_JOIN.settlementBankAccountNumber}</td>
            </tr>
            <tr>
                <th class="w150">开户银行支行名称：</th>
                <td>${P_STORE_JOIN.settlementBankName}</td>
            </tr>
            <tr>
                <th class="w150">支行联行号：</th>
                <td>${P_STORE_JOIN.settlementBankCode}</td>
            </tr>
            <tr>
                <th class="w150">开户银行所在地：</th>
                <td>${P_STORE_JOIN.settlementBankAddress}</td>
            </tr>
            </tbody>

        </table>
        <table cellspacing="0" cellpadding="0" border="0" class="store-joinin">
            <thead>
            <tr>
                <th colspan="2">税务登记证</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <th class="w150">税务登记证号：</th>
                <td>${P_STORE_JOIN.taxRegistrationCertificate}</td>
            </tr>
            <tr>
                <th class="w150">纳税人识别号：</th>
                <td>${P_STORE_JOIN.taxpayerId}</td>
            </tr>
            <tr>
                <th class="w150">税务登记证号<br>
                    电子版：
                </th>
                <td><a href="${S_URL}/att.html?path=${P_STORE_JOIN.taxRegistrationCertificateElectronic}"
                       nctype="nyroModal">
                    <img alt="" src="${S_URL}/att.html?path=${P_STORE_JOIN.taxRegistrationCertificateElectronic}">
                </a></td>
            </tr>
            </tbody>
        </table>
        <form enctype="multipart/form-data" method="post" action="${S_URL}/store_join/pay_save.html"
              id="form_paying_money_certificate">
            <table cellspacing="0" cellpadding="0" border="0" class="store-joinin">
                <thead>
                <tr>
                    <th colspan="2">店铺经营信息</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <th class="w150">卖家帐号：</th>
                    <td>${P_STORE_JOIN.sellerName}</td>
                </tr>
                <tr>
                    <th class="w150">店铺名称：</th>
                    <td>${P_STORE_JOIN.storeName}</td>
                </tr>
                <tr>
                    <th class="w150">店铺等级：</th>
                    <td>${P_STORE_JOIN.sgName}</td>
                </tr>
                <tr>
                    <th class="w150">店铺分类：</th>
                    <td>${P_STORE_JOIN.scName}</td>
                </tr>
                <tr>
                    <th class="w150">经营类目：</th>
                    <td>
                        <table cellspacing="0" cellpadding="0" border="0" class="type" id="table_category">
                            <thead>
                            <tr>
                                <th>分类1</th>
                                <th>分类2</th>
                                <th>分类3</th>
                            </tr>
                            </thead>
                            <tbody>
                            <#list P_CLASS_LIST as CLASS>
                                <tr>
                                    <#list CLASS.jmcs as c>
                                        <td>${c.name}</td>
                                    </#list>
                                </tr>
                            </#list>

                            </tbody>
                        </table>
                    </td>
                </tr>
                <tr>
                    <th class="w150">审核意见：</th>
                    <td colspan="2">${P_STORE_JOIN.joininMessage}</td>
                </tr>
                </tbody>
            </table>
            <table cellspacing="0" cellpadding="0" border="0" class="store-joinin">
                <tbody>
                <tr>
                    <th class="w150">上传付款凭证：</th>
                    <td>
                        <input type="file" name="paying_money_certificate"><span></span>
                    </td>
                </tr>
                <tr>
                    <th class="w150">备注：</th>
                    <td>
                        <textarea cols="30" rows="10" name="paying_money_certificate_explain"></textarea>
                        <span></span>
                    </td>
                </tr>
                </tbody>
            </table>
        </form>
        <div class="bottom"><a class="btn" href="javascript:;" id="btn_paying_money_certificate">提交</a></div>
    </div>
</div>
<script type="text/javascript">
    $(document).ready(function () {

        $('#form_paying_money_certificate').validate({
            errorPlacement: function (error, element) {
                element.nextAll('span').first().after(error);
            },
            rules: {
                paying_money_certificate: {
                    required: true
                },
                paying_money_certificate_explain: {
                    maxlength: 100
                }
            },
            messages: {
                paying_money_certificate: {
                    required: '请选择上传付款凭证'
                },
                paying_money_certificate_explain: {
                    maxlength: jQuery.validator.format("最多{0}个字")
                }
            }
        });

        $('#btn_paying_money_certificate').on('click', function () {
            $('#form_paying_money_certificate').submit();
        });

    });
</script>
</body>

</html>
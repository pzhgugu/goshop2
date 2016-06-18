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
<script charset="utf-8" src="${S_COMMON_URL}/scripts/jquery.nyroModal/custom.min.js" type="text/javascript"></script>
<script charset="utf-8" src="${S_COMMON_URL}/scripts/jquery/jquery.poshytip.min.js" type="text/javascript"></script>
<link id="cssfile2" type="text/css" rel="stylesheet" href="${S_COMMON_URL}/scripts/jquery.nyroModal/styles/nyroModal.css">
<script type="text/javascript">
    $(document).ready(function(){
        $('a[nctype="nyroModal"]').nyroModal();

        $('#btn_fail').on('click', function() {
            if($('#join_message').val() == '') {
                $('#validation_message').text('请输入审核意见');
                $('#validation_message').show();
                return false;
            } else {
                $('#validation_message').hide();
            }
            if(confirm('确认拒绝申请？')) {
                $('#verify_type').val('fail');
                $('#form_store_verify').submit();
            }
        });
        $('#btn_pass').on('click', function() {
            var valid = true;
            $('[nctype="commis_rate"]').each(function(commis_rate) {
                rate = $(this).val();
                if(rate == '') {
                    valid = false;
                    return false;
                }

                var rate = Number($(this).val());
                if(isNaN(rate) || rate < 0 || rate >= 100) {
                    valid = false;
                    return false;
                }
            });
            if(valid) {
                $('#validation_message').hide();
                if(confirm('确认通过申请？')) {
                    $('#verify_type').val('pass');
                    $('#form_store_verify').submit();
                }
            } else {
                $('#validation_message').text('请正确填写分佣比例');
                $('#validation_message').show();
            }
        });
    });
</script>
<div class="page">
    <div class="fixed-bar">
        <div class="item-title">
            <h3>店铺</h3>
            <ul class="tab-base">
                <li><a href="${S_URL}/store/store"><span>管理</span></a></li>
                <li><a href="${S_URL}/store_join"><span>开店申请</span></a></li>
                <li><a class="current" href="JavaScript:void(0);"><span>审核</span></a></li>
            </ul>
        </div>
    </div>
    <div class="fixed-empty"></div>
    <table cellspacing="0" cellpadding="0" border="0" class="store-joinin">
        <thead>
        <tr>
            <th colspan="20">公司及联系人信息</th>
        </tr>
        </thead>
        <tbody>
        <tr style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
            <th class="w150">公司名称：</th>
            <td colspan="20">${P_STORE_JOIN.companyName}</td>
        </tr>
        <tr style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
            <th>公司所在地：</th>
            <td>${P_STORE_JOIN.companyAddress}</td>
            <th>公司详细地址：</th>
            <td colspan="20">${P_STORE_JOIN.companyAddressDetail!""}</td>
        </tr>
        <tr style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
            <th>公司电话：</th>
            <td>${P_STORE_JOIN.companyPhone}</td>
            <th>员工总数：</th>
            <td>${P_STORE_JOIN.companyEmployeeCount}&nbsp;人</td>
            <th>注册资金：</th>
            <td>${P_STORE_JOIN.companyRegisteredCapital}&nbsp;万元 </td>
        </tr>
        <tr style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
            <th>联系人姓名：</th>
            <td>${P_STORE_JOIN.contactsName}</td>
            <th>联系人电话：</th>
            <td>${P_STORE_JOIN.contactsPhone}</td>
            <th>电子邮箱：</th>
            <td>${P_STORE_JOIN.contactsEmail}</td>
        </tr>
        </tbody>
    </table>
    <table cellspacing="0" cellpadding="0" border="0" class="store-joinin">
        <thead>
        <tr>
            <th colspan="20">营业执照信息（副本）</th>
        </tr>
        </thead>
        <tbody>
        <tr style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
            <th class="w150">营业执照号：</th>
            <td>${P_STORE_JOIN.businessLicenceNumber}</td></tr><tr>

            <th>营业执照所在地：</th>
            <td>${P_STORE_JOIN.businessLicenceAddress}</td></tr><tr>

            <th>营业执照有效期：</th>
            <td>${(P_STORE_JOIN.businessLicenceStart?string("yyyy-MM-dd"))!} - ${(P_STORE_JOIN.businessLicenceEnd?string("yyyy-MM-dd"))!}</td>
        </tr>
        <tr>
            <th>法定经营范围：</th>
            <td colspan="20">${P_STORE_JOIN.businessSphere}</td>
        </tr>
        <tr>
            <th>营业执照号<br>
                电子版：</th>
            <td colspan="20">
                <a href="${S_URL}/att?path=${P_STORE_JOIN.businessLicenceNumberElectronic}" nctype="nyroModal">
                    <img alt="" src="${S_URL}/att?path=${P_STORE_JOIN.businessLicenceNumberElectronic}">
                </a></td>
        </tr>
        </tbody>
    </table>
    <table cellspacing="0" cellpadding="0" border="0" class="store-joinin">
        <thead>
        <tr>
            <th colspan="20">组织机构代码证</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <th>组织机构代码：</th>
            <td colspan="20">${P_STORE_JOIN.organizationCode}</td>
        </tr>
        <tr>
            <th>组织机构代码证<br>          电子版：</th>
            <td colspan="20">
                <a href="${S_URL}/att?path=${P_STORE_JOIN.organizationCodeElectronic}" nctype="nyroModal">
                    <img alt="" src="${S_URL}/att?path=${P_STORE_JOIN.organizationCodeElectronic}">
                </a></td>
        </tr>
        </tbody>
    </table>
    <table cellspacing="0" cellpadding="0" border="0" class="store-joinin">
        <thead>
        <tr>
            <th colspan="20">一般纳税人证明：</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <th>一般纳税人证明：</th>
            <td colspan="20">
                <a href="${S_URL}/att?path=${P_STORE_JOIN.generalTaxpayer}" nctype="nyroModal">
                    <img alt="" src="${S_URL}/att?path=${P_STORE_JOIN.generalTaxpayer}">
                </a></td>
        </tr>
        </tbody>
    </table>
    <table cellspacing="0" cellpadding="0" border="0" class="store-joinin">
        <thead>
        <tr>
            <th colspan="20">开户银行信息：</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <th class="w150">银行开户名：</th>
            <td>${P_STORE_JOIN.bankAccountName}</td>
        </tr><tr>
            <th>公司银行账号：</th>
            <td>${P_STORE_JOIN.bankAccountNumber}</td></tr>
        <tr>
            <th>开户银行支行名称：</th>
            <td>${P_STORE_JOIN.bankName}</td>
        </tr>
        <tr>
            <th>支行联行号：</th>
            <td>${P_STORE_JOIN.bankCode}</td>
        </tr><tr>
            <th>开户银行所在地：</th>
            <td colspan="20">${P_STORE_JOIN.bankAddress}</td>
        </tr>
        <tr>
            <th>开户银行许可证<br>电子版：</th>
            <td colspan="20">
                <a href="${S_URL}/att?path=${P_STORE_JOIN.bankLicenceElectronic}" nctype="nyroModal">
                    <img alt="" src="${S_URL}/att?path=${P_STORE_JOIN.bankLicenceElectronic}">
                </a></td>
        </tr>
        </tbody>

    </table>
    <table cellspacing="0" cellpadding="0" border="0" class="store-joinin">
        <thead>
        <tr>
            <th colspan="20">结算账号信息：</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <th class="w150">银行开户名：</th>
            <td>${P_STORE_JOIN.settlementBankAccountName}</td>
        </tr>
        <tr>
            <th>公司银行账号：</th>
            <td>${P_STORE_JOIN.settlementBankAccountNumber}</td>
        </tr>
        <tr>
            <th>开户银行支行名称：</th>
            <td>${P_STORE_JOIN.settlementBankName}</td>
        </tr>
        <tr>
            <th>支行联行号：</th>
            <td>${P_STORE_JOIN.settlementBankCode}</td>
        </tr>
        <tr>
            <th>开户银行所在地：</th>
            <td>${P_STORE_JOIN.settlementBankAddress}</td>
        </tr>
        </tbody>

    </table>
    <table cellspacing="0" cellpadding="0" border="0" class="store-joinin">
        <thead>
        <tr>
            <th colspan="20">税务登记证</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <th class="w150">税务登记证号：</th>
            <td>${P_STORE_JOIN.taxRegistrationCertificate}</td>
        </tr>
        <tr>
            <th>纳税人识别号：</th>
            <td>${P_STORE_JOIN.taxpayerId}</td>
        </tr>
        <tr>
            <th>税务登记证号<br>
                电子版：</th>
            <td>
                <a href="${S_URL}/att?path=${P_STORE_JOIN.taxRegistrationCertificateElectronic}" nctype="nyroModal">
                    <img alt="" src="${S_URL}/att?path=${P_STORE_JOIN.taxRegistrationCertificateElectronic}">
                </a></td>
        </tr>
        </tbody>
    </table>
    <form method="post" action="verify" id="form_store_verify">
        <input type="hidden" name="verify_type" id="verify_type">
        <input type="hidden" value="${P_STORE_JOIN.memberId}" name="member_id">
        <table cellspacing="0" cellpadding="0" border="0" class="store-joinin">
            <thead>
            <tr>
                <th colspan="20">店铺经营信息</th>
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
                <th>店铺等级：</th>
                <td>${P_STORE_JOIN.sgName}</td>
            </tr>
            <tr>
                <th>店铺分类：</th>
                <td>&nbsp;&nbsp;${P_STORE_JOIN.scName}</td>
            </tr>
            <tr>
                <th>经营类目：</th>
                <td colspan="2"><table cellspacing="0" cellpadding="0" border="0" class="type" id="table_category">
                    <thead>
                    <tr>
                        <th>分类1</th>
                        <th>分类2</th>
                        <th>分类3</th>
                        <th>比例</th>
                    </tr>
                    </thead>
                    <tbody>
                    <#list P_CLASS_LIST as classList >
                    <tr>
                        <#list classList.jmcs as c >
                            <td>${c.name}</td>
                        </#list>
                        <td>
                        <#if P_STORE_JOIN.joininState=='10'>
                            <input type="text" class="w100" name="commis_rate" value="" nctype="commis_rate">%
                        </#if>
                        </td>
                    </tr>
                    </#list>
                    </tbody>
                </table></td>
            </tr>
<#if P_STORE_JOIN.joininState=='11'||P_STORE_JOIN.joininState=='31'||P_STORE_JOIN.joininState=='40'>
<tr style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
    <th>付款凭证：</th>
    <td><a href="${S_URL}/att?path=${P_STORE_JOIN.payingMoneyCertificate}" nctype="nyroModal">
        <img alt="" src="${S_URL}/att?path=${P_STORE_JOIN.payingMoneyCertificate}"> </a></td>
</tr>
<tr style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
    <th>付款凭证说明：</th>
    <td>${P_STORE_JOIN.payingMoneyCertificateExplain}</td>
</tr>
</#if>
            <tr>
                <th>审核意见：</th>
                <td colspan="2"><textarea name="join_message" id="join_message">${P_STORE_JOIN.joininMessage}</textarea></td>
            </tr>
            </tbody>
        </table>
        <div style="color:red;display:none;" id="validation_message"></div>
<#if P_STORE_JOIN.joininState!='40'>
        <div><a href="JavaScript:void(0);" class="btn" id="btn_fail"><span>拒绝</span></a> <a href="JavaScript:void(0);" class="btn" id="btn_pass"><span>通过</span></a></div>
</#if>
    </form>
</div>

<div></div></body>
</html>
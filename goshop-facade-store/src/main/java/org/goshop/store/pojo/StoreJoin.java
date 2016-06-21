package org.goshop.store.pojo;

import java.io.Serializable;
import java.util.Date;

public class StoreJoin  implements Serializable {
    private Long memberId;

    private String memberName;

    private String companyName;

    private String companyAddress;

    private String companyAddressDetail;

    private String companyPhone;

    private Integer companyEmployeeCount;

    private Integer companyRegisteredCapital;

    private String contactsName;

    private String contactsPhone;

    private String contactsEmail;

    private String businessLicenceNumber;

    private String businessLicenceAddress;

    private Date businessLicenceStart;

    private Date businessLicenceEnd;

    private String businessSphere;

    private String businessLicenceNumberElectronic;

    private String organizationCode;

    private String organizationCodeElectronic;

    private String generalTaxpayer;

    private String bankAccountName;

    private String bankAccountNumber;

    private String bankName;

    private String bankCode;

    private String bankAddress;

    private String bankLicenceElectronic;

    private Boolean isSettlementAccount;

    private String settlementBankAccountName;

    private String settlementBankAccountNumber;

    private String settlementBankName;

    private String settlementBankCode;

    private String settlementBankAddress;

    private String taxRegistrationCertificate;

    private String taxpayerId;

    private String taxRegistrationCertificateElectronic;

    private String sellerName;

    private String storeName;

    private String storeClassIds;

    private String storeClassNames;

    private String joininState;

    private String joininMessage;

    private String sgName;

    private Integer sgId;

    private String scName;

    private Integer scId;

    private String storeClassCommisRates;

    private String payingMoneyCertificate;

    private String payingMoneyCertificateExplain;

    public Long getMemberId() {
        return memberId;
    }

    public void setMemberId(Long memberId) {
        this.memberId = memberId;
    }

    public String getMemberName() {
        return memberName;
    }

    public void setMemberName(String memberName) {
        this.memberName = memberName == null ? null : memberName.trim();
    }

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName == null ? null : companyName.trim();
    }

    public String getCompanyAddress() {
        return companyAddress;
    }

    public void setCompanyAddress(String companyAddress) {
        this.companyAddress = companyAddress == null ? null : companyAddress.trim();
    }

    public String getCompanyAddressDetail() {
        return companyAddressDetail;
    }

    public void setCompanyAddressDetail(String companyAddressDetail) {
        this.companyAddressDetail = companyAddressDetail == null ? null : companyAddressDetail.trim();
    }

    public String getCompanyPhone() {
        return companyPhone;
    }

    public void setCompanyPhone(String companyPhone) {
        this.companyPhone = companyPhone == null ? null : companyPhone.trim();
    }

    public Integer getCompanyEmployeeCount() {
        return companyEmployeeCount;
    }

    public void setCompanyEmployeeCount(Integer companyEmployeeCount) {
        this.companyEmployeeCount = companyEmployeeCount;
    }

    public Integer getCompanyRegisteredCapital() {
        return companyRegisteredCapital;
    }

    public void setCompanyRegisteredCapital(Integer companyRegisteredCapital) {
        this.companyRegisteredCapital = companyRegisteredCapital;
    }

    public String getContactsName() {
        return contactsName;
    }

    public void setContactsName(String contactsName) {
        this.contactsName = contactsName == null ? null : contactsName.trim();
    }

    public String getContactsPhone() {
        return contactsPhone;
    }

    public void setContactsPhone(String contactsPhone) {
        this.contactsPhone = contactsPhone == null ? null : contactsPhone.trim();
    }

    public String getContactsEmail() {
        return contactsEmail;
    }

    public void setContactsEmail(String contactsEmail) {
        this.contactsEmail = contactsEmail == null ? null : contactsEmail.trim();
    }

    public String getBusinessLicenceNumber() {
        return businessLicenceNumber;
    }

    public void setBusinessLicenceNumber(String businessLicenceNumber) {
        this.businessLicenceNumber = businessLicenceNumber == null ? null : businessLicenceNumber.trim();
    }

    public String getBusinessLicenceAddress() {
        return businessLicenceAddress;
    }

    public void setBusinessLicenceAddress(String businessLicenceAddress) {
        this.businessLicenceAddress = businessLicenceAddress == null ? null : businessLicenceAddress.trim();
    }

    public Date getBusinessLicenceStart() {
        return businessLicenceStart;
    }

    public void setBusinessLicenceStart(Date businessLicenceStart) {
        this.businessLicenceStart = businessLicenceStart;
    }

    public Date getBusinessLicenceEnd() {
        return businessLicenceEnd;
    }

    public void setBusinessLicenceEnd(Date businessLicenceEnd) {
        this.businessLicenceEnd = businessLicenceEnd;
    }

    public String getBusinessSphere() {
        return businessSphere;
    }

    public void setBusinessSphere(String businessSphere) {
        this.businessSphere = businessSphere == null ? null : businessSphere.trim();
    }

    public String getBusinessLicenceNumberElectronic() {
        return businessLicenceNumberElectronic;
    }

    public void setBusinessLicenceNumberElectronic(String businessLicenceNumberElectronic) {
        this.businessLicenceNumberElectronic = businessLicenceNumberElectronic == null ? null : businessLicenceNumberElectronic.trim();
    }

    public String getOrganizationCode() {
        return organizationCode;
    }

    public void setOrganizationCode(String organizationCode) {
        this.organizationCode = organizationCode == null ? null : organizationCode.trim();
    }

    public String getOrganizationCodeElectronic() {
        return organizationCodeElectronic;
    }

    public void setOrganizationCodeElectronic(String organizationCodeElectronic) {
        this.organizationCodeElectronic = organizationCodeElectronic == null ? null : organizationCodeElectronic.trim();
    }

    public String getGeneralTaxpayer() {
        return generalTaxpayer;
    }

    public void setGeneralTaxpayer(String generalTaxpayer) {
        this.generalTaxpayer = generalTaxpayer == null ? null : generalTaxpayer.trim();
    }

    public String getBankAccountName() {
        return bankAccountName;
    }

    public void setBankAccountName(String bankAccountName) {
        this.bankAccountName = bankAccountName == null ? null : bankAccountName.trim();
    }

    public String getBankAccountNumber() {
        return bankAccountNumber;
    }

    public void setBankAccountNumber(String bankAccountNumber) {
        this.bankAccountNumber = bankAccountNumber == null ? null : bankAccountNumber.trim();
    }

    public String getBankName() {
        return bankName;
    }

    public void setBankName(String bankName) {
        this.bankName = bankName == null ? null : bankName.trim();
    }

    public String getBankCode() {
        return bankCode;
    }

    public void setBankCode(String bankCode) {
        this.bankCode = bankCode == null ? null : bankCode.trim();
    }

    public String getBankAddress() {
        return bankAddress;
    }

    public void setBankAddress(String bankAddress) {
        this.bankAddress = bankAddress == null ? null : bankAddress.trim();
    }

    public String getBankLicenceElectronic() {
        return bankLicenceElectronic;
    }

    public void setBankLicenceElectronic(String bankLicenceElectronic) {
        this.bankLicenceElectronic = bankLicenceElectronic == null ? null : bankLicenceElectronic.trim();
    }

    public Boolean getIsSettlementAccount() {
        return isSettlementAccount;
    }

    public void setIsSettlementAccount(Boolean isSettlementAccount) {
        this.isSettlementAccount = isSettlementAccount;
    }

    public String getSettlementBankAccountName() {
        return settlementBankAccountName;
    }

    public void setSettlementBankAccountName(String settlementBankAccountName) {
        this.settlementBankAccountName = settlementBankAccountName == null ? null : settlementBankAccountName.trim();
    }

    public String getSettlementBankAccountNumber() {
        return settlementBankAccountNumber;
    }

    public void setSettlementBankAccountNumber(String settlementBankAccountNumber) {
        this.settlementBankAccountNumber = settlementBankAccountNumber == null ? null : settlementBankAccountNumber.trim();
    }

    public String getSettlementBankName() {
        return settlementBankName;
    }

    public void setSettlementBankName(String settlementBankName) {
        this.settlementBankName = settlementBankName == null ? null : settlementBankName.trim();
    }

    public String getSettlementBankCode() {
        return settlementBankCode;
    }

    public void setSettlementBankCode(String settlementBankCode) {
        this.settlementBankCode = settlementBankCode == null ? null : settlementBankCode.trim();
    }

    public String getSettlementBankAddress() {
        return settlementBankAddress;
    }

    public void setSettlementBankAddress(String settlementBankAddress) {
        this.settlementBankAddress = settlementBankAddress == null ? null : settlementBankAddress.trim();
    }

    public String getTaxRegistrationCertificate() {
        return taxRegistrationCertificate;
    }

    public void setTaxRegistrationCertificate(String taxRegistrationCertificate) {
        this.taxRegistrationCertificate = taxRegistrationCertificate == null ? null : taxRegistrationCertificate.trim();
    }

    public String getTaxpayerId() {
        return taxpayerId;
    }

    public void setTaxpayerId(String taxpayerId) {
        this.taxpayerId = taxpayerId == null ? null : taxpayerId.trim();
    }

    public String getTaxRegistrationCertificateElectronic() {
        return taxRegistrationCertificateElectronic;
    }

    public void setTaxRegistrationCertificateElectronic(String taxRegistrationCertificateElectronic) {
        this.taxRegistrationCertificateElectronic = taxRegistrationCertificateElectronic == null ? null : taxRegistrationCertificateElectronic.trim();
    }

    public String getSellerName() {
        return sellerName;
    }

    public void setSellerName(String sellerName) {
        this.sellerName = sellerName == null ? null : sellerName.trim();
    }

    public String getStoreName() {
        return storeName;
    }

    public void setStoreName(String storeName) {
        this.storeName = storeName == null ? null : storeName.trim();
    }

    public String getStoreClassIds() {
        return storeClassIds;
    }

    public void setStoreClassIds(String storeClassIds) {
        this.storeClassIds = storeClassIds == null ? null : storeClassIds.trim();
    }

    public String getStoreClassNames() {
        return storeClassNames;
    }

    public void setStoreClassNames(String storeClassNames) {
        this.storeClassNames = storeClassNames == null ? null : storeClassNames.trim();
    }

    public String getJoininState() {
        return joininState;
    }

    public void setJoininState(String joininState) {
        this.joininState = joininState == null ? null : joininState.trim();
    }

    public String getJoininMessage() {
        return joininMessage;
    }

    public void setJoininMessage(String joininMessage) {
        this.joininMessage = joininMessage == null ? null : joininMessage.trim();
    }

    public String getSgName() {
        return sgName;
    }

    public void setSgName(String sgName) {
        this.sgName = sgName == null ? null : sgName.trim();
    }

    public Integer getSgId() {
        return sgId;
    }

    public void setSgId(Integer sgId) {
        this.sgId = sgId;
    }

    public String getScName() {
        return scName;
    }

    public void setScName(String scName) {
        this.scName = scName == null ? null : scName.trim();
    }

    public Integer getScId() {
        return scId;
    }

    public void setScId(Integer scId) {
        this.scId = scId;
    }

    public String getStoreClassCommisRates() {
        return storeClassCommisRates;
    }

    public void setStoreClassCommisRates(String storeClassCommisRates) {
        this.storeClassCommisRates = storeClassCommisRates == null ? null : storeClassCommisRates.trim();
    }

    public String getPayingMoneyCertificate() {
        return payingMoneyCertificate;
    }

    public void setPayingMoneyCertificate(String payingMoneyCertificate) {
        this.payingMoneyCertificate = payingMoneyCertificate == null ? null : payingMoneyCertificate.trim();
    }

    public String getPayingMoneyCertificateExplain() {
        return payingMoneyCertificateExplain;
    }

    public void setPayingMoneyCertificateExplain(String payingMoneyCertificateExplain) {
        this.payingMoneyCertificateExplain = payingMoneyCertificateExplain == null ? null : payingMoneyCertificateExplain.trim();
    }
}
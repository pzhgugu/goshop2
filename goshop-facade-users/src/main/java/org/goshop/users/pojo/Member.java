package org.goshop.users.pojo;

import java.io.Serializable;
import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.Date;

public class Member implements Serializable {
    private Long memberId;

    private Long userId;

    private String memberTruename;

    private String memberAvatar;

    private Integer memberSex;

    private Date memberBirthday;

    private String memberEmail;

    private String memberQq;

    private String memberWw;

    private Timestamp memberTime;

    private String memberQqopenid;

    private Integer memberPoints;

    private BigDecimal availablePredeposit;

    private BigDecimal freezePredeposit;

    private Integer informAllow;

    private Integer isBuy;

    private Integer isAllowtalk;

    private Integer memberState;

    private Integer memberCredit;

    private Integer memberAreaid;

    private Integer memberCityid;

    private Integer memberProvinceid;

    private String memberAreainfo;

    private String memberQqinfo;

    /**
     * 隐私设定
     */
    private String memberPrivacy;
    //虚拟user字段
    private String userName;
    //虚拟user字段
    private String loginName;
    //虚拟user字段
    private Integer loginNum;
    //虚拟user字段
    private Timestamp loginTime;
    //虚拟user字段
    private String loginIp;
    //虚拟是否为管理员字段
    private Integer isAdmin;

    public Integer getIsAdmin() {
        return isAdmin;
    }

    public void setIsAdmin(Integer isAdmin) {
        this.isAdmin = isAdmin;
    }

    public String getMemberPrivacy() {
        return memberPrivacy;
    }

    public void setMemberPrivacy(String memberPrivacy) {
        this.memberPrivacy = memberPrivacy;
    }

    public Integer getLoginNum() {
        return loginNum;
    }

    public void setLoginNum(Integer loginNum) {
        this.loginNum = loginNum;
    }

    public Timestamp getLoginTime() {
        return loginTime;
    }

    public void setLoginTime(Timestamp loginTime) {
        this.loginTime = loginTime;
    }

    public String getLoginIp() {
        return loginIp;
    }

    public void setLoginIp(String loginIp) {
        this.loginIp = loginIp;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getLoginName() {
        return loginName;
    }

    public void setLoginName(String loginName) {
        this.loginName = loginName;
    }

    public Long getMemberId() {
        return memberId;
    }

    public void setMemberId(Long memberId) {
        this.memberId = memberId;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public String getMemberTruename() {
        return memberTruename;
    }

    public void setMemberTruename(String memberTruename) {
        this.memberTruename = memberTruename == null ? null : memberTruename.trim();
    }

    public String getMemberAvatar() {
        return memberAvatar;
    }

    public void setMemberAvatar(String memberAvatar) {
        this.memberAvatar = memberAvatar == null ? null : memberAvatar.trim();
    }

    public Integer getMemberSex() {
        return memberSex;
    }

    public void setMemberSex(Integer memberSex) {
        this.memberSex = memberSex;
    }

    public Date getMemberBirthday() {
        return memberBirthday;
    }

    public void setMemberBirthday(Date memberBirthday) {
        this.memberBirthday = memberBirthday;
    }

    public String getMemberEmail() {
        return memberEmail;
    }

    public void setMemberEmail(String memberEmail) {
        this.memberEmail = memberEmail == null ? null : memberEmail.trim();
    }

    public String getMemberQq() {
        return memberQq;
    }

    public void setMemberQq(String memberQq) {
        this.memberQq = memberQq == null ? null : memberQq.trim();
    }

    public String getMemberWw() {
        return memberWw;
    }

    public void setMemberWw(String memberWw) {
        this.memberWw = memberWw == null ? null : memberWw.trim();
    }

    public Timestamp getMemberTime() {
        return memberTime;
    }

    public void setMemberTime(Timestamp memberTime) {
        this.memberTime = memberTime;
    }

    public String getMemberQqopenid() {
        return memberQqopenid;
    }

    public void setMemberQqopenid(String memberQqopenid) {
        this.memberQqopenid = memberQqopenid == null ? null : memberQqopenid.trim();
    }

    public Integer getMemberPoints() {
        return memberPoints;
    }

    public void setMemberPoints(Integer memberPoints) {
        this.memberPoints = memberPoints;
    }

    public BigDecimal getAvailablePredeposit() {
        return availablePredeposit;
    }

    public void setAvailablePredeposit(BigDecimal availablePredeposit) {
        this.availablePredeposit = availablePredeposit;
    }

    public BigDecimal getFreezePredeposit() {
        return freezePredeposit;
    }

    public void setFreezePredeposit(BigDecimal freezePredeposit) {
        this.freezePredeposit = freezePredeposit;
    }

    public Integer getInformAllow() {
        return informAllow;
    }

    public void setInformAllow(Integer informAllow) {
        this.informAllow = informAllow;
    }

    public Integer getIsBuy() {
        return isBuy;
    }

    public void setIsBuy(Integer isBuy) {
        this.isBuy = isBuy;
    }

    public Integer getIsAllowtalk() {
        return isAllowtalk;
    }

    public void setIsAllowtalk(Integer isAllowtalk) {
        this.isAllowtalk = isAllowtalk;
    }

    public Integer getMemberState() {
        return memberState;
    }

    public void setMemberState(Integer memberState) {
        this.memberState = memberState;
    }

    public Integer getMemberCredit() {
        return memberCredit;
    }

    public void setMemberCredit(Integer memberCredit) {
        this.memberCredit = memberCredit;
    }

    public Integer getMemberAreaid() {
        return memberAreaid;
    }

    public void setMemberAreaid(Integer memberAreaid) {
        this.memberAreaid = memberAreaid;
    }

    public Integer getMemberCityid() {
        return memberCityid;
    }

    public void setMemberCityid(Integer memberCityid) {
        this.memberCityid = memberCityid;
    }

    public Integer getMemberProvinceid() {
        return memberProvinceid;
    }

    public void setMemberProvinceid(Integer memberProvinceid) {
        this.memberProvinceid = memberProvinceid;
    }

    public String getMemberAreainfo() {
        return memberAreainfo;
    }

    public void setMemberAreainfo(String memberAreainfo) {
        this.memberAreainfo = memberAreainfo == null ? null : memberAreainfo.trim();
    }

    public String getMemberQqinfo() {
        return memberQqinfo;
    }

    public void setMemberQqinfo(String memberQqinfo) {
        this.memberQqinfo = memberQqinfo == null ? null : memberQqinfo.trim();
    }
}
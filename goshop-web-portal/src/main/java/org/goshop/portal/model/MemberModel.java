package org.goshop.portal.model;

import java.util.Date;

/**
 * Created by Administrator on 2016/2/23.
 */
public class MemberModel {

    /**
     * 真实姓名
     */
    private String memberTruename;
    /**
     * 会员性别
     */
    private Integer memberSex;
    /**
     * 生日
     */
    private Date memberBirthday;
    /**
     * QQ     *
     */
    private String memberQq;
    /**
     * 阿里旺旺
     */
    private String memberWw;
    /**
     * 地区ID
     */
    private Integer memberAreaid;
    /**
     * 城市ID
     */
    private Integer memberCityid;
    /**
     * 省份ID
     */
    private Integer memberProvinceid;
    /**
     * 地区内容
     */
    private String memberAreainfo;
    /**
     *  隐私设置
     */
    private PrivacyModel privacyModel;

    public String getMemberTruename() {
        return memberTruename;
    }

    public void setMemberTruename(String memberTruename) {
        this.memberTruename = memberTruename;
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

    public String getMemberQq() {
        return memberQq;
    }

    public void setMemberQq(String memberQq) {
        this.memberQq = memberQq;
    }

    public String getMemberWw() {
        return memberWw;
    }

    public void setMemberWw(String memberWw) {
        this.memberWw = memberWw;
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
        this.memberAreainfo = memberAreainfo;
    }

    public PrivacyModel getPrivacyModel() {
        return privacyModel;
    }

    public void setPrivacyModel(PrivacyModel privacyModel) {
        this.privacyModel = privacyModel;
    }
}

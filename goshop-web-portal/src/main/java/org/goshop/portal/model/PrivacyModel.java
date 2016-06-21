package org.goshop.portal.model;

/**
 *  隐私设置
 */
public class PrivacyModel {

    /**
     * 0=公开 1=好友可见 2=保密
     */

    private Integer email;

    private Integer truename;

    private Integer sex;

    private Integer birthday;

    private Integer area;

    private Integer qq;

    private Integer ww;

    public Integer getEmail() {
        return email;
    }

    public void setEmail(Integer email) {
        this.email = email;
    }

    public Integer getTruename() {
        return truename;
    }

    public void setTruename(Integer truename) {
        this.truename = truename;
    }

    public Integer getSex() {
        return sex;
    }

    public void setSex(Integer sex) {
        this.sex = sex;
    }

    public Integer getBirthday() {
        return birthday;
    }

    public void setBirthday(Integer birthday) {
        this.birthday = birthday;
    }

    public Integer getArea() {
        return area;
    }

    public void setArea(Integer area) {
        this.area = area;
    }

    public Integer getQq() {
        return qq;
    }

    public void setQq(Integer qq) {
        this.qq = qq;
    }

    public Integer getWw() {
        return ww;
    }

    public void setWw(Integer ww) {
        this.ww = ww;
    }
}

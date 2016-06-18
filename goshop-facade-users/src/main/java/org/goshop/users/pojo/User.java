package org.goshop.users.pojo;

import java.io.Serializable;
import java.security.Principal;
import java.sql.Timestamp;
import java.util.List;

public class User implements Principal, Serializable {
    private Long id;

    private String userName;

    private String loginName;

    private String password;

    private String salt;
    /**
     * 是否停用，1：正常，2：关闭
     */
    private Integer enable;
    /**
     * 用户类型(1:注册用户，2：管理员添加)
     */
    private Integer type;

    private Timestamp created;

    private Timestamp upcreated;

    private List<Role> roleList;

    private Integer loginNum;

    private Timestamp loginTime;

    private Timestamp oldLoginTime;

    private String loginIp;

    private String oldLoginIp;

    public Integer getLoginNum() {
        return loginNum;
    }

    public void setLoginNum(Integer loginNum) {
        this.loginNum = loginNum;
    }

    public Timestamp getLoginTime() {
        if(loginTime==null){
            return null;
        }
        return (Timestamp)loginTime.clone();
    }

    public void setLoginTime(Timestamp loginTime) {
        if(loginTime==null){
            this.loginTime=null;
        }else{
            this.loginTime = (Timestamp)loginTime.clone();
        }
    }

    public Timestamp getOldLoginTime() {
        if(oldLoginTime==null){
            return null;
        }
        return (Timestamp)oldLoginTime.clone();
    }

    public void setOldLoginTime(Timestamp oldLoginTime) {
        if(oldLoginTime==null){
            this.oldLoginTime=null;
        }else{
            this.oldLoginTime = (Timestamp)oldLoginTime.clone();
        }
    }

    public String getLoginIp() {
        return loginIp;
    }

    public void setLoginIp(String loginIp) {
        this.loginIp = loginIp;
    }

    public String getOldLoginIp() {
        return oldLoginIp;
    }

    public void setOldLoginIp(String oldLoginIp) {
        this.oldLoginIp = oldLoginIp;
    }

    public List<Role> getRoleList() {
        return roleList;
    }

    public void setRoleList(List<Role> roleList) {
        this.roleList = roleList;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName == null ? null : userName.trim();
    }

    public String getLoginName() {
        return loginName;
    }

    public void setLoginName(String loginName) {
        this.loginName = loginName == null ? null : loginName.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public String getSalt() {
        return salt;
    }

    public void setSalt(String salt) {
        this.salt = salt == null ? null : salt.trim();
    }

    public Integer getEnable() {
        return enable;
    }

    public void setEnable(Integer enable) {
        this.enable = enable;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public Timestamp getCreated() {
        if(created==null){
            return null;
        }
        return (Timestamp)created.clone();
    }

    public void setCreated(Timestamp created) {
        if(created==null){
            this.created=null;
        }else{
            this.created = (Timestamp)created.clone();
        }
    }

    public Timestamp getUpcreated() {
        if(upcreated==null){
            return null;
        }
        return (Timestamp)upcreated.clone();
    }

    public void setUpcreated(Timestamp upcreated) {
        if(upcreated==null){
            this.upcreated=null;
        }else{
            this.upcreated = (Timestamp)upcreated.clone();
        }
    }

    @Override
    public String getName() {
        return loginName;
    }
}
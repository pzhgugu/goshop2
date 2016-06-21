package org.goshop.users.pojo;


import java.io.Serializable;
import java.sql.Timestamp;

public class FindPassword implements Serializable {
    private String loginName;

    private Timestamp created;

    private String random;

    public String getLoginName() {
        return loginName;
    }

    public void setLoginName(String loginName) {
        this.loginName = loginName == null ? null : loginName.trim();
    }

    public Timestamp getCreated() {
        return created;
    }

    public void setCreated(Timestamp created) {
        this.created = created;
    }

    public String getRandom() {
        return random;
    }

    public void setRandom(String random) {
        this.random = random == null ? null : random.trim();
    }
}
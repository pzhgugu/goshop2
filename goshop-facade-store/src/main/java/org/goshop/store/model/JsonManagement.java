package org.goshop.store.model;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Administrator on 2015/11/6.
 */
public class JsonManagement {

    private List<JsonManagementClass> jmcs = new ArrayList<>();

    public List<JsonManagementClass> getJmcs() {
        return jmcs;
    }

    public void setJmcs(List<JsonManagementClass> jmcs) {
        this.jmcs = jmcs;
    }
}

package org.goshop.store.pojo;

import java.io.Serializable;

public class StoreGoodsClass implements Serializable {
    private Integer stcId;

    private String stcName;

    private Integer stcParentId;

    private Boolean stcState;

    private Integer storeId;

    private Integer stcSort;

    public Integer getStcId() {
        return stcId;
    }

    public void setStcId(Integer stcId) {
        this.stcId = stcId;
    }

    public String getStcName() {
        return stcName;
    }

    public void setStcName(String stcName) {
        this.stcName = stcName == null ? null : stcName.trim();
    }

    public Integer getStcParentId() {
        return stcParentId;
    }

    public void setStcParentId(Integer stcParentId) {
        this.stcParentId = stcParentId;
    }

    public Boolean getStcState() {
        return stcState;
    }

    public void setStcState(Boolean stcState) {
        this.stcState = stcState;
    }

    public Integer getStoreId() {
        return storeId;
    }

    public void setStoreId(Integer storeId) {
        this.storeId = storeId;
    }

    public Integer getStcSort() {
        return stcSort;
    }

    public void setStcSort(Integer stcSort) {
        this.stcSort = stcSort;
    }
}
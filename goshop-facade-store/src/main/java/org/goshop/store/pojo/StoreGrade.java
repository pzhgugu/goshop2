package org.goshop.store.pojo;

import java.io.Serializable;

public class StoreGrade implements Serializable {
    private Integer sgId;
    /**
     * 等级名称
     */
    private String sgName;
    /**
     * 可发布商品数量
     */
    private Integer sgGoodsLimit;
    /**
     * 可上传图片数量
     */
    private Integer sgAlbumLimit;

    private Integer sgSpaceLimit;

    private Integer sgTemplateNumber;

    private String sgTemplate;
    /**
     * 收费标准
     */
    private String sgPrice;

    private Boolean sgConfirm;

    private String sgFunction;

    private Integer sgSort;

    private String sgDescription;

    public Integer getSgId() {
        return sgId;
    }

    public void setSgId(Integer sgId) {
        this.sgId = sgId;
    }

    public String getSgName() {
        return sgName;
    }

    public void setSgName(String sgName) {
        this.sgName = sgName == null ? null : sgName.trim();
    }

    public Integer getSgGoodsLimit() {
        return sgGoodsLimit;
    }

    public void setSgGoodsLimit(Integer sgGoodsLimit) {
        this.sgGoodsLimit = sgGoodsLimit;
    }

    public Integer getSgAlbumLimit() {
        return sgAlbumLimit;
    }

    public void setSgAlbumLimit(Integer sgAlbumLimit) {
        this.sgAlbumLimit = sgAlbumLimit;
    }

    public Integer getSgSpaceLimit() {
        return sgSpaceLimit;
    }

    public void setSgSpaceLimit(Integer sgSpaceLimit) {
        this.sgSpaceLimit = sgSpaceLimit;
    }

    public Integer getSgTemplateNumber() {
        return sgTemplateNumber;
    }

    public void setSgTemplateNumber(Integer sgTemplateNumber) {
        this.sgTemplateNumber = sgTemplateNumber;
    }

    public String getSgTemplate() {
        return sgTemplate;
    }

    public void setSgTemplate(String sgTemplate) {
        this.sgTemplate = sgTemplate == null ? null : sgTemplate.trim();
    }

    public String getSgPrice() {
        return sgPrice;
    }

    public void setSgPrice(String sgPrice) {
        this.sgPrice = sgPrice == null ? null : sgPrice.trim();
    }

    public Boolean getSgConfirm() {
        return sgConfirm;
    }

    public void setSgConfirm(Boolean sgConfirm) {
        this.sgConfirm = sgConfirm;
    }

    public String getSgFunction() {
        return sgFunction;
    }

    public void setSgFunction(String sgFunction) {
        this.sgFunction = sgFunction == null ? null : sgFunction.trim();
    }

    public Integer getSgSort() {
        return sgSort;
    }

    public void setSgSort(Integer sgSort) {
        this.sgSort = sgSort;
    }

    public String getSgDescription() {
        return sgDescription;
    }

    public void setSgDescription(String sgDescription) {
        this.sgDescription = sgDescription == null ? null : sgDescription.trim();
    }
}
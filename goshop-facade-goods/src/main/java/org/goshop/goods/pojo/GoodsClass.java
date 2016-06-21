package org.goshop.goods.pojo;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonProperty;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

@JsonInclude(JsonInclude.Include.NON_EMPTY)
public class GoodsClass  implements Serializable {
    @JsonProperty("gc_id")
    private Integer gcId;
    @JsonProperty("gc_name")
    private String gcName;
    @JsonProperty("type_id")
    private Integer typeId;
    @JsonProperty("type_name")
    @JsonInclude(JsonInclude.Include.ALWAYS)
    private String typeName;
    @JsonProperty("gc_parent_id")
    private Integer gcParentId;
    @JsonProperty("gc_sort")
    private Integer gcSort;
    @JsonProperty("gc_title")
    private String gcTitle;
    @JsonProperty("gc_keywords")
    private String gcKeywords;
    @JsonProperty("gc_description")
    private String gcDescription;
    @JsonProperty("sc_pic")
    private String gcPic;
    //虚拟字段
    private Integer grade;

    public Integer getGrade() {
        return grade;
    }

    public void setGrade(Integer grade) {
        this.grade = grade;
    }

    public String getGcPic() {
        return gcPic;
    }

    public void setGcPic(String gcPic) {
        this.gcPic = gcPic;
    }

    private List<GoodsClass> children = new ArrayList<GoodsClass>();

    public List<GoodsClass> getChildren() {
        return children;
    }

    public void setChildren(List<GoodsClass> children) {
        this.children = children;
    }

    public Integer getGcId() {
        return gcId;
    }

    public void setGcId(Integer gcId) {
        this.gcId = gcId;
    }

    public String getGcName() {
        return gcName;
    }

    public void setGcName(String gcName) {
        this.gcName = gcName == null ? null : gcName.trim();
    }

    public Integer getTypeId() {
        return typeId;
    }

    public void setTypeId(Integer typeId) {
        this.typeId = typeId;
    }

    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName == null ? null : typeName.trim();
    }

    public Integer getGcParentId() {
        return gcParentId;
    }

    public void setGcParentId(Integer gcParentId) {
        this.gcParentId = gcParentId;
    }

    public Integer getGcSort() {
        return gcSort;
    }

    public void setGcSort(Integer gcSort) {
        this.gcSort = gcSort;
    }

    public String getGcTitle() {
        return gcTitle;
    }

    public void setGcTitle(String gcTitle) {
        this.gcTitle = gcTitle == null ? null : gcTitle.trim();
    }

    public String getGcKeywords() {
        return gcKeywords;
    }

    public void setGcKeywords(String gcKeywords) {
        this.gcKeywords = gcKeywords == null ? null : gcKeywords.trim();
    }

    public String getGcDescription() {
        return gcDescription;
    }

    public void setGcDescription(String gcDescription) {
        this.gcDescription = gcDescription == null ? null : gcDescription.trim();
    }

}
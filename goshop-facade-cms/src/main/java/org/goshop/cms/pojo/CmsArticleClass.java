package org.goshop.cms.pojo;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonProperty;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

@JsonInclude(JsonInclude.Include.NON_EMPTY)
public class CmsArticleClass implements Serializable {
    @JsonProperty("sc_id")
    private Long classId;
    @JsonProperty("sc_parent_id")
    private Long parentId;
    @JsonProperty("sc_name")
    private String className;
    @JsonProperty("sc_sort")
    private Integer classSort;

    //虚拟字段
    private Integer grade;

    public Integer getGrade() {
        return grade;
    }

    public void setGrade(Integer grade) {
        this.grade = grade;
    }

    @JsonIgnore
    private List<CmsArticleClass> children = new ArrayList<>();

    public List<CmsArticleClass> getChildren() {
        return children;
    }

    public void setChildren(List<CmsArticleClass> children) {
        this.children = children;
    }

    public Long getClassId() {
        return classId;
    }

    public void setClassId(Long classId) {
        this.classId = classId;
    }

    public Long getParentId() {
        return parentId;
    }

    public void setParentId(Long parentId) {
        this.parentId = parentId;
    }

    public String getClassName() {
        return className;
    }

    public void setClassName(String className) {
        this.className = className == null ? null : className.trim();
    }

    public Integer getClassSort() {
        return classSort;
    }

    public void setClassSort(Integer classSort) {
        this.classSort = classSort;
    }
}
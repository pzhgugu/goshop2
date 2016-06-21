package org.goshop.store.pojo;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonProperty;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

@JsonInclude(JsonInclude.Include.NON_EMPTY)
public class StoreClass implements Serializable {
    @JsonProperty("sc_id")
    private Long id;
    @JsonProperty("sc_sort")
    private Integer sort;
    @JsonProperty("sc_name")
    private String name;
    @JsonProperty("sc_parent_id")
    private Long parentId;

    //虚拟字段
    private Integer grade;

    public Integer getGrade() {
        return grade;
    }

    public void setGrade(Integer grade) {
        this.grade = grade;
    }

    @JsonIgnore
    private List<StoreClass> children = new ArrayList<StoreClass>();

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Integer getSort() {
        return sort;
    }

    public void setSort(Integer sort) {
        this.sort = sort;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public Long getParentId() {
        return parentId;
    }

    public void setParentId(Long parentId) {
        this.parentId = parentId ;
    }

    public List<StoreClass> getChildren() {
        return children;
    }

    public void setChildren(List<StoreClass> children) {
        this.children = children;
    }
}
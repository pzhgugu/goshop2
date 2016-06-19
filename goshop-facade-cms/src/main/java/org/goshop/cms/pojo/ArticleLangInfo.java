package org.goshop.cms.pojo;

import java.io.Serializable;

public class ArticleLangInfo implements Serializable {
    private Long articleInfoId;

    private Long articleId;

    private String langType;

    private String articleTitle;

    private String articleAuthor;

    private String articleAbstract;

    private String articleKeyword;

    private Integer articleClick;

    private String articleContent;

    public Long getArticleInfoId() {
        return articleInfoId;
    }

    public void setArticleInfoId(Long articleInfoId) {
        this.articleInfoId = articleInfoId;
    }

    public Long getArticleId() {
        return articleId;
    }

    public void setArticleId(Long articleId) {
        this.articleId = articleId;
    }

    public String getLangType() {
        return langType;
    }

    public void setLangType(String langType) {
        this.langType = langType == null ? null : langType.trim();
    }

    public String getArticleTitle() {
        return articleTitle;
    }

    public void setArticleTitle(String articleTitle) {
        this.articleTitle = articleTitle == null ? null : articleTitle.trim();
    }

    public String getArticleAuthor() {
        return articleAuthor;
    }

    public void setArticleAuthor(String articleAuthor) {
        this.articleAuthor = articleAuthor == null ? null : articleAuthor.trim();
    }

    public String getArticleAbstract() {
        return articleAbstract;
    }

    public void setArticleAbstract(String articleAbstract) {
        this.articleAbstract = articleAbstract == null ? null : articleAbstract.trim();
    }

    public String getArticleKeyword() {
        return articleKeyword;
    }

    public void setArticleKeyword(String articleKeyword) {
        this.articleKeyword = articleKeyword == null ? null : articleKeyword.trim();
    }

    public Integer getArticleClick() {
        return articleClick;
    }

    public void setArticleClick(Integer articleClick) {
        this.articleClick = articleClick;
    }

    public String getArticleContent() {
        return articleContent;
    }

    public void setArticleContent(String articleContent) {
        this.articleContent = articleContent == null ? null : articleContent.trim();
    }
}
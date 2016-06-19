package org.goshop.manager.model;

/**
 * Created by Administrator on 2016/5/7.
 */
public class ArticleLangInfoModel {

    private String articleTitle_zh;

    private String articleTitle_en;

    private String articleAuthor_zh;

    private String articleAuthor_en;

    private String articleContent_zh;

    private String articleContent_en;

    private Long articleInfoId_zh;

    private Long articleInfoId_en;

    private String articleAbstract_zh;

    private String articleAbstract_en;

    private String[] file_id;

    private String[] file_path;

    public String getArticleAbstract_zh() {
        return articleAbstract_zh;
    }

    public void setArticleAbstract_zh(String articleAbstract_zh) {
        this.articleAbstract_zh = articleAbstract_zh;
    }

    public String getArticleAbstract_en() {
        return articleAbstract_en;
    }

    public void setArticleAbstract_en(String articleAbstract_en) {
        this.articleAbstract_en = articleAbstract_en;
    }

    public Long getArticleInfoId_zh() {
        return articleInfoId_zh;
    }

    public void setArticleInfoId_zh(Long articleInfoId_zh) {
        this.articleInfoId_zh = articleInfoId_zh;
    }

    public Long getArticleInfoId_en() {
        return articleInfoId_en;
    }

    public void setArticleInfoId_en(Long articleInfoId_en) {
        this.articleInfoId_en = articleInfoId_en;
    }

    public String[] getFile_id() {
        return file_id;
    }

    public void setFile_id(String[] file_id) {
        this.file_id = file_id;
    }

    public String[] getFile_path() {
        return file_path;
    }

    public void setFile_path(String[] file_path) {
        this.file_path = file_path;
    }

    public String getArticleTitle_zh() {
        return articleTitle_zh;
    }

    public void setArticleTitle_zh(String articleTitle_zh) {
        this.articleTitle_zh = articleTitle_zh;
    }

    public String getArticleTitle_en() {
        return articleTitle_en;
    }

    public void setArticleTitle_en(String articleTitle_en) {
        this.articleTitle_en = articleTitle_en;
    }

    public String getArticleAuthor_zh() {
        return articleAuthor_zh;
    }

    public void setArticleAuthor_zh(String articleAuthor_zh) {
        this.articleAuthor_zh = articleAuthor_zh;
    }

    public String getArticleAuthor_en() {
        return articleAuthor_en;
    }

    public void setArticleAuthor_en(String articleAuthor_en) {
        this.articleAuthor_en = articleAuthor_en;
    }

    public String getArticleContent_zh() {
        return articleContent_zh;
    }

    public void setArticleContent_zh(String articleContent_zh) {
        this.articleContent_zh = articleContent_zh;
    }

    public String getArticleContent_en() {
        return articleContent_en;
    }

    public void setArticleContent_en(String articleContent_en) {
        this.articleContent_en = articleContent_en;
    }
}

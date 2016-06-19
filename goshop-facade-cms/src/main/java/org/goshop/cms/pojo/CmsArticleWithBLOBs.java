package org.goshop.cms.pojo;

public class CmsArticleWithBLOBs extends CmsArticle {
    private String articleContent;

    private String articleGoods;

    private String articleImageAll;

    public String getArticleContent() {
        return articleContent;
    }

    public void setArticleContent(String articleContent) {
        this.articleContent = articleContent == null ? null : articleContent.trim();
    }

    public String getArticleGoods() {
        return articleGoods;
    }

    public void setArticleGoods(String articleGoods) {
        this.articleGoods = articleGoods == null ? null : articleGoods.trim();
    }

    public String getArticleImageAll() {
        return articleImageAll;
    }

    public void setArticleImageAll(String articleImageAll) {
        this.articleImageAll = articleImageAll == null ? null : articleImageAll.trim();
    }
}
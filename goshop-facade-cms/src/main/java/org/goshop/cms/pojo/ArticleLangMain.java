package org.goshop.cms.pojo;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.List;

public class ArticleLangMain implements Serializable {
    private Long articleId;

    private Long articleClassId;

    private String articleOrigin;

    private String articleOriginAddress;

    private String articleImage;

    private String articleLink;

    private Timestamp articleStartTime;

    private Timestamp articleEndTime;

    private Timestamp articlePublishTime;

    private Integer articleSort;

    private Integer articleDigest;

    private Integer articleCommendFlag;

    private Integer articleCommentFlag;

    private Integer articleState;

    private String articlePublisherName;

    private Long articlePublisherId;

    private Integer articleType;

    private String articleAttachmentPath;

    private Timestamp articleModifyTime;

    private Integer articleShareCount;

    private String articleImageAll;

    private List<ArticleLangInfo> articleLangInfoList;

    public List<ArticleLangInfo> getArticleLangInfoList() {
        return articleLangInfoList;
    }

    public void setArticleLangInfoList(List<ArticleLangInfo> articleLangInfoList) {
        this.articleLangInfoList = articleLangInfoList;
    }

    public Long getArticleId() {
        return articleId;
    }

    public void setArticleId(Long articleId) {
        this.articleId = articleId;
    }

    public Long getArticleClassId() {
        return articleClassId;
    }

    public void setArticleClassId(Long articleClassId) {
        this.articleClassId = articleClassId;
    }

    public String getArticleOrigin() {
        return articleOrigin;
    }

    public void setArticleOrigin(String articleOrigin) {
        this.articleOrigin = articleOrigin == null ? null : articleOrigin.trim();
    }

    public String getArticleOriginAddress() {
        return articleOriginAddress;
    }

    public void setArticleOriginAddress(String articleOriginAddress) {
        this.articleOriginAddress = articleOriginAddress == null ? null : articleOriginAddress.trim();
    }

    public String getArticleImage() {
        return articleImage;
    }

    public void setArticleImage(String articleImage) {
        this.articleImage = articleImage == null ? null : articleImage.trim();
    }

    public String getArticleLink() {
        return articleLink;
    }

    public void setArticleLink(String articleLink) {
        this.articleLink = articleLink == null ? null : articleLink.trim();
    }

    public Timestamp getArticleStartTime() {
        return articleStartTime;
    }

    public void setArticleStartTime(Timestamp articleStartTime) {
        this.articleStartTime = articleStartTime;
    }

    public Timestamp getArticleEndTime() {
        return articleEndTime;
    }

    public void setArticleEndTime(Timestamp articleEndTime) {
        this.articleEndTime = articleEndTime;
    }

    public Timestamp getArticlePublishTime() {
        return articlePublishTime;
    }

    public void setArticlePublishTime(Timestamp articlePublishTime) {
        this.articlePublishTime = articlePublishTime;
    }

    public Integer getArticleSort() {
        return articleSort;
    }

    public void setArticleSort(Integer articleSort) {
        this.articleSort = articleSort;
    }

    public Integer getArticleDigest() {
        return articleDigest;
    }

    public void setArticleDigest(Integer articleDigest) {
        this.articleDigest = articleDigest;
    }

    public Integer getArticleCommendFlag() {
        return articleCommendFlag;
    }

    public void setArticleCommendFlag(Integer articleCommendFlag) {
        this.articleCommendFlag = articleCommendFlag;
    }

    public Integer getArticleCommentFlag() {
        return articleCommentFlag;
    }

    public void setArticleCommentFlag(Integer articleCommentFlag) {
        this.articleCommentFlag = articleCommentFlag;
    }

    public Integer getArticleState() {
        return articleState;
    }

    public void setArticleState(Integer articleState) {
        this.articleState = articleState;
    }

    public String getArticlePublisherName() {
        return articlePublisherName;
    }

    public void setArticlePublisherName(String articlePublisherName) {
        this.articlePublisherName = articlePublisherName == null ? null : articlePublisherName.trim();
    }

    public Long getArticlePublisherId() {
        return articlePublisherId;
    }

    public void setArticlePublisherId(Long articlePublisherId) {
        this.articlePublisherId = articlePublisherId;
    }

    public Integer getArticleType() {
        return articleType;
    }

    public void setArticleType(Integer articleType) {
        this.articleType = articleType;
    }

    public String getArticleAttachmentPath() {
        return articleAttachmentPath;
    }

    public void setArticleAttachmentPath(String articleAttachmentPath) {
        this.articleAttachmentPath = articleAttachmentPath == null ? null : articleAttachmentPath.trim();
    }

    public Timestamp getArticleModifyTime() {
        return articleModifyTime;
    }

    public void setArticleModifyTime(Timestamp articleModifyTime) {
        this.articleModifyTime = articleModifyTime;
    }

    public Integer getArticleShareCount() {
        return articleShareCount;
    }

    public void setArticleShareCount(Integer articleShareCount) {
        this.articleShareCount = articleShareCount;
    }

    public String getArticleImageAll() {
        return articleImageAll;
    }

    public void setArticleImageAll(String articleImageAll) {
        this.articleImageAll = articleImageAll == null ? null : articleImageAll.trim();
    }
}
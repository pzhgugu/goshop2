package org.goshop.cms.pojo;

import com.fasterxml.jackson.annotation.JsonInclude;

import java.io.Serializable;
import java.sql.Timestamp;

@JsonInclude(JsonInclude.Include.NON_EMPTY)
public class CmsArticle implements Serializable {
    private Long articleId;

    private String articleTitle;

    private Long articleClassId;

    private String articleOrigin;

    private String articleOriginAddress;

    private String articleAuthor;

    private String articleAbstract;

    private String articleImage;

    private String articleKeyword;

    private String articleLink;

    private Timestamp articleStartTime;

    private Timestamp articleEndTime;

    private Timestamp articlePublishTime;

    private Integer articleClick;

    private Integer articleSort;

    private Integer articleDigest;

    private Integer articleCommendFlag;

    private Integer articleCommentFlag;

    private String articleVerifyAdmin;

    private Timestamp articleVerifyTime;

    private Integer articleState;

    private String articlePublisherName;

    private Long articlePublisherId;

    private Integer articleType;

    private String articleAttachmentPath;

    private Timestamp articleModifyTime;

    private String articleTag;

    private Integer articleCommentCount;

    private Integer articleAttitude1;

    private Integer articleAttitude2;

    private Integer articleAttitude3;

    private Integer articleAttitude4;

    private Integer articleAttitude5;

    private Integer articleAttitude6;

    private String articleTitleShort;

    private Integer articleAttitudeFlag;

    private Integer articleCommendImageFlag;

    private Integer articleShareCount;

    private String articleVerifyReason;

    public Long getArticleId() {
        return articleId;
    }

    public void setArticleId(Long articleId) {
        this.articleId = articleId;
    }

    public String getArticleTitle() {
        return articleTitle;
    }

    public void setArticleTitle(String articleTitle) {
        this.articleTitle = articleTitle == null ? null : articleTitle.trim();
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

    public String getArticleImage() {
        return articleImage;
    }

    public void setArticleImage(String articleImage) {
        this.articleImage = articleImage == null ? null : articleImage.trim();
    }

    public String getArticleKeyword() {
        return articleKeyword;
    }

    public void setArticleKeyword(String articleKeyword) {
        this.articleKeyword = articleKeyword == null ? null : articleKeyword.trim();
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

    public Integer getArticleClick() {
        return articleClick;
    }

    public void setArticleClick(Integer articleClick) {
        this.articleClick = articleClick;
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

    public String getArticleVerifyAdmin() {
        return articleVerifyAdmin;
    }

    public void setArticleVerifyAdmin(String articleVerifyAdmin) {
        this.articleVerifyAdmin = articleVerifyAdmin == null ? null : articleVerifyAdmin.trim();
    }

    public Timestamp getArticleVerifyTime() {
        return articleVerifyTime;
    }

    public void setArticleVerifyTime(Timestamp articleVerifyTime) {
        this.articleVerifyTime = articleVerifyTime;
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

    public String getArticleTag() {
        return articleTag;
    }

    public void setArticleTag(String articleTag) {
        this.articleTag = articleTag == null ? null : articleTag.trim();
    }

    public Integer getArticleCommentCount() {
        return articleCommentCount;
    }

    public void setArticleCommentCount(Integer articleCommentCount) {
        this.articleCommentCount = articleCommentCount;
    }

    public Integer getArticleAttitude1() {
        return articleAttitude1;
    }

    public void setArticleAttitude1(Integer articleAttitude1) {
        this.articleAttitude1 = articleAttitude1;
    }

    public Integer getArticleAttitude2() {
        return articleAttitude2;
    }

    public void setArticleAttitude2(Integer articleAttitude2) {
        this.articleAttitude2 = articleAttitude2;
    }

    public Integer getArticleAttitude3() {
        return articleAttitude3;
    }

    public void setArticleAttitude3(Integer articleAttitude3) {
        this.articleAttitude3 = articleAttitude3;
    }

    public Integer getArticleAttitude4() {
        return articleAttitude4;
    }

    public void setArticleAttitude4(Integer articleAttitude4) {
        this.articleAttitude4 = articleAttitude4;
    }

    public Integer getArticleAttitude5() {
        return articleAttitude5;
    }

    public void setArticleAttitude5(Integer articleAttitude5) {
        this.articleAttitude5 = articleAttitude5;
    }

    public Integer getArticleAttitude6() {
        return articleAttitude6;
    }

    public void setArticleAttitude6(Integer articleAttitude6) {
        this.articleAttitude6 = articleAttitude6;
    }

    public String getArticleTitleShort() {
        return articleTitleShort;
    }

    public void setArticleTitleShort(String articleTitleShort) {
        this.articleTitleShort = articleTitleShort == null ? null : articleTitleShort.trim();
    }

    public Integer getArticleAttitudeFlag() {
        return articleAttitudeFlag;
    }

    public void setArticleAttitudeFlag(Integer articleAttitudeFlag) {
        this.articleAttitudeFlag = articleAttitudeFlag;
    }

    public Integer getArticleCommendImageFlag() {
        return articleCommendImageFlag;
    }

    public void setArticleCommendImageFlag(Integer articleCommendImageFlag) {
        this.articleCommendImageFlag = articleCommendImageFlag;
    }

    public Integer getArticleShareCount() {
        return articleShareCount;
    }

    public void setArticleShareCount(Integer articleShareCount) {
        this.articleShareCount = articleShareCount;
    }

    public String getArticleVerifyReason() {
        return articleVerifyReason;
    }

    public void setArticleVerifyReason(String articleVerifyReason) {
        this.articleVerifyReason = articleVerifyReason == null ? null : articleVerifyReason.trim();
    }
}
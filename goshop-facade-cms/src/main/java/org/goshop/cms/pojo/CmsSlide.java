package org.goshop.cms.pojo;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonProperty;

import java.io.Serializable;

@JsonInclude(JsonInclude.Include.NON_EMPTY)
public class CmsSlide  implements Serializable {
    @JsonProperty("file_id")
    private Integer slideId;
    @JsonProperty("file_name")
    private String slidePath;

    private String slideUrl;
    @JsonProperty("id")
    private Integer slideSort;

    public Integer getSlideId() {
        return slideId;
    }

    public void setSlideId(Integer slideId) {
        this.slideId = slideId;
    }

    public String getSlidePath() {
        return slidePath;
    }

    public void setSlidePath(String slidePath) {
        this.slidePath = slidePath == null ? null : slidePath.trim();
    }

    public String getSlideUrl() {
        return slideUrl;
    }

    public void setSlideUrl(String slideUrl) {
        this.slideUrl = slideUrl == null ? null : slideUrl.trim();
    }

    public Integer getSlideSort() {
        return slideSort;
    }

    public void setSlideSort(Integer slideSort) {
        this.slideSort = slideSort;
    }
}
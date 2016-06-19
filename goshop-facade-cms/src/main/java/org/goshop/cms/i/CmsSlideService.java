package org.goshop.cms.i;

import org.goshop.cms.pojo.CmsSlide;

import java.util.List;

/**
 * Created by Administrator on 2016/5/5.
 */
public interface CmsSlideService {
    List<CmsSlide> findAll();

    void delete(Integer slideId);

    CmsSlide save(Integer slideSort, String slidePath);

    CmsSlide update(Integer slideId, Integer slideSort, String slidePath);

    void update(Integer[] ids, String[] imageUrl);

    void update(Integer[] ids, String[] imageUrl, Integer[] slideSort);
}

package org.goshop.cmsrest.controller;

import org.goshop.common.web.utils.JsonUtils;
import org.goshop.cms.i.CmsSlideService;
import org.goshop.cms.pojo.CmsArticleClass;
import org.goshop.cms.pojo.CmsSlide;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@Controller
@RequestMapping("/cms_slide")
public class CmsSlideController {

    @Autowired
    CmsSlideService cmsSlideService;

    @RequestMapping("/new_slide")
    @ResponseBody
    public Object newSlide(Long parentId, String callback, HttpServletRequest request, HttpServletResponse response ) {
        List<CmsSlide> list=cmsSlideService.findAll();
        return JsonUtils.jsonp(list, callback);
    }
}

package org.goshop.cmsrest.controller;

import org.goshop.common.web.utils.JsonUtils;
import org.goshop.cms.i.CmsArticleClassService;
import org.goshop.cms.pojo.CmsArticleClass;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/cms_article_class")
public class CmsArticleClassController {

    @Autowired
    CmsArticleClassService cmsArticleClassService;

    @RequestMapping("/query")
    @ResponseBody
    public Object query(Long parentId, String callback, HttpServletRequest request, HttpServletResponse response ) {
        List<CmsArticleClass> list=cmsArticleClassService.findByParentId(parentId);
        return JsonUtils.jsonp(list, callback);
    }
}

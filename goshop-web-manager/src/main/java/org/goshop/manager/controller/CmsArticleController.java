package org.goshop.manager.controller;

import com.github.pagehelper.PageInfo;
import org.goshop.common.attachment.AttachmentService;
import org.goshop.common.exception.PageException;
import org.goshop.common.pojo.ResponseStatus;
import org.goshop.common.utils.IDUtils;
import org.goshop.common.web.utils.JsonUtils;
import org.goshop.common.web.utils.ResponseMessageUtils;
import org.goshop.cms.i.CmsArticleClassService;
import org.goshop.cms.i.CmsArticleService;
import org.goshop.cms.pojo.CmsArticle;
import org.goshop.cms.pojo.CmsArticleClass;
import org.goshop.cms.pojo.CmsArticleWithBLOBs;
import org.goshop.users.pojo.User;
import org.goshop.manager.utils.Jump;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/cms_article")
public class CmsArticleController {

    @Autowired
    CmsArticleService cmsArticleService;

    @Autowired
    CmsArticleClassService cmsArticleClassService;

    @Autowired
    AttachmentService attachmentService;

    @RequestMapping(value = "cms_article_list",method = RequestMethod.GET)
    public String index(@RequestParam(value="p",required=false) Integer curPage,
                        String article_title,String article_publisher_name,
                        Integer article_state,
                        Model model, HttpServletRequest request) {
        if(article_state==null){
            article_state=3;
        }
        PageInfo<CmsArticle> page=null;
        if(StringUtils.hasText(article_title)||StringUtils.hasText(article_publisher_name)){
            page=cmsArticleService.query(curPage, 20, article_state, article_title, article_publisher_name);
        }else{
            page=cmsArticleService.findBaseByArticleState(curPage, 20, article_state);
        }
        model.addAttribute("P_PAGE",page);
        return "cms/article";
    }

    @RequestMapping(value = "add",method = RequestMethod.GET)
    public String addPage(Model model, HttpServletRequest request) {
        List<CmsArticleClass> classList =cmsArticleClassService.findTreeByParentId(null);
        model.addAttribute("P_CLASS_LIST",classList);
        return "cms/article_add";
    }


    @RequestMapping(value = "add",method = RequestMethod.POST)
    public String add(User user,CmsArticleWithBLOBs cmsArticle,Model model, HttpServletRequest request) {
        String url=request.getContextPath()+"/cms_article/cms_article_list";
        //管理员投稿
        cmsArticle.setArticleType(1);
        cmsArticle.setArticlePublisherId(user.getId());
        cmsArticle.setArticlePublisherName(user.getLoginName());
        cmsArticleService.save(cmsArticle);
        return Jump.get(url, "保存成功！");
    }

    @RequestMapping("/article_pic_upload")
    @ResponseBody
    public void articlePicUpload(@RequestParam(value = "fileupload") MultipartFile fileUpload,
                                   HttpServletRequest request, HttpServletResponse response) {
        Map<String,Object> retMap = new HashMap<>();
        try {
            String path=attachmentService.upload(fileUpload);
            retMap.put("file_id", IDUtils.getUuid());
            retMap.put("file_name",path);
            retMap.put("file_path",path);
        } catch (IOException e) {
            e.printStackTrace();
            throw new PageException("文件上传错误！");
        }
        ResponseMessageUtils.textPlainResponse(response, JsonUtils.objectToJson(retMap));
    }

    @RequestMapping("delete")
    public String delete(Long article_id,Model model, HttpServletRequest request) {
        String url=request.getContextPath()+"/cms_article/cms_article_list";
        cmsArticleService.delete(article_id);
        return Jump.get(url, "删除成功！");
    }

    @RequestMapping(value = "edit",method = RequestMethod.GET)
    public String editPage(Long article_id,Model model, HttpServletRequest request) {
        List<CmsArticleClass> classList =cmsArticleClassService.findTreeByParentId(null);
        model.addAttribute("P_CLASS_LIST", classList);

        CmsArticleWithBLOBs cmsArticle=cmsArticleService.findOne(article_id);
        model.addAttribute("P_CMS_ARTICLE", cmsArticle);
        return "cms/article_add";
    }

    @RequestMapping(value = "edit",method = RequestMethod.POST)
    public String edit(CmsArticleWithBLOBs cmsArticle,Model model, HttpServletRequest request) {
        String url=request.getContextPath()+"/cms_article/cms_article_list";
        cmsArticleService.update(cmsArticle);
        return Jump.get(url, "保存成功！");
    }

    @RequestMapping("/inline_edit")
    @ResponseBody
    public String inline_edit(String op,String branch,Long id,String column,Integer value){
        if(!StringUtils.hasText(op)){
            return ResponseStatus.get(false);
        }
        if(op.equals("ajax")) {
            if (StringUtils.hasText(column)) {
                if (column.equals("article_commend_flag")) {
                    cmsArticleService.updateByArticleCommendFlag(id, value);
                } else if (column.equals("article_commend_image_flag")) {
                    cmsArticleService.updateByArticleCommendImageFlag(id, value);
                } else if (column.equals("article_comment_flag")) {
                    cmsArticleService.updateByArticleCommentFlag(id, value);
                } else if (column.equals("article_attitude_flag")) {
                    cmsArticleService.updateByArticleAttitudeFlag(id, value);
                }
            } else {
                return ResponseStatus.get(false);
            }
        }else if(op.equals("update_article_sort")){
            cmsArticleService.updateByArticleSort(id,value);
        }else if(op.equals("update_article_click")){
            cmsArticleService.updateByArticleClick(id,value);
        }
        return ResponseStatus.get(true);
    }
}

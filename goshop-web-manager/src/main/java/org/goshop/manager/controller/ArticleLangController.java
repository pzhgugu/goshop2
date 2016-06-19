package org.goshop.manager.controller;

import com.github.pagehelper.PageInfo;
import org.goshop.cms.pojo.ArticleLangInfo;
import org.goshop.cms.pojo.ArticleLangMain;
import org.goshop.cms.pojo.CmsArticleClass;
import org.goshop.common.attachment.AttachmentService;
import org.goshop.common.context.CustomTimestampEditor;
import org.goshop.common.exception.PageException;
import org.goshop.common.utils.IDUtils;
import org.goshop.common.web.utils.JsonUtils;
import org.goshop.common.web.utils.ResponseMessageUtils;
import org.goshop.cms.i.ArticleLangService;
import org.goshop.cms.i.CmsArticleClassService;
import org.goshop.manager.model.ArticleImagesModel;
import org.goshop.manager.model.ArticleLangInfoModel;
import org.goshop.manager.utils.Jump;
import org.goshop.users.pojo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.goshop.common.pojo.ResponseStatus;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/article_lang")
public class ArticleLangController {

    @Autowired
    ArticleLangService articleLangService;

    @Autowired
    CmsArticleClassService cmsArticleClassService;

    @Autowired
    AttachmentService attachmentService;

    @InitBinder
    protected void initBinder(HttpServletRequest request,
                              ServletRequestDataBinder binder) throws Exception {
        //对于需要转换为Date类型的属性，使用DateEditor进行处理
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        dateFormat.setLenient(false);

        SimpleDateFormat datetimeFormat = new SimpleDateFormat(
                "yyyy-MM-dd");
        datetimeFormat.setLenient(false);

        binder.registerCustomEditor(java.util.Date.class, new CustomDateEditor(
                dateFormat, true));
        binder.registerCustomEditor(java.sql.Timestamp.class,
                new CustomTimestampEditor(datetimeFormat, true));
    }

    @RequestMapping(value = "article_list",method = RequestMethod.GET)
    public String index(@RequestParam(value="p",required=false) Integer curPage,
                        String article_title,String article_publisher_name,
                        Integer article_state,Long article_class_id,
                        Model model, HttpServletRequest request) {
        List<CmsArticleClass> classList=cmsArticleClassService.findByParentId(null);
        model.addAttribute("P_CLASS_LIST", classList);
        PageInfo<ArticleLangMain> page=null;
        if(StringUtils.hasText(article_title)||StringUtils.hasText(article_publisher_name)||article_class_id!=null||article_state!=null){
            page=articleLangService.queryMany(curPage, 20, article_title, article_publisher_name,article_state, article_class_id);
        }else{
            page=articleLangService.findManyAll(curPage, 20);
        }
        model.addAttribute("P_PAGE", page);
        return "cms/article_lang";
    }

   @RequestMapping(value = "add",method = RequestMethod.GET)
    public String addPage(Model model, HttpServletRequest request) {
        List<CmsArticleClass> classList =cmsArticleClassService.findTreeByParentId(null);
        model.addAttribute("P_CLASS_LIST",classList);
        return "cms/article_lang_add";
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

    @RequestMapping("/delete_image")
    @ResponseBody
    public Boolean articlePicUpload(String file_id,String file_name,Long article_id,
                                 HttpServletRequest request, HttpServletResponse response) {
        try {
            attachmentService.delete(file_name);
        }catch (Exception e){
            return false;
        }
        if(article_id!=null){
            ArticleLangMain articleLangMain =articleLangService.findMainOne(article_id);
            List<ArticleImagesModel> aimList = JsonUtils.jsonToList(articleLangMain.getArticleImageAll(), ArticleImagesModel.class);
            for(ArticleImagesModel aim:aimList){
                if(aim.getId().equals(file_id)){
                    aimList.remove(aim);
                    break;
                }
            }
            articleLangMain.setArticleImageAll(JsonUtils.objectToJson(aimList));
            articleLangService.update(articleLangMain);
        }
        return true;
    }

     @RequestMapping(value = "add",method = RequestMethod.POST)
    public String add(User user, ArticleLangMain articleLang,
                      ArticleLangInfoModel articleLangInfoModel,
                      Integer type,
                      Model model, HttpServletRequest request) {

         String url=request.getContextPath()+"/article_lang/article_list";
         if(type!=null&&type==1){
             url+="?type=1&article_state=3&article_class_id="+articleLang.getArticleClassId();
         }
         //管理员投稿
         articleLang.setArticleType(1);
         articleLang.setArticlePublisherId(user.getId());
         articleLang.setArticlePublisherName(user.getLoginName());

         articleLang.setArticleImageAll(this.getArticleImageAll(articleLangInfoModel));
        articleLangService.save(articleLang, this.getArticleLangInfoList(articleLangInfoModel));
        return Jump.get(url, "保存成功！");
    }

    private List<ArticleLangInfo> getArticleLangInfoList(ArticleLangInfoModel articleLangInfoModel) {
        List<ArticleLangInfo> articleLangInfoList = new ArrayList<>();
        //中文
        ArticleLangInfo zh = new ArticleLangInfo();
        zh.setArticleTitle(articleLangInfoModel.getArticleTitle_zh());
        zh.setArticleAuthor(articleLangInfoModel.getArticleAuthor_zh());
        zh.setArticleContent(articleLangInfoModel.getArticleContent_zh());
        zh.setArticleInfoId(articleLangInfoModel.getArticleInfoId_zh());
        zh.setArticleAbstract(articleLangInfoModel.getArticleAbstract_zh());
        zh.setLangType("zh");
        //英文
        ArticleLangInfo en = new ArticleLangInfo();
        en.setArticleTitle(articleLangInfoModel.getArticleTitle_en());
        en.setArticleAuthor(articleLangInfoModel.getArticleAuthor_en());
        en.setArticleContent(articleLangInfoModel.getArticleContent_en());
        en.setArticleInfoId(articleLangInfoModel.getArticleInfoId_en());
        en.setArticleAbstract(articleLangInfoModel.getArticleAbstract_en());
        en.setLangType("en");

        articleLangInfoList.add(zh);
        articleLangInfoList.add(en);
        return articleLangInfoList;
    }

    private String getArticleImageAll(ArticleLangInfoModel articleLangInfoModel) {
        String[] ids = articleLangInfoModel.getFile_id();
        if(ids!=null&&ids.length>0){
            List<ArticleImagesModel> imageList=new ArrayList<>();
            for(int i=0;i<ids.length;i++){
                ArticleImagesModel aim = new ArticleImagesModel();
                aim.setId(ids[i]);
                aim.setPath(articleLangInfoModel.getFile_path()[i]);
                imageList.add(aim);
            }
            return JsonUtils.objectToJson(imageList);
        }
        return null;
    }


    @RequestMapping(value = "edit",method = RequestMethod.GET)
    public String editPage(Long article_id,Model model, HttpServletRequest request) {
        List<CmsArticleClass> classList =cmsArticleClassService.findTreeByParentId(null);
        model.addAttribute("P_CLASS_LIST", classList);

        ArticleLangMain article=articleLangService.findManyOne(article_id);
        if(StringUtils.hasText(article.getArticleImageAll())){
            model.addAttribute("P_IMAGES", JsonUtils.jsonToList(article.getArticleImageAll(), ArticleImagesModel.class));
        }
        model.addAttribute("P_CMS_ARTICLE", article);
        return "cms/article_lang_add";
    }

    @RequestMapping(value = "edit",method = RequestMethod.POST)
    public String edit(User user,ArticleLangMain articleLang,
                       Integer type,
                       ArticleLangInfoModel articleLangInfoModel,Model model, HttpServletRequest request) {
        String url=request.getContextPath()+"/article_lang/article_list";
        if(type!=null&&type==1){
            url+="?type=1&article_state=3&article_class_id="+articleLang.getArticleClassId();
        }
        articleLang.setArticleImageAll(this.getArticleImageAll(articleLangInfoModel));
        articleLangService.update(articleLang,this.getArticleLangInfoList(articleLangInfoModel));
        return Jump.get(url, "修改成功！");
    }

    @RequestMapping("delete")
    public String delete(Long article_id,Long article_class_id,Integer type,Model model, HttpServletRequest request) {
        String url=request.getContextPath()+"/article_lang/article_list";
        if(type!=null&&type==1){
            url+="?type=1&article_state=3&article_class_id="+article_class_id;
        }
        articleLangService.delete(article_id);
        return Jump.get(url, "删除成功！");
    }




    @RequestMapping("/inline_edit")
    @ResponseBody
    public String inline_edit(String op,String branch,Long id,String column,Integer value){
        if(!StringUtils.hasText(op)){
            return ResponseStatus.get(false);
        }
        if(op.equals("update_article_sort")){
            articleLangService.updateByArticleSort(id,value);
        }
        return ResponseStatus.get(true);
    }
}

package org.goshop.manager.controller;

import com.github.pagehelper.PageInfo;
import org.goshop.common.pojo.ResponseStatus;
import org.goshop.cms.i.CmsArticleClassService;
import org.goshop.cms.pojo.CmsArticleClass;
import org.goshop.manager.utils.Jump;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.Assert;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/cms_article_class")
public class CmsArticleClassController {

    @Autowired
    CmsArticleClassService cmsArticleClassService;

    @RequestMapping(value = "index",method = RequestMethod.GET)
    public String index(@RequestParam(value="p",required=false) Integer curPage,
                        Model model, HttpServletRequest request) {
        PageInfo<CmsArticleClass> page=cmsArticleClassService.findGradeByParentId(curPage, 20, null);
        model.addAttribute("P_PAGE",page);
        return "cms/article_class";
    }

    @RequestMapping(value = "/index",method = RequestMethod.POST)
    public String delete(Long[] check_gc_id,
                         Model model, HttpServletRequest request) {
        String url = request.getContextPath();
        cmsArticleClassService.delete(check_gc_id);
        return Jump.get(url + "/cms_article_class/index", "删除成功！");
    }

    @RequestMapping(value = "/save",method = RequestMethod.GET)
    public String savePage(Long sc_parent_id,Model model, HttpServletRequest request) {
        List<CmsArticleClass> list=cmsArticleClassService.findByParentId(null);
        model.addAttribute("P_CLASS_LIST", list);
        model.addAttribute("P_PARENT_ID", sc_parent_id);
        return "cms/article_class_add";
    }

    @RequestMapping(value="/save" ,method = RequestMethod.POST)
    public String save(CmsArticleClass cmsArticleClass, HttpServletRequest request) {
        String url = request.getRequestURI();
        cmsArticleClassService.save(cmsArticleClass);
        return Jump.get(url, "保存成功！");
    }


    @RequestMapping(value = "/edit",method = RequestMethod.GET)
    public String editPage(@RequestParam(value="sc_id",required=false) Long id,
                           Model model, HttpServletRequest request) {
        CmsArticleClass cmsArticleClass=cmsArticleClassService.findOne(id);
        Assert.notNull(cmsArticleClass, "没有此id可编辑！");
        model.addAttribute("P_CLASS", cmsArticleClass);
        return "cms/article_class_edit";
    }

    @RequestMapping(value="/update" ,method = RequestMethod.POST)
    public String update(CmsArticleClass cmsArticleClass, HttpServletRequest request) {
        String url = request.getContextPath();
        cmsArticleClassService.update(cmsArticleClass);
        return Jump.get(url + "/cms_article_class/index", "修改成功！");
    }

    @RequestMapping("check_class_name")
    @ResponseBody
    public String checkClassName(String className,Long parentId,
                                 Long classId,
                                 HttpServletRequest request) {
        try{
            boolean is=cmsArticleClassService.checkByIdNameParentId(classId, className, parentId);
            return ResponseStatus.get(is);
        }catch (Exception e){
            return ResponseStatus.get(false);
        }
    }


    @RequestMapping("inline_edit")
    @ResponseBody
    public String inlineEdit(String column,String value,
                             Long id,
                             HttpServletRequest request) {
        try{
            if(column.equals("sc_sort")){
                cmsArticleClassService.updateClassSort(id,value);
            }else if(column.equals("sc_name")){
                cmsArticleClassService.updateClassName(id,value);
            }
            return ResponseStatus.get(true);
        }catch (Exception e){
            return ResponseStatus.get(false);
        }
    }

    @RequestMapping("children")
    @ResponseBody
    public Object children(Long sc_parent_id,
                           HttpServletRequest request) {
        return cmsArticleClassService.findByParentId(sc_parent_id);
    }

    @RequestMapping("/delete")
    public String delete(Long  sc_id, HttpServletRequest request) {
        String url = request.getContextPath();
        cmsArticleClassService.delete(sc_id);
        return Jump.get(url + "/cms_article_class/index", "删除成功！");
    }
}

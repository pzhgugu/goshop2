package org.goshop.portal.controller;

import org.goshop.common.attachment.AttachmentService;
import org.goshop.common.context.CustomTimestampEditor;
import org.goshop.common.exception.PageException;
import org.goshop.common.utils.*;
import org.goshop.common.web.utils.ImageUtils;
import org.goshop.common.web.utils.JsonUtils;
import org.goshop.common.web.utils.ResponseMessageUtils;
import org.goshop.users.pojo.Member;
import org.goshop.users.pojo.User;
import org.goshop.users.i.MemberService;
import org.goshop.portal.model.MemberModel;
import org.goshop.portal.model.PrivacyModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.image.BufferedImage;
import java.io.*;
import java.text.SimpleDateFormat;

@Controller
@RequestMapping(value =  "/member")
public class MemberController {

    @InitBinder
    protected void initBinder(HttpServletRequest request,
                              ServletRequestDataBinder binder) throws Exception {
        //对于需要转换为Date类型的属性，使用DateEditor进行处理
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        dateFormat.setLenient(false);

        SimpleDateFormat datetimeFormat = new SimpleDateFormat(
                "yyyy-MM-dd HH:mm:ss");
        datetimeFormat.setLenient(false);

        binder.registerCustomEditor(java.util.Date.class, new CustomDateEditor(
                dateFormat, true));
        binder.registerCustomEditor(java.sql.Timestamp.class,
                new CustomTimestampEditor(datetimeFormat, true));
    }

    @Autowired
    MemberService memberService;

    @Autowired
    AttachmentService attachmentService;

    @RequestMapping("/base_set")
    public String index(User user,Model model,
                        HttpServletRequest request,
                        HttpServletResponse response){
        Member member=memberService.findUserByUserId(user.getId());
        String json=member.getMemberPrivacy();
        if(StringUtils.hasText(json)) {
            PrivacyModel pm = (PrivacyModel) JsonUtils.jsonToPojo(json, PrivacyModel.class);
            model.addAttribute("P_PRIVACY", pm);
        }else{
            model.addAttribute("P_PRIVACY", new PrivacyModel());
        }
        model.addAttribute("P_MEMBER",member);
        return "member/set_base";
    }

    @RequestMapping("/base_save")
    @ResponseBody
    public void baseSave(User user,MemberModel memberModel,
                        HttpServletRequest request,
                        HttpServletResponse response){

        String url = request.getContextPath() + "/member/base_set.html";
        String name = "保存成功！";
        try {
            Member member =new Member();
            BeanUtils.applyIf(member, memberModel);
            if(memberModel.getPrivacyModel()!=null) {
                String json = JsonUtils.objectToJson(memberModel.getPrivacyModel());
                member.setMemberPrivacy(json);
            }
            member.setUserId(user.getId());
            memberService.updateByUserId(member);
        } catch (Exception ex) {
            ex.printStackTrace();
            name = "保存失败！";
        }
        ResponseMessageUtils.xmlCDataOut(response, name, url);
    }

    @RequestMapping(value="/password",method = RequestMethod.GET)
    public String password(Model model,
                        HttpServletRequest request,
                        HttpServletResponse response){
        return "member/set_password";
    }

    @RequestMapping(value="/password",method = RequestMethod.POST)
    @ResponseBody
    public void passwordSave(User user,String orig_password,
                           String new_password,String confirm_password,Model model,
                           HttpServletRequest request,
                           HttpServletResponse response){
        String url = request.getContextPath() + "/member/password.html";
        String name = "密码修改成功！";
        if(StringUtils.hasText(orig_password)&&StringUtils.hasText(new_password)&&StringUtils.hasText(confirm_password)) {
            if (new_password.equals(confirm_password)) {
                Boolean is=memberService.checkPassword(user.getId(), orig_password);
                if(is){
                    try {
                        memberService.updatePassword(user.getId(),confirm_password);
                    } catch (Exception e) {
                        e.printStackTrace();
                        name="修改密码错误！";
                    }
                }else {
                    name = "原密码错误，请确认！";
                }
            } else {
                name = "两次密码不同，请确认！";
            }
        }else{
            name = "密码不能为空，请确认！";
        }
        ResponseMessageUtils.xmlCDataOut(response, name, url);
    }

    @RequestMapping(value="/email",method = RequestMethod.GET)
    public String email(Model model,
                           HttpServletRequest request,
                           HttpServletResponse response){
        return "member/set_email";
    }

    @RequestMapping(value="/email",method = RequestMethod.POST)
    @ResponseBody
    public void emailSave(User user,String orig_password,String email,Model model,
                             HttpServletRequest request,
                             HttpServletResponse response){
        String url = request.getContextPath() + "/member/email.html";
        String name = "email修改成功！";
        if(StringUtils.hasText(orig_password)){
            Boolean is=memberService.checkPassword(user.getId(), orig_password);
            if(is){
                memberService.updateEmail(user.getId(), email);
            }else{
                name = "原密码错误，请确认！";
            }
        }else{
            name = "密码不能为空！";
        }
        ResponseMessageUtils.xmlCDataOut(response, name, url);
    }

    @RequestMapping(value="/avatar",method = RequestMethod.GET)
    public String avatar(User user,Model model,
                        HttpServletRequest request,
                        HttpServletResponse response){
        Member member=memberService.findUserByUserId(user.getId());
        model.addAttribute("P_MEMBER", member);
        return "member/set_avatar";
    }

    @RequestMapping(value="/upload",method = RequestMethod.POST)
    public String upload(Model model,
                         @RequestParam(value = "pic") MultipartFile pic,
                         HttpServletRequest request,
                         HttpServletResponse response){
        File file= null;
        try {
            file = ImageUtils.save(pic, 500);
        } catch (IOException e) {
            e.printStackTrace();
            throw new PageException("裁剪图片错误！");
        }
        String type = FileUtils.getFileType(pic.getOriginalFilename()).toLowerCase();
        try {
            String path=attachmentService.upload(file,type);
            model.addAttribute("P_USER_IMAGE",path);
        } catch (Exception e) {
            e.printStackTrace();
            throw new PageException("上传图片错误！");
        }
        InputStream is= null;
        try {
            is = new FileInputStream(file);
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
        BufferedImage bi= null;
        try {
            bi = ImageIO.read(is);
        } catch (IOException e) {
            e.printStackTrace();
        }
        model.addAttribute("P_IMAGE_WIDTH",bi.getWidth());
        model.addAttribute("P_IMAGE_HEIGHT",bi.getHeight());
        return "member/set_avatar_upload";
    }

    @RequestMapping(value="/avatar",method = RequestMethod.POST)
    public String avatarSave(User user,Model model,
                           @RequestParam("x1")Integer x1,
                           @RequestParam("y1")Integer y1,
                           @RequestParam("x2")Integer x2,
                           @RequestParam("y2")Integer y2,
                           @RequestParam("w")Integer width,
                           @RequestParam("h")Integer height,
                           @RequestParam("newfile")String newFile,
                          HttpServletRequest request,
                          HttpServletResponse response){
        try {
            File file = attachmentService.download(newFile);
            String type = FileUtils.getFileType(newFile).toLowerCase();
            InputStream is = new FileInputStream(file);
            File tempFile = File.createTempFile("temp_images_"+ IDUtils.getUuid(),"."+type);
            ImageUtils.abscut(is, x1, y1, width, height, tempFile);
            String path=attachmentService.upload(tempFile,type);
            memberService.saveAvatar(user.getId(),path);
        }catch (Exception e){
            e.printStackTrace();
            throw  new PageException("头像文件保存错误！");
        }
        return "redirect:/member/avatar.html";
    }
}

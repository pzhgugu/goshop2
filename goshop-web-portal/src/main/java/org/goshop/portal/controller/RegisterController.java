package org.goshop.portal.controller;

import org.goshop.common.context.ValidationCodeServlet;
import org.goshop.common.pojo.ResponseStatus;
import org.goshop.common.web.utils.ResponseMessageUtils;
import org.goshop.common.web.utils.TokenUtils;
import org.goshop.users.pojo.Member;
import org.goshop.users.pojo.User;
import org.goshop.users.i.MemberService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
@RequestMapping(value = "/register")
public class RegisterController {

    @Autowired
    MemberService memberService;

    @Autowired
    ValidationCodeServlet validationCodeServlet;

    @RequestMapping
    public String register(HttpServletRequest request) {
        TokenUtils.getInstance().saveToken(request);
        return "register";
    }

    @RequestMapping("save")
    @ResponseBody
    public Object save(Member member,
                       User user,
                       String password_confirm,
                       HttpServletRequest request,
                       HttpServletResponse response) {
        String url = request.getContextPath() + "/register.html";
        if (!TokenUtils.getInstance().verifyToken(request)) {
            ResponseMessageUtils.xmlCDataOut(response, "你已提交了用户数据！", url);
        }

        if (!(password_confirm != null && password_confirm.equals(user.getPassword()))) {
            ResponseMessageUtils.xmlCDataOut(response, "两次密码不同！", url);
        }

        if (!validationCodeServlet.isCaptcha(request)) {
            ResponseMessageUtils.xmlCDataOut(response, "验证码错误！", url);
        }

        String password = user.getPassword();
        try {
            memberService.saveMember(member,user);
        }catch (Exception e){
            e.printStackTrace();
            ResponseMessageUtils.xmlCDataOut(response, "保存用户错误请联系管理员", url);
        }



        //注册用户自动登录
        Subject subject = SecurityUtils.getSubject();
        UsernamePasswordToken token = new UsernamePasswordToken(user.getLoginName(),password);
        token.setRememberMe(true);
        subject.login(token);

        url = request.getContextPath() + "/home.html";
        ResponseMessageUtils.xmlCDataOut(response, "欢迎来到电商测试建议您尽快完善资料，祝您购物愉快！", url);
        return null;
    }

    @RequestMapping("/check/captcha")
    @ResponseBody
    public Object captcha(HttpServletRequest request) {
        return ResponseStatus.get(validationCodeServlet.isCaptcha(request));
    }


}

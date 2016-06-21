package org.goshop.portal.controller;

import org.goshop.common.context.ValidationCodeServlet;
import org.goshop.common.web.utils.ResponseMessageUtils;
import org.goshop.common.web.utils.TokenUtils;
import org.goshop.users.i.MemberService;
import org.goshop.shiro.service.ShiroConfig;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
public class LoginController {

    @Autowired
    MemberService memberService;

    @Autowired
    ValidationCodeServlet validationCodeServlet;
    /**
     * 用户登陆
     */
    @RequestMapping("/login")
    public String login(Model model,HttpServletRequest request,HttpServletResponse response) {
        //如果登陆失败从request中获取认证异常信息，shiroLoginFailure就是shiro异常类的全限定名
        String exceptionClassName = (String) request.getAttribute(ShiroConfig.shiroLoginFailure);
        //根据shiro返回的异常类路径判断，抛出指定异常信息
        if(StringUtils.hasText(exceptionClassName)){
            if (UnknownAccountException.class.getName().equals(exceptionClassName)) {
                //最终会抛给异常处理器
                model.addAttribute("P_EXCEPTION","账号不存在");
            } else if (IncorrectCredentialsException.class.getName().equals(
                    exceptionClassName)) {
                model.addAttribute("P_EXCEPTION","用户名/密码错误");
            } else if("randomCodeError".equals(exceptionClassName)){
                model.addAttribute("P_EXCEPTION","验证码错误");
            }else if(LockedAccountException.class.getName().equals(exceptionClassName)){
                model.addAttribute("P_EXCEPTION", "账号已被锁定，请与系统管理员联系!");
            }else if(AuthenticationException.class.getName().equals(exceptionClassName)){
                model.addAttribute("P_EXCEPTION", "您没有授权！");
            }else {
                model.addAttribute("P_EXCEPTION", "未知异常！");
            }
        }
        //此方法不处理登陆成功（认证成功），shiro认证成功会自动跳转到上一个请求路径
        //登陆失败还到login页面
        return "login";
    }

    /**
     * 用户登陆
     */
    @RequestMapping("/ajax/login")
    @ResponseBody
    public Object ajaxLogin(String username,String password,boolean rememberMe,
                            HttpServletRequest request,HttpServletResponse response) {
        //根据shiro返回的异常类路径判断，抛出指定异常信息
        String url = request.getContextPath() + "/login.html";
        Subject currentUser = SecurityUtils.getSubject();
        if (!currentUser.isAuthenticated()) {
            UsernamePasswordToken token = new UsernamePasswordToken(username, password);
            token.setRememberMe(rememberMe);

            try{
                currentUser.login(token);
            }catch(UnknownAccountException ex){
                ResponseMessageUtils.xmlCDataOut(response, "账号不存在！", url);
                return null;
            }catch(IncorrectCredentialsException ex){
                ResponseMessageUtils.xmlCDataOut(response, "密码错误！", url);
                return null;
            }catch(LockedAccountException ex){
                ResponseMessageUtils.xmlCDataOut(response, "账号已被锁定，请与系统管理员联系！", url);
                return null;
            }catch(AuthenticationException ex){
                ResponseMessageUtils.xmlCDataOut(response, "您没有授权！", url);
                return null;
            }
        }
        ResponseMessageUtils.xmlCDataOut(response, "登录成功！", request.getContextPath() + "/home.html");
        //返回json数据
        return null;
    }

    /**
     * 拒绝访问
     * @return
     */
    @RequestMapping("refuse")
    public String refuse(){
        return "refuse";
    }

    @RequestMapping("forget_password")
    public String forgetPassword(HttpServletRequest request){
        TokenUtils.getInstance().saveToken(request);
        return "forget_password";
    }

    @RequestMapping("/find_password")
    @ResponseBody
    public Object findPassword(String username,
            String email,
            HttpServletRequest request,
            HttpServletResponse response) {
        String url = request.getContextPath() + "/forget_password.html";
        if (!TokenUtils.getInstance().verifyToken(request)) {
            ResponseMessageUtils.xmlCDataOut(response, "你已提交了用户数据！", url);
        }else if (!validationCodeServlet.isCaptcha(request)) {
            ResponseMessageUtils.xmlCDataOut(response, "验证码错误！", url);
        }else if(memberService.checkLoginName(username)){
            ResponseMessageUtils.xmlCDataOut(response, "系统没有此用户！", url);
        }else if(memberService.checkLoginNameByEmail(username,email)){
            ResponseMessageUtils.xmlCDataOut(response, "该用户没有注册此电子邮件！", url);
        }else {
            try {
                memberService.sendEmailFindPassword(username, email);
            }catch (Exception e){
                ResponseMessageUtils.xmlCDataOut(response, "邮件发送失败，请联系管理员！", url);
            }
            ResponseMessageUtils.xmlCDataOut(response, "邮件发送成功！", request.getContextPath() + "/login.html");
        }
        return null;
    }

    @RequestMapping(value="/password/update",method = RequestMethod.GET)
    public String passwordUpdatePage(String key,Model model,HttpServletRequest request){
        TokenUtils.getInstance().saveToken(request);
        model.addAttribute("P_KEY",key);
        return "password_update";
    }

    @RequestMapping(value="/password/update" ,method = RequestMethod.POST)
    @ResponseBody
    public String passwordUpdate(String key,
                                 String password,
                                 String password_confirm,
                                 HttpServletRequest request,HttpServletResponse response){
        TokenUtils.getInstance().saveToken(request);
        String url = request.getContextPath() + "/password/update.html?key="+key;
        if(!password.equals(password_confirm)){
            ResponseMessageUtils.xmlCDataOut(response, "两次密码输入不一样，请检查！", url);
        }
        if (!validationCodeServlet.isCaptcha(request)) {
            ResponseMessageUtils.xmlCDataOut(response, "验证码错误！", url);
        }
        try{
            memberService.updatePassword(key,password);
        }catch (Exception e){
            ResponseMessageUtils.xmlCDataOut(response, e.getMessage(), url);
        }
        ResponseMessageUtils.xmlCDataOut(response, "密码修改成功，请登陆！", request.getContextPath() + "/login.html");
        return null;
    }
}

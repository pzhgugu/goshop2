package org.goshop.manager.controller;

import org.goshop.manager.utils.Jump;
import org.goshop.shiro.service.ShiroConfig;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.UnknownAccountException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
public class LoginController {
    /**
     * 用户登陆
     */
    @RequestMapping("/login")
    public String login(Model model,HttpServletRequest request) {
        //如果登陆失败从request中获取认证异常信息，shiroLoginFailure就是shiro异常类的全限定名
        String exceptionClassName = (String) request.getAttribute(ShiroConfig.shiroLoginFailure);
        //根据shiro返回的异常类路径判断，抛出指定异常信息
        if(StringUtils.hasText(exceptionClassName)){
            String returnUrl= request.getContextPath() + "/login";
            if (UnknownAccountException.class.getName().equals(exceptionClassName)) {
                //最终会抛给异常处理器
                return Jump.get(returnUrl, "账号不存在!");
            } else if (IncorrectCredentialsException.class.getName().equals(
                    exceptionClassName)) {
                return Jump.get(returnUrl, "用户名/密码错误!");
            } else if("randomCodeError".equals(exceptionClassName)){
                return Jump.get(returnUrl, "验证码错误!");
            }else if(LockedAccountException.class.getName().equals(exceptionClassName)){
                return Jump.get(returnUrl, "账号已被锁定，请与系统管理员联系!");
            }else if(AuthenticationException.class.getName().equals(exceptionClassName)){
                return Jump.get(returnUrl, "您没有授权！");
            }else {
                return Jump.get(returnUrl, "未知异常！");
            }

        }
        //此方法不处理登陆成功（认证成功），shiro认证成功会自动跳转到上一个请求路径
        //登陆失败还到login页面
        return "login";
    }

    /**
     * 拒绝访问
     * @return
     */
    @RequestMapping("refuse")
    public String refuse(){
        return "refuse";
    }
}

package org.goshop.shiro.service;

import org.goshop.common.context.ValidationCodeServlet;
import org.goshop.users.i.UserService;
import org.goshop.users.pojo.User;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.filter.authc.FormAuthenticationFilter;
import org.springframework.beans.factory.annotation.Autowired;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

/**
 * Created by Administrator on 2016/3/22.
 */
public class CustomFormAuthenticationFilter extends FormAuthenticationFilter {

    @Autowired
    UserService userService;

    @Autowired
    ValidationCodeServlet validationCodeServlet;

    //原FormAuthenticationFilter的认证方法
    @Override
    protected boolean onAccessDenied(ServletRequest request,
                                     ServletResponse response) throws Exception {
        //在这里进行验证码的校验
        HttpServletRequest httpServletRequest = (HttpServletRequest) request;
        if(!validationCodeServlet.isCaptcha(httpServletRequest)){
            //如果校验失败，将验证码错误失败信息，通过shiroLoginFailure设置到request中
            httpServletRequest.setAttribute(ShiroConfig.shiroLoginFailure, "randomCodeError");
            //拒绝访问，不再校验账号和密码
            return true;
        }
        return super.onAccessDenied(request, response);
    }

    @Override
    protected boolean onLoginSuccess(AuthenticationToken token, Subject subject, ServletRequest request, ServletResponse response) throws Exception {
        User user= (User) subject.getPrincipal();
        String ip=request.getRemoteAddr();
        userService.updateLoginInfo(user,ip);

        //删除上次链接
        Session session = subject.getSession();
        session.removeAttribute("shiroSavedRequest");
        this.issueSuccessRedirect(request, response);
        return false;
    }
}

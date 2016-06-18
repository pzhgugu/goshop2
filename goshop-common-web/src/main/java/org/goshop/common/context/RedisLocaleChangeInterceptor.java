package org.goshop.common.context;

import org.goshop.common.utils.SerializeUtils;
import org.goshop.common.web.utils.RequestUtils;
import org.goshop.redis.service.JedisClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;
import org.springframework.web.servlet.support.RequestContextUtils;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Locale;

/**
 * Created by Administrator on 2016/5/6.
 */
public class RedisLocaleChangeInterceptor extends HandlerInterceptorAdapter {

    public static final String DEFAULT_PARAM_NAME = "locale";
    private String paramName = "locale";

    @Autowired
    JedisClient jedisClient;

    private String PREFIX = "LOCALE_REDIS_";

    public RedisLocaleChangeInterceptor() {
    }

    public void setParamName(String paramName) {
        this.paramName = paramName;
    }

    public String getParamName() {
        return this.paramName;
    }

    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws ServletException {
        String newLocale = request.getParameter(this.paramName);
        if(newLocale==null) {
            newLocale = this.getLocale(request);
        }
        if(StringUtils.hasText(newLocale)) {
            this.setLocale(request, response, newLocale);
        }
        Locale locale = new SessionLocaleResolver().resolveLocale(request);
        request.setAttribute("S_LANG",locale.getLanguage());
        String queryString= RequestUtils.dislodgeParam(request, DEFAULT_PARAM_NAME);
        request.setAttribute("S_QS",queryString);
        return true;
    }

    private void setLocaleResolver(HttpServletRequest request, HttpServletResponse response,String locale){
        LocaleResolver localeResolver = RequestContextUtils.getLocaleResolver(request);
        if(localeResolver == null) {
            throw new IllegalStateException("No LocaleResolver found: not in a DispatcherServlet request?");
        }

        localeResolver.setLocale(request, response, StringUtils.parseLocaleString(locale));
    }
    private String getLocale(HttpServletRequest request) {
        byte[] k = SerializeUtils.serialize(PREFIX + request.getSession().getId());
        byte[] rawValue =jedisClient.get(k);
        return (String) SerializeUtils.deserialize(rawValue);
    }

    public void setLocale(HttpServletRequest request,HttpServletResponse response,String locale) {
        this.setLocaleResolver(request, response, locale);
        jedisClient.set(SerializeUtils.serialize(PREFIX + request.getSession().getId()), SerializeUtils.serialize(locale));
    }
}

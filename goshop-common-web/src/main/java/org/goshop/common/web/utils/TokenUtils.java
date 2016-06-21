package org.goshop.common.web.utils;

import sun.misc.BASE64Encoder;

import javax.servlet.http.HttpServletRequest;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Random;

/**
 * Created by Administrator on 2016/3/16.
 */
public class TokenUtils {

    private TokenUtils(){}
    private static final TokenUtils token = new TokenUtils();

    /**
     * 页面上表单要生成的表单隐藏域
     */
    public static final String TOKEN="S_TOKEN";

    public static TokenUtils getInstance(){
        return token;
    }

    /**
     * 显示页面时生成toke
     * @param request
     */
    public void saveToken(HttpServletRequest request){
        String token = System.currentTimeMillis()+new Random().nextInt()+"";    //随机的值
        try {
            MessageDigest md = MessageDigest.getInstance("md5");        //注意下面的处理方式
            byte[] md5 = md.digest(token.getBytes());
            token = new BASE64Encoder().encode(md5); //base64编码
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }
        request.getSession().setAttribute(TOKEN,token);
        request.setAttribute(TOKEN,token);
    }

    /**
     * 验证toke，并删除toke
     * @param request true 验证通过 false 不通过
     * @return
     */
    public boolean verifyToken(HttpServletRequest request){
        if (isRepeatSubmit(request)) {
            return false;
        }
        request.getSession(false).removeAttribute(TOKEN);
        return true;
    }


    private boolean isRepeatSubmit(HttpServletRequest request) {
        String serverToken = (String) request.getSession().getAttribute(
                TOKEN);
        if (serverToken == null) {
            return true;
        }
        String clinetToken = request.getParameter(TOKEN);
        if (clinetToken == null) {
            return true;
        }
        if (!serverToken.equals(clinetToken)) {
            return true;
        }
        return false;
    }
}

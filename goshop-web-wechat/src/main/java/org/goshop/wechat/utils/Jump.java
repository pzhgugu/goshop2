package org.goshop.wechat.utils;

/**
 * Created by Administrator on 2016/3/22.
 *
 */
public class Jump {

    public static String get(String returnUrl,String message){
        StringBuffer sb = new StringBuffer("forward:/msg?message="+message+"&returnUrl="+returnUrl);
        return sb.toString();
    }
}

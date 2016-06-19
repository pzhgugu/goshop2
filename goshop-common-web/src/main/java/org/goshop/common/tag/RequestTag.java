package org.goshop.common.tag;

import org.goshop.common.web.utils.RequestUtils;
import freemarker.ext.servlet.HttpRequestHashModel;
import freemarker.template.TemplateMethodModelEx;
import freemarker.template.TemplateModelException;
import org.apache.commons.lang3.StringUtils;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2016/3/29.
 */
public class RequestTag implements TemplateMethodModelEx {

    @Override
    public Object exec(List args) throws TemplateModelException {
        HttpRequestHashModel httpRequestHashModel = (HttpRequestHashModel) args.get(0);
        String pageNumName = args.get(1).toString();
        HttpServletRequest request=httpRequestHashModel.getRequest();
        String url=request.getRequestURL().toString();
        String parameter=rePageUrlParameter(request,pageNumName);
        if(StringUtils.isNoneEmpty(url)){
            if(url.indexOf("?")>-1){
                return url+"&"+parameter+"&"+pageNumName+"=";
            }else if(StringUtils.isNoneEmpty(parameter)){
                return url+"?"+parameter+"&"+pageNumName+"=";
            }else{
                return url+"?"+pageNumName+"=";
            }
        }
        return "";
    }

    /**
     * 获取请求url参数，用于去除分页参数
     * @param request
     * @param reqPageName 分页名称
     * @return
     */
    public static String rePageUrlParameter(HttpServletRequest request ,String reqPageName){

        if(!StringUtils.isNoneEmpty(reqPageName)){
            reqPageName="p";
        }
        String qs = request.getQueryString();
        Map modelMap = RequestUtils.getRequestMap(request);

        Map<String,String> urlParameter=new HashMap();
        if(StringUtils.isNoneEmpty(qs)){
            String[] qsArray = qs.split("&");
            for(String parame:qsArray){
                String[] pArray = parame.split("=");
                if(pArray.length==2){
                    if(!pArray[0].equals(reqPageName)){
                        if(modelMap.containsKey(pArray[0])){
                            urlParameter.put(pArray[0], (String) modelMap.get(pArray[0]));
                        }
                    }
                }
            }
        }

        StringBuffer urlSB= new StringBuffer();
        if(urlParameter.size()>0){
            for(String key:urlParameter.keySet()){
                urlSB.append(key);
                urlSB.append("=");
                urlSB.append(urlParameter.get(key));
                urlSB.append("&");
            }
            return urlSB.substring(0, urlSB.length()-1);
        }
        return "";
    }
}

package org.goshop.common.web.utils;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;

import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

/**
 * 创 建 人：gugu
 * 创建日期：2015-06-08
 * 修 改 人：
 * 修改日 期：
 * 描   述：Request工具类。  
 */
public class RequestUtils {
	
	private static final Logger logger=Logger.getLogger(RequestUtils.class);
	/**
	 * get的数据
	 * 获取HttpServletRequest到MAP
	 * @param request
	 * @return
	 */
	public static Map getRequestMapUnicode(HttpServletRequest request) {
		Map properties = request.getParameterMap();
		// 返回值Map
		Map returnMap = new HashMap();
		Iterator entries = properties.entrySet().iterator();
		Map.Entry entry;
		String name = "";
		String value = "";
		while (entries.hasNext()) {
			entry = (Map.Entry) entries.next();
			name = (String) entry.getKey();
			Object valueObj = entry.getValue();
			if (null == valueObj) {
				value = "";
			} else if (valueObj instanceof String[]) {
				String[] values = (String[]) valueObj;
				for (int i = 0; i < values.length; i++) {
					value = values[i] + ",";
				}
				value = value.substring(0, value.length() - 1);
			} else {
				value = valueObj.toString();
			}
			try {
                //if("GET".equalsIgnoreCase(request.getMethod())){
                //System.out.print(new String(value.getBytes("iso8859-1"), "UTF-8"));
                //System.out.print(new String(value.getBytes("UTF-8"), "iso8859-1"));
                //System.out.print(new String(value.getBytes("GBK"), "UTF-8"));
                //System.out.print(new String(value.getBytes("UTF-8"), "GBK"));
                //System.out.print(new String(value.getBytes("GBK"), "iso8859-1"));
                ///System.out.print(new String(value.getBytes("iso8859-1"), "GBK"));
					returnMap.put(name, new String(value.getBytes("iso8859-1"), "UTF-8"));
				//}else{
				//	returnMap.put(name, value);
				//}
			} catch (UnsupportedEncodingException e) {
				//throw new PageErrorMessageException("HttpServletRequest转换字符出错！");
			}
		}
		return returnMap;

	}

    public static Map getRequestMap(HttpServletRequest request) {
        Map properties = request.getParameterMap();
        // 返回值Map
        Map returnMap = new HashMap();
        Iterator entries = properties.entrySet().iterator();
        Map.Entry entry;
        String name = "";
        String value = "";
        while (entries.hasNext()) {
            entry = (Map.Entry) entries.next();
            name = (String) entry.getKey();
            Object valueObj = entry.getValue();
            if (null == valueObj) {
                value = "";
            } else if (valueObj instanceof String[]) {
                String[] values = (String[]) valueObj;
                for (int i = 0; i < values.length; i++) {
                    value = values[i] + ",";
                }
                value = value.substring(0, value.length() - 1);
            } else {
                value = valueObj.toString();
            }

            returnMap.put(name, value);
        }
        return returnMap;

    }

    public static String getFullURL(HttpServletRequest request) {

        StringBuffer url = request.getRequestURL();
        if (request.getQueryString() != null) {
            url.append("?");
            url.append(request.getQueryString());
        }
        return url.toString();
    }
    /**
     * 获得IP地址：如：127.0.0.1
     * @param request
     * @return
     */
    public static String getIP(HttpServletRequest request) {
        String ip = request.getHeader("x-forwarded-for");
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("WL-Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getRemoteAddr();
        }
        return ip;
    }

    /**
     * 获得IP地址：如：127.0.0.1
     * @param request
     * @return
     */
    public static String getIPEx(HttpServletRequest request) {
        String ip = request.getHeader("x-forwarded-for");
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("WL-Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("X-Forwarded-For");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("X-Forwarded-Server");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("X-Forwarded-Host");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getRemoteAddr();
        }
        return ip;
    }

    /**
     * 获得URL地址：如：/show
     * @param request
     * @return
     */
    public static String getSiteURL(HttpServletRequest request) {
        /*StringBuffer url_buffer = request.getRequestURL();
        String name=request.getContextPath();
        if(StringUtils.hasText(url_buffer)&&!("eb_sales_pool".equals(url_buffer))&&StringUtils.hasText(name)){
            StringBuffer url=new StringBuffer();
            url.append(url_buffer.subSequence(0, url_buffer.indexOf(name) + name.length()));
            return url.toString();
        }else{
            return (String)SystemVariable.get("S_URL");
        }*/
        return request.getContextPath();
    }

    /**
     * 获得URL地址：如：http://127.0.0.1:8080/show
     * @param request
     * @return
     */
    public static String getSiteURLEx(HttpServletRequest request) {
        StringBuffer url_buffer = request.getRequestURL();
        String name=request.getContextPath();

        StringBuffer url=new StringBuffer();
        url.append(url_buffer.subSequence(0, url_buffer.indexOf(name) + name.length()));
        //url.append("/");
        return url.toString();

    }
    
    /**
     * /att/a.jsp
     * @param request
     * @return
     */
    public static String getServletPath(HttpServletRequest request) {
    	return request.getServletPath();

    }

    /**
     * 获得URL地址：如：http://127.0.0.1:8080/
     * @param request
     * @return
     */
    public static String getServiceURL(HttpServletRequest request) {
        StringBuffer url_buffer = request.getRequestURL();
        String name=request.getContextPath();

        StringBuffer url=new StringBuffer();
        url.append(url_buffer.subSequence(0, url_buffer.indexOf(name)));
        //url.append("/");
        return url.toString();

    }
    /**
     * 判断是否为ajax请求
     * @param request
     * @return
     */
    public static boolean isAjaxRequest(HttpServletRequest request) {
        if(request.getParameterMap().containsKey("inajax")){
            if(request.getParameter("inajax").equals("1")){
                return true;
            }
        }
    	 return "XMLHttpRequest".equals(request.getHeader("X-Requested-With"));
    }
    /**
     * 获取请求url参数，用于去除分页参数
     * @param request
     * @param reqPageName 分页名称
     * @return
     */
    public static String rePageUrlParame(HttpServletRequest request ,String reqPageName){
    	
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
	
    /**
     * 获取请求url参数，用于去除分页参数
     * @param request
     * @param reqPageName 分页名称
     * @return
     */
    public static String getPageUrlParame(HttpServletRequest request ,String reqPageName,String url){
        String parame = rePageUrlParame(request, reqPageName);
    	if(StringUtils.isNoneEmpty(url)){
    		if(url.indexOf("?")>-1){
    			return url+"&"+parame+"&"+reqPageName+"=";
    		}else if(StringUtils.isNoneEmpty(parame)){
    			return url+"?"+parame+"&"+reqPageName+"=";
    		}else{
    			return url+"?"+reqPageName+"=";
    		}
    	}
    	return parame;
    }

    /**
     * 去除给定参数
     * @param request
     * @param defaultParamName
     * @return
     */
    public static String dislodgeParam(HttpServletRequest request, String defaultParamName) {
        String qs = request.getQueryString();
        if(StringUtils.isNoneEmpty(qs)) {
            Map<String, String> urlParameter = new HashMap();
            String[] qsArray = qs.split("&");
            for (String parame : qsArray) {
                String[] pArray = parame.split("=");
                if (pArray.length == 2) {
                    if (!pArray[0].equals(defaultParamName)) {
                        urlParameter.put(pArray[0], pArray[1]);
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
        }
        return null;
    }
}

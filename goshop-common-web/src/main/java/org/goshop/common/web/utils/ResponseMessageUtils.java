package org.goshop.common.web.utils;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.goshop.common.pojo.ErrorMessage;
import org.springframework.util.StringUtils;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * 创 建 人：gugu
 * 创建日期：2015-06-08
 * 修 改 人：
 * 修改日 期：
 * 描   述：Response工具类。  
 */
public class ResponseMessageUtils {

	public static void print(HttpServletResponse response,String context){
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		out.print(context);
		out.flush();
		out.close();
	}
	/**
	 * 返回ajax消息
	 * @param response
	 * @param content
	 */
	public static void returnAjaxMessage(HttpServletResponse response,String content,int code){
		response.setCharacterEncoding("UTF-8");
    	String result = null;
    	ErrorMessage message = new ErrorMessage();
		message.setCode(code);
		message.setMessage(content);
		ObjectMapper objectMapper = new ObjectMapper();

		try {
			result = objectMapper.writeValueAsString(message);
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			PrintWriter writer = response.getWriter();
			writer.write(result);
			writer.flush();
			writer.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static void textPlainResponse(HttpServletResponse response,String context ){
		response.reset();
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/plain;charset=UTF-8");

        PrintWriter writer = null;
        try {
            writer = response.getWriter();
			if(StringUtils.hasText(context)){
				writer.print(context);
			}else {
				writer.print("{}");
			}
            writer.flush();
        } catch (IOException e) {
        } finally {
            if (writer != null) {
                writer.close();
            }
        }
	}

	/**
	 *
	 * @param response
	 * @param content 提示内容
	 * @param url 跳转url
	 */
	public static void xmlCDataOut(HttpServletResponse response, String content,String url) {
		response.setContentType("text/xml; charset=UTF-8");
		StringBuffer sb = new StringBuffer();
		sb.append("<?xml version=\"1.0\" encoding=\"UTF-8\" ?>");
		sb.append("<root>");
		sb.append("<![CDATA[").append(returnShowDialog(content,url)).append("]]>");
		sb.append("</root>");
		print(response, sb.toString());
	}

	public static void xmlCDataOut(HttpServletResponse response, String content) {
		response.setContentType("text/xml; charset=UTF-8");
		StringBuffer sb = new StringBuffer();
        sb.append("<?xml version=\"1.0\" encoding=\"UTF-8\" ?>");
        sb.append("<root>");
        sb.append("<![CDATA[").append(content).append("]]>");
        sb.append("</root>");
        print(response, sb.toString());
	}

	public static String script(String content) {
		StringBuffer sb = new StringBuffer();
		sb.append("<script type=\"text/javascript\" reload=\"1\">");
		sb.append(content);
		sb.append("</script>");
		return sb.toString();
	}

	public static String showDialog(String name,String url){
		StringBuffer sb = new StringBuffer();
		sb.append("showDialog('");
		sb.append(name);
		sb.append("', 'succ', null, function (){window.location.href ='");
		sb.append(url);
		sb.append("'}, 0, null, null, null, null, 2, null);CUR_DIALOG.close();");
		return sb.toString();
	}

	public static String returnShowDialog(String name, String url) {
		StringBuffer sb = new StringBuffer();
		sb.append(name);
		sb.append(script(showDialog(name, url)));
		return sb.toString();
	}

	public static String showErrorDialog(String name){
		StringBuffer sb = new StringBuffer();
		sb.append("showDialog('");
		sb.append(name);
		sb.append("', 'alert', null, null, 1, null, null, null, null, 2, null);");
		return sb.toString();
	}

	public static String returnErrorShowDialog(String name) {
		StringBuffer sb = new StringBuffer();
		sb.append(name);
		sb.append(script(showErrorDialog(name)));
		return sb.toString();
	}

}

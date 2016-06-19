package org.goshop.common.web.utils;

import org.goshop.common.exception.FileException;
import org.springframework.util.StringUtils;

import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

/**
 * 创 建 人：gugu
 * 创建日期：2015-05-25
 * 修 改 人：
 * 修改日 期：
 * 描   述：下载工具类。  
 */
public class DownloadUtils {

    //private static Map<String,String> contentTypeMap = null;

    public static void download(HttpServletResponse response, File file, String inline,String fileName) {
        BufferedInputStream br = null;
        try {
            br = new BufferedInputStream(new FileInputStream(file));
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
        byte[] buf = new byte[1024];
        int len = 0;

        response.reset(); // 非常重要
        if (!StringUtils.hasText(inline)) {
            inline = "attachment";
        }
        response.setContentType(getContentType(file.getPath()));
        if(!StringUtils.hasText(fileName)){
            fileName=file.getName();
        }else{
            String s=file.getPath();
            String s1=s.substring(s.indexOf(".") + 1, s.length());
            if(StringUtils.hasText(s1)){
                fileName=fileName+"."+s1;
            }
        }
        try {
            fileName = URLEncoder.encode(fileName, "UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        if (inline!=null&&inline.equals("1")) { // 在线打开方式
            response.setHeader("Content-Disposition", "inline; filename=" + fileName + ";");
            // 文件名应该编码成UTF-8
        } else { // 纯下载方式
            response.setHeader("Content-Disposition", "attachment; filename=" + fileName + ";");
        }
        OutputStream out = null;
        try {
            out = response.getOutputStream();
            while ((len = br.read(buf)) > 0)
                out.write(buf, 0, len);
            br.close();
            out.flush();
            out.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static String getContentType(String sPath) {
        Path path = Paths.get(sPath);
        String contentType = null;
        try {
            contentType = Files.probeContentType(path);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return contentType;
    }

    public static void download(HttpServletResponse response, String filePath, String inline,String fileName) {
        File file = new File(filePath);
        //如果dir对应的文件不存在，或者不是一个目录
        if (!file.exists()) {
            throw new FileException("文件不存在，请检查！");
        }
        download(response, file, inline,fileName);
    }

    public static void download(HttpServletResponse response, String filePath,String fileName) {
        File file = new File(filePath);
        //如果dir对应的文件不存在，或者不是一个目录
        if (!file.exists()) {
            throw new FileException("文件不存在，请检查！");
        }
        download(response, file, "0",fileName);
    }
   

   /* public static String getContentType(String type){
        if(contentTypeMap==null){
    		contentTypeMap = new HashMap<String, String>();
    		contentTypeMap.put("xls", "application/vnd.ms-excel");
    		contentTypeMap.put("xlsx", "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
    		contentTypeMap.put("pdf", "application/pdf");
    		contentTypeMap.put("htm", "text/html");
    		contentTypeMap.put("html", "text/html");
    	}
    	if(contentTypeMap.containsKey(type)){
    		return contentTypeMap.get(type);
    	}
		return "application/octet-stream";
    }*/
}

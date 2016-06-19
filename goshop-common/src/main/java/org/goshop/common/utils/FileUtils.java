package org.goshop.common.utils;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Formatter;

/**
 * 创 建 人：gugu
 * 创建日期：2015-05-25
 * 修 改 人：
 * 修改日 期：
 * 描   述：文件操作工具类。  
 */
public class FileUtils {

	/**
	 * 获取文件类型
	 * @param fileName
	 * @return
	 */
	public static String getFileType(String fileName){
		int i = fileName.lastIndexOf(".");
        return fileName.substring(i+1);
	}
	
	/** 
	 *  根据路径删除指定的目录或文件，无论存在与否 
	 *@param sPath  要删除的目录或文件 
	 *@return 删除成功返回 true，否则返回 false。 
	 */  
	public static boolean DeleteFolder(String sPath) {  
	    boolean flag = false;  
	    File file = new File(sPath);  
	    // 判断目录或文件是否存在  
	    if (!file.exists()) {  // 不存在返回 false  
	        return flag;  
	    } else {  
	        // 判断是否为文件  
	        if (file.isFile()) {  // 为文件时调用删除文件方法  
	            return deleteFile(sPath);  
	        } else {  // 为目录时调用删除目录方法  
	            return deleteDirectory(sPath);  
	        }  
	    }  
	}  
	
	/** 
	 * 删除单个文件 
	 * @param   sPath    被删除文件的文件名 
	 * @return 单个文件删除成功返回true，否则返回false 
	 */  
	public static boolean deleteFile(String sPath) {  
	    boolean flag = false;  
	    File file = new File(sPath);  
	    // 路径为文件且不为空则进行删除  
	    if (file.isFile() && file.exists()) {  
	        file.delete();  
	        flag = true;  
	    }  
	    return flag;  
	}  
	
	/** 
	 * 删除目录（文件夹）以及目录下的文件 
	 * @param   sPath 被删除目录的文件路径 
	 * @return  目录删除成功返回true，否则返回false 
	 */  
	public static boolean deleteDirectory(String sPath) {  
	    //如果sPath不以文件分隔符结尾，自动添加文件分隔符  
	    if (!sPath.endsWith(File.separator)) {  
	        sPath = sPath + File.separator;  
	    }  
	    File dirFile = new File(sPath);  
	    //如果dir对应的文件不存在，或者不是一个目录，则退出  
	    if (!dirFile.exists() || !dirFile.isDirectory()) {  
	        return false;  
	    }  
	    boolean flag = true;  
	    //删除文件夹下的所有文件(包括子目录)  
	    File[] files = dirFile.listFiles();  
	    for (int i = 0; i < files.length; i++) {  
	        //删除子文件  
	        if (files[i].isFile()) {  
	            flag = deleteFile(files[i].getAbsolutePath());  
	            if (!flag) break;  
	        } //删除子目录  
	        else {  
	            flag = deleteDirectory(files[i].getAbsolutePath());  
	            if (!flag) break;  
	        }  
	    }  
	    if (!flag) return false;  
	    //删除当前目录  
	    if (dirFile.delete()) {  
	        return true;  
	    } else {  
	        return false;  
	    }  
	} 
	/**
	 * 创建文件
	 * @param sPath
	 * @return
	 * @throws IOException
	 */
	public static  boolean createNewFile(String sPath) throws IOException{
		File file = new File(sPath);
	    // 判断目录或文件是否存在 ,不存在创建文件夹
		if(!file.getParentFile().exists()){
			file.getParentFile().mkdirs();
		}

		if(!file.exists()){
			file.createNewFile();
		}

		return false;
	}
	/**
	 * 写文件
	 * @param sPath
	 * @param content
	 * @return
	 * @throws IOException
	 */
	public static boolean write(String sPath,String content) throws IOException{
		createNewFile(sPath);
		FileOutputStream out = null; 
    	Writer  osw=null;
    	try {
    		out=new FileOutputStream(sPath);
    		osw=new OutputStreamWriter(out,"UTF-8");
    		osw.write(content);
    	} catch (Exception e) {
			e.printStackTrace();
			return false;
		}finally {
            if (out != null||osw!=null) {
                try {
                	osw.close();
                	out.close();
                } catch (IOException e2) {
                    // TODO 自动生成 catch 块
                    e2.printStackTrace();
                }
            }
        }
		return true;
		
	}
	/**
	 * 读取文本文件
	 * @param sPath
	 * @return
	 */
	public static String readFile(String sPath){
		File file = new File(sPath);  
	    // 判断目录或文件是否存在  
	    if (!file.exists()) { 
	    	return null;
	    }
	    String read;
        InputStreamReader fileread;
        BufferedReader bufread;
        StringBuffer content=new StringBuffer();
        try {
        	fileread=new InputStreamReader(new FileInputStream(file),"UTF-8");
            bufread = new BufferedReader(fileread);
            try {
                while ((read = bufread.readLine()) != null) {
                	content.append(read);
                	content.append("\r\n");
                    //readStr = readStr + read+ "\r\n";
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        } catch (Exception e) {
            e.printStackTrace();
        } 

        return content.toString();
	}
	
	public static String readClassLoaderFile(String sPath,Class clazz){
		Formatter out=new Formatter();
		BufferedReader in = null;
        try {
            in = new BufferedReader(new InputStreamReader(
            		clazz.getClassLoader().getResourceAsStream(sPath)));
            String line;
            while ((line = in.readLine()) != null) {
                out.format("%s%n", line);
            }
        } catch (IOException e) {
            throw new IllegalStateException("Reading standard css", e);
        } finally {
            if (in != null) {
                try {
                    in.close();
                } catch (IOException e) {
                    throw new IllegalStateException("Reading standard css", e);
                }
            }
        }
		return out.toString();
	}
	
	public static void saveFile(InputStream stream,String path) throws IOException {
		 //得到图片的二进制数据，以二进制封装得到数据，具有通用性  
        byte[] data = readInputStream(stream);  
        //new一个文件对象用来保存图片，默认保存当前工程根目录  
        File file = new File(path);  
        if(!file.getParentFile().exists()){
        	file.getParentFile().mkdirs();
		}
        //创建输出流  
        FileOutputStream outStream = new FileOutputStream(file);  
        //写入数据  
        outStream.write(data);  
        //关闭输出流  
        outStream.close();     
    }

	public static void inputstreamtofile(InputStream stream,File file) throws IOException {
		//得到图片的二进制数据，以二进制封装得到数据，具有通用性
		byte[] data = readInputStream(stream);
		//创建输出流
		FileOutputStream outStream = new FileOutputStream(file);
		//写入数据
		outStream.write(data);
		//关闭输出流
		outStream.close();
	}

	public static void saveFile(byte[] buffer,String path) throws Exception
    {      
        //new一个文件对象用来保存图片，默认保存当前工程根目录  
        File imageFile = new File(path);  
        if(!imageFile.getParentFile().exists()){
        	imageFile.getParentFile().mkdirs();
		}
        //创建输出流  
        FileOutputStream outStream = new FileOutputStream(imageFile);  
        //写入数据  
        outStream.write(buffer);  
        //关闭输出流  
        outStream.close();     
    }  
	
	public static byte[] readInputStream(InputStream inStream) throws IOException {
        ByteArrayOutputStream outStream = new ByteArrayOutputStream();  
        //创建一个Buffer字符串  
        byte[] buffer = new byte[1024];  
        //每次读取的字符串长度，如果为-1，代表全部读取完毕  
        int len = 0;  
        //使用一个输入流从buffer里把数据读取出来  
        while( (len=inStream.read(buffer)) != -1 ){  
            //用输出流往buffer里写入数据，中间参数代表从哪个位置开始读，len代表读取的长度  
            outStream.write(buffer, 0, len);  
        }  
        //关闭输入流  
        inStream.close();  
        //把outStream里的数据写入内存  
        return outStream.toByteArray();  
    }

	public static File urlToFile(String url,String fileName) throws IOException {
		URL httpurl = new URL(url);
		HttpURLConnection conn = (HttpURLConnection)httpurl.openConnection();
		//设置超时间为3秒
		conn.setConnectTimeout(3*1000);
		//防止屏蔽程序抓取而返回403错误
		conn.setRequestProperty("User-Agent", "Mozilla/4.0 (compatible; MSIE 5.0; Windows NT; DigExt)");
		//得到输入流
		InputStream inputStream = conn.getInputStream();
		String folder=System.getProperty("java.io.tmpdir");
		StringBuffer sb = new StringBuffer(folder);
		sb.append("/");
		sb.append(fileName);

		File file = new File(sb.toString());
		FileUtils.inputstreamtofile(inputStream,file);
		return file;
	}
}

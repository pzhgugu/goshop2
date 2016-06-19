package org.goshop.common.attachment;

import org.goshop.common.utils.DateTimeUtils;
import org.goshop.common.utils.FileUtils;
import org.goshop.common.web.utils.DownloadUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Date;
import java.util.UUID;

/**
 * Created by Administrator on 2016/3/24.
 */
public class LocalhostAttachmentImpl implements AttachmentService {

    @Value("${FILE_PATH}")
    private String filePath;

    @Override
    public String upload(MultipartFile multipartFile) throws IOException {
        String type = FileUtils.getFileType(multipartFile.getOriginalFilename()).toLowerCase();
        return this.upload(multipartFile.getInputStream(),type);
    }

    @Override
    public String upload(File file,String type) throws Exception  {
        String fileName=this.getFileName(type);
        InputStream in = new FileInputStream(file);
        return this.upload(in,fileName);
    }

    @Override
    public void delete(String id) {
        String filePath=this.getPath()+id;
        FileUtils.deleteFile(filePath);
    }

    private String getFileName(String type) {
        StringBuffer sb = new StringBuffer();
        sb.append("/");
        sb.append(DateTimeUtils.format(new Date(),"yyyy-MM-dd"));
        sb.append("/");
        sb.append(UUID.randomUUID().toString());
        sb.append(".");
        sb.append(type);
        return sb.toString();
    }

    @Override
    public String upload(InputStream inputStream,String type) throws IOException {
        String fileName=this.getFileName(type);
        FileUtils.saveFile(inputStream, filePath + fileName);
        return fileName;
    }

    @Override
    public String getPath() {
        StringBuffer sb = new StringBuffer();
        sb.append(filePath);
        sb.append("/");
        return sb.toString();
    }

    @Override
    public void download(String path, String fileName,HttpServletResponse response) {
        String filePath=this.getPath()+path;
        DownloadUtils.download(response,filePath,fileName);
    }

   @Override
    public File download(String id) {
        String filePath=this.getPath()+id;
        return new File(filePath);
    }

}

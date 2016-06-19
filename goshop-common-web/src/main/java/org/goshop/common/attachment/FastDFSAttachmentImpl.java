package org.goshop.common.attachment;

import org.goshop.common.exception.FileException;
import org.goshop.common.utils.FileUtils;
import org.csource.common.MyException;
import org.csource.common.NameValuePair;
import org.csource.fastdfs.*;
import org.goshop.common.web.utils.JsonUtils;
import org.springframework.util.Assert;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.InetSocketAddress;
import java.util.List;

/**
 * Created by Administrator on 2016/3/24.
 */
public class FastDFSAttachmentImpl implements AttachmentService {

    /**
     * FastDFS服务器地址
     */
    private String hostName;
    /**
     * 端口
     */
    private  Integer port;
    /**
     * 编码
     */
    private String charset;
    /**
     * 超时时间
     */
    private Integer networkTimeout;

    private String http;

    public String getHttp() {
        return http;
    }

    public void setHttp(String http) {
        this.http = http;
    }

    public String getHostName() {
        return hostName;
    }

    public void setHostName(String hostName) {
        this.hostName = hostName;
    }

    public Integer getPort() {
        return port;
    }

    public void setPort(Integer port) {
        this.port = port;
    }

    public String getCharset() {
        return charset;
    }

    public void setCharset(String charset) {
        this.charset = charset;
    }

    public Integer getNetworkTimeout() {
        return networkTimeout;
    }

    public void setNetworkTimeout(Integer networkTimeout) {
        this.networkTimeout = networkTimeout;
    }

    private TrackerServer trackerServer;

    private StorageServer storageServer;

    private StorageClient storageClient;

    public TrackerServer getTrackerServer() {
        return trackerServer;
    }

    public void setTrackerServer(TrackerServer trackerServer) {
        this.trackerServer = trackerServer;
    }

    public StorageServer getStorageServer() {
        return storageServer;
    }

    public void setStorageServer(StorageServer storageServer) {
        this.storageServer = storageServer;
    }

    public StorageClient getStorageClient() {
        return storageClient;
    }

    public void setStorageClient(StorageClient storageClient) {
        this.storageClient = storageClient;
    }

    private  void init(){
        ClientGlobal.setG_charset(charset);
        ClientGlobal.setG_network_timeout(networkTimeout);
        TrackerGroup tg = new TrackerGroup(new InetSocketAddress[]{new InetSocketAddress(hostName, port)});
        TrackerClient tc = new TrackerClient(tg);
        try{
            trackerServer = tc.getConnection();
        }catch (IOException e){
            e.printStackTrace();
            return;
        }
        if(trackerServer!=null){
            try {
                storageServer = tc.getStoreStorage(trackerServer);
            } catch (IOException e) {
                e.printStackTrace();
                return;
            }
        }
        if(storageServer!=null) {
            storageClient = new StorageClient(trackerServer, storageServer);
        }
    }

    @Override
    public String upload(MultipartFile multipartFile) throws IOException {
        String name =multipartFile.getOriginalFilename();
        String type = FileUtils.getFileType(name).toLowerCase();
        return this.upload(multipartFile.getInputStream(),type,name);
    }

    public String upload(InputStream inputStream,String type,String fileName){
        this.init();
        Assert.notNull(storageClient,"文件服务器没有创建成功！");
        byte[] data=null;
        try {
            data = FileUtils.readInputStream(inputStream);
        } catch (IOException e) {
            e.printStackTrace();
            throw new FileException(e.getMessage());
        }
        NameValuePair[] metaList = null;
        /*if(StringUtils.hasText(fileName)){
            metaList=new NameValuePair[1];
            metaList[0] = new NameValuePair("fileName", fileName);
        }*/
        String[] sArray=null;
        try {
            sArray=storageClient.upload_appender_file(data,type,metaList);
        } catch (IOException e) {
            e.printStackTrace();
            throw new FileException(e.getMessage());
        } catch (MyException e) {
            e.printStackTrace();
            throw new FileException(e.getMessage());
        }finally {
            this.close();
        }
        StringBuffer sb = new StringBuffer();
        sb.append(sArray[0]);
        sb.append("-");
        sb.append(sArray[1]);
        return sb.toString();
    }

    @Override
    public String upload(InputStream inputStream,String type) {
        return upload(inputStream,type,null);
    }

    @Override
    public String getPath() {
        return http;
    }

    @Override
    public File download(String path) {
        String[] sArray=path.split("-");
        if(sArray.length==2) {
            StringBuffer url = new StringBuffer(http);
            url.append("/");
            url.append(sArray[0]);
            url.append("/");
            url.append(sArray[1]);
            try {
                int i=sArray[1].lastIndexOf("/");
                String name=sArray[1].substring(i+1,sArray[1].length());
                File file = FileUtils.urlToFile(url.toString(),name);
                return file;
            } catch (Exception e) {
                e.printStackTrace();
            }

        }
        return null;
    }

    @Override
    public void download(String path, String fileName,HttpServletResponse response) {
        String[] sArray=path.split("-");
        if(sArray.length==2) {
            StringBuffer url = new StringBuffer(http);
            url.append("/");
            url.append(sArray[0]);
            url.append("/");
            url.append(sArray[1]);
            try {
                response.sendRedirect(url.toString());
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    @Override
    public String upload(File file,String type) throws Exception {
        InputStream in = new FileInputStream(file);
        return this.upload(in,type);
    }

    @Override
    public void delete(String path) {
        this.init();
        Assert.notNull(storageClient,"文件服务器没有创建成功！");
        List list= JsonUtils.jsonToList(path,String.class);
        if(list.size()==2) {
            String groupName = (String) list.get(0);
            String remoteFilename= (String) list.get(1);
            try {
                storageClient.delete_file(groupName, remoteFilename);
            } catch (IOException e) {
                e.printStackTrace();
                throw new FileException(e.getMessage());
            } catch (MyException e) {
                e.printStackTrace();
                throw new FileException(e.getMessage());
            }finally {
                this.close();
            }
        }
    }

    private void close(){
        if(trackerServer!=null) {
            try {
                trackerServer.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
            trackerServer = null;
        }
        if(storageServer!=null){
            try {
                storageServer.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
            storageServer=null;
        }
        storageClient=null;
    }
}

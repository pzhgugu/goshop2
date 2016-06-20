package org.goshop.wechat.controller;

import org.goshop.common.attachment.AttachmentService;
import org.goshop.common.web.utils.DownloadUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletResponse;
import java.io.File;

@Controller
@RequestMapping("/att")
public class AttachmentController {

    @Autowired
    AttachmentService attachmentService;

    @RequestMapping
    public void download(String path,String inline,String name,HttpServletResponse response) {
        attachmentService.download(path,name,response);
    }

}

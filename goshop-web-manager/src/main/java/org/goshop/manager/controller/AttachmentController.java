package org.goshop.manager.controller;

import org.goshop.common.attachment.AttachmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletResponse;

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

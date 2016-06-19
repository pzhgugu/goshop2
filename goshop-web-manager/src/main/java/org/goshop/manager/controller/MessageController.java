package org.goshop.manager.controller;

import org.goshop.common.context.MessageInfo;
import org.goshop.common.context.MessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping(value =  "/msg")
public class MessageController {

    @Autowired
    MessageService messageService;

    @RequestMapping
    public String Message(String message,
                          String returnUrl,
                          Model model,HttpServletRequest request) {
        if(StringUtils.hasText(message)){
            model.addAttribute("P_MESSAGE", message);
        }else {
            MessageInfo m = messageService.get(request.getSession().getId());
            model.addAttribute("P_MESSAGE", m.getMessage());
            if(StringUtils.hasText( m.getReturnUrl())) {
                model.addAttribute("P_RETURN_URL", m.getReturnUrl());
            }
        }
        if(StringUtils.hasText(returnUrl)) {
            model.addAttribute("P_RETURN_URL", returnUrl);
        }
        return "message";
    }
}

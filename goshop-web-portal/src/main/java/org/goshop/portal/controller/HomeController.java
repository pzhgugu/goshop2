package org.goshop.portal.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/home")
public class HomeController {
    /**
     * 打开首页
     */
    @RequestMapping
    public String index() {
        return "index";
    }


}

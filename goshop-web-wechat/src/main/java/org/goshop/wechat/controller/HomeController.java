package org.goshop.wechat.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * Created by Administrator on 2016/3/11.
 */
@Controller
@RequestMapping
public class HomeController {
    /**
     * 打开首页
     */
    @RequestMapping(value =  "/home")
    public String showIndex(Model model,
                            HttpServletRequest request,
                            HttpServletResponse response) {
        return "home/index";
    }


}

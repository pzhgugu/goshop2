package org.goshop.manager.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/article_lang_type")
public class ArticleLangTypeController {

    @RequestMapping("/{articleClassId}")
    public String list(@PathVariable Long articleClassId, HttpServletRequest request) {
        return "redirect:/article_lang/article_list?type=1&article_state=3&article_class_id="+articleClassId;
    }
}

package com.baoxun.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/usr")

public class text {
    //去后台登陸
    @RequestMapping("/toindex")
    public String tobacklogin(Model model, HttpSession session) {
        return "index";
    }
}

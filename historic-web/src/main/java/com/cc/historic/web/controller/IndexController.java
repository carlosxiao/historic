package com.cc.historic.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

/**
 * @author xiao.mingchen
 */
@Controller
public class IndexController {

    @GetMapping("index")
    public String index() {
        return "index";
    }
}

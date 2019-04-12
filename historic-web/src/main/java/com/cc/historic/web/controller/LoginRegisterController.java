package com.cc.historic.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

/**
 * @author xiao.mingchen
 */
@Controller
public class LoginRegisterController {

    @GetMapping("sign_in")
    public String login() {
        return "sign_in";
    }

    @GetMapping("sign_out")
    public String register() {
        return "sign_out";
    }
}

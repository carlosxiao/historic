package com.cc.historic.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

/**
 * @author xiao
 * 购物车
 */
@Controller
public class ShoppingCartController {

    @GetMapping("cart")
    public String index() {
        return "cart";
    }
}

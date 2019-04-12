package com.cc.historic.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

/**
 * @author xiao
 * 商品类目
 */
@Controller
public class CategoryController {

    @GetMapping("category")
    public String index() {
        return "category";
    }

    @GetMapping("checkout")
    public String checkout() {
        return "checkout";
    }
}

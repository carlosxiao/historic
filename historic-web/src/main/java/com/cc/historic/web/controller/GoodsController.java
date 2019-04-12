package com.cc.historic.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author xiao
 * 商品控制器
 */
@Controller
@RequestMapping("goods")
public class GoodsController {

    @RequestMapping("{id}")
    public String good(@PathVariable() Integer id) {
        return "goods_details";
    }
}

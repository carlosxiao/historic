package com.cc.historic.system.controller;

import com.cc.historic.common.controller.BaseController;
import com.cc.historic.common.model.CodeEnum;
import com.cc.historic.common.model.Result;
import com.cc.historic.system.service.LoginService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

@Api(value = "登录相关")
@Controller
@ControllerAdvice
public class LoginController extends BaseController {

    private final static String ERROR_PATH = "/error";


    @Autowired
    private LoginService loginService;

    @ApiOperation(value = "默认页", httpMethod = "POST")
    @RequestMapping(value = "/index")
    @ResponseBody
    public Result index() {
        return new Result(CodeEnum.INDEX.getCode(), null);
    }

    @ApiOperation(value = "退出", httpMethod = "POST")
    @RequestMapping(value = "/logoutJSON")
    @ResponseBody
    public Result logoutJSON() {
        loginService.logoutJSON();
        return new Result(CodeEnum.SUCCESS.getCode(), null);

    }

    @ApiOperation(value = "容器错误页", httpMethod = "POST")
    @RequestMapping(value = ERROR_PATH)
    @ResponseBody
    public Result getStatus(HttpServletRequest request) {
        return new Result(loginService.getStatus(request), null);
    }


    @ExceptionHandler(value = IllegalArgumentException.class)
    @ResponseBody
    public Result illegalArgumentException(IllegalArgumentException e) {
        return new Result(e.getMessage(), null);
    }

}

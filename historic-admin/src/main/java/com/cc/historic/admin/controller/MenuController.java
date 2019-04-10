package com.cc.historic.admin.controller;

import com.cc.historic.admin.model.AdminUser;
import com.cc.historic.admin.model.Menu;
import com.cc.historic.admin.common.WebResult;
import com.cc.historic.admin.service.MenuService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("admin/menu")
public class MenuController {

	@Autowired
	private MenuService menuService;

	/**
	 * 编辑菜单
	 * @param menu
	 * @return
	 */
	@RequestMapping("edit")
	@ResponseBody
	public WebResult edit(Menu menu, HttpSession session){
		AdminUser loginUser = (AdminUser) session.getAttribute("loginUser");
		boolean isTrue = false;
		if(menu.getId() == 0){
			menu.setCreator(loginUser.getId());
			isTrue = menuService.addMenu(menu);
		}else{
			menu.setUpdateuser(loginUser.getId());
			menu.setUpdatetime(new Date());
			isTrue = menuService.updateMenu(menu);
		}
		if(isTrue){
			return WebResult.success();
		}else{
			return WebResult.unKnown();
		}
	}

	/**
	 * 进入菜单管理页面
	 * @return
	 */
	@RequestMapping("get")
	@ResponseBody
	public WebResult get(){
		return WebResult.success(menuService.selectAll());
	}

	@RequestMapping("delete")
	@ResponseBody
	public WebResult del(int id){
		if(menuService.delete(id)){
			return WebResult.success();
		}
		return WebResult.unKnown();
	}

	@RequestMapping
	public String toMenu(ModelMap map) throws JsonProcessingException {
		List<Menu> menus = menuService.selectAll();
		map.put("treeMenu",menus);
		map.put("menu", new Gson().toJson(menus));
		return "menu";
	}
}

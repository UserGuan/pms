package com.pms.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;
import com.pms.entity.Menu;
import com.pms.service.MenuService;

@Controller
@RequestMapping("menu")
public class MenuController {

	@Autowired
	private MenuService menuService;

	boolean flag = false;
	int i = 0;

	@GetMapping("list/{pageNum}")
	public String find(Model model, @PathVariable Integer pageNum) {
		if (pageNum > 0) {
			PageInfo<Menu> page = menuService.find(pageNum);
			model.addAttribute("page", page);
		}
		return "menu/list";
	}

	@PostMapping("doadd")
	@ResponseBody
	public boolean doadd(Menu menu, HttpServletRequest request) {
		if (menu != null) {
			i = menuService.add(menu);
		}
		if (i > 0) {
			flag = true;
		}
		return flag;
	}

	@RequestMapping("del/{id}")
	@ResponseBody
	public boolean del(@PathVariable int id) {
		if (id > 0) {
			i = menuService.del(id);
		}
		if (i > 0) {
			flag = true;
		}
		return flag;
	}

	@PostMapping("doupdate")
	@ResponseBody
	public boolean doupdate(Menu menu, HttpServletRequest request) {
		if (menu != null) {
			i = menuService.update(menu);
		}
		if (i > 0) {
			flag = true;
		}
		return flag;
	}

	@PostMapping("show/{id}")
	@ResponseBody
	public Menu show(@PathVariable int id) {
		Menu menu = null;
		if (id > 0) {
			menu = menuService.load(id);
		}
		return menu;
	}

}
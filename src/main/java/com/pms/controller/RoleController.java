package com.pms.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;
import com.pms.entity.Menu;
import com.pms.entity.Role;
import com.pms.service.MenuService;
import com.pms.service.RoleService;

@Controller
@RequestMapping("role")
public class RoleController {

	@Autowired
	private RoleService roleService;
	@Autowired
	private MenuService menuService;

	boolean flag = false;
	int i = 0, j = 0;

	@GetMapping("list/{pageNum}")
	public String find(Model model, @PathVariable Integer pageNum) {
		if (pageNum > 0) {
			PageInfo<Role> page = roleService.find(pageNum);
			List<Menu> menus = menuService.list();
			model.addAttribute("menus", menus);
			model.addAttribute("page", page);
		}
		return "role/list";
	}

	@PostMapping("doadd")
	@ResponseBody
	public boolean doadd(Role role, @RequestParam(defaultValue = "-1") int[] menuid) {
		if (role != null) {
			i = roleService.add(role);
		}
		if (menuid[0] == -1) {

		} else {
			roleService.assignMenu(menuid, role.getRole_id());
		}
		if (i > 0) {
			flag = true;
		}
		return flag;
	}
	// 或
//	@PostMapping("doadd")
//	@ResponseBody
//	public boolean doadd(Role role, HttpServletRequest request) {
//		Map<String, String[]> map = request.getParameterMap();
//		Set<String> keys = map.keySet();
//		List<String> str = null;
//		String[] list;
//		for (String k : keys) {
//			if (k.equals("menuid")) {
//				str = new ArrayList<String>();
//				list = map.get(k);
//				for (int j = 0; j < list.length; j++) {
//					str.add(map.get(k)[j]);
//				}
//			}
//		}
//		if (role != null) {
//			i = roleService.add(role);
//		}
//		if (str != null) {
//			roleService.assignMenu(str, role.getRole_id());
//		}
//		if (i > 0) {
//			flag = true;
//		}
//		return flag;
//	}

	@RequestMapping("del/{id}")
	@ResponseBody
	public boolean del(@PathVariable int id) {
		if (id > 0) {
			i = roleService.del(id);
			j = roleService.delRole(id);
		}
		if (i > 0 && j > 0) {
			flag = true;
		}
		return flag;
	}

	@PostMapping("doupdate")
	@ResponseBody
	public boolean doupdate(Role role, @RequestParam(defaultValue = "-1") int[] menuid) {
		if (role != null) {
			i = roleService.update(role);
		}
		if (menuid[0] == -1) {
			j = roleService.delRole(role.getRole_id());
		} else {
			j = roleService.delRole(role.getRole_id());
			roleService.assignMenu(menuid, role.getRole_id());
		}
		if (i > 0 && j > 0) {
			flag = true;
		}
		return flag;
	}
	// 或
//	@PostMapping("doupdate")
//	@ResponseBody
//	public boolean doupdate(Role role, HttpServletRequest request) {
//		Map<String, String[]> map = request.getParameterMap();
//		Set<String> keys = map.keySet();
//		List<String> str = null;
//		String[] list;
//		for (String k : keys) {
//			if (k.equals("menuid")) {
//				str = new ArrayList<String>();
//				list = map.get(k);
//				for (int j = 0; j < list.length; j++) {
//					str.add(map.get(k)[j]);
//				}
//			}
//		}
//		if (role != null) {
//			i = roleService.update(role);
//		}
//		if (str != null) {
//			j = roleService.delRole(role.getRole_id());
//			roleService.assignMenu(str, role.getRole_id());
//		} else if (str == null) {
//			j = roleService.delRole(role.getRole_id());
//		}
//		if (i > 0 && j > 0) {
//			flag = true;
//		}
//		return flag;
//	}

	@PostMapping("show/{id}")
	@ResponseBody
	public Role show(@PathVariable int id) {
		Role role = null;
		if (id > 0) {
			role = roleService.load(id);
		}
		return role;
	}

	@PostMapping("load/{id}")
	@ResponseBody
	public Map<String, Object> load(@PathVariable int id) {
		Map<String, Object> map = new HashMap<String, Object>();
		if (id > 0) {
			Role role = roleService.inload(id);
			List<Integer> menuIds = new ArrayList<Integer>();
			for (Menu menus : role.getMenus()) {
				int menuId = menus.getMenu_id();
				menuIds.add(menuId);
			}
			List<Menu> menu = null;
			if (menuIds.isEmpty()) {
				menu = menuService.list();
			} else {
				menu = roleService.notinload(menuIds);
			}
			map.put("menu", menu);
			map.put("role", role);
		} else {
			map = null;
		}
		return map;
	}

}
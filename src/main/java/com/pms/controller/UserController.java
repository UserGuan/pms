package com.pms.controller;

import com.github.pagehelper.PageInfo;
import com.pms.entity.Menu;
import com.pms.entity.Role;
import com.pms.entity.User;
import com.pms.service.RoleService;
import com.pms.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.*;

@Controller
@RequestMapping("user")
public class UserController {

	@Autowired
	private UserService userService;
	@Autowired
	private RoleService roleService;

	boolean flag = false;
	int i = 0, j = 0;

	@GetMapping("main")
	public String main(Model model, HttpSession session) {
		User user = (User) session.getAttribute("user");
		user = userService.loadUser(user.getId());
		Set<Menu> menus = new HashSet<Menu>();
		for (Role role : user.getRoles()) {
			for (Menu menu : role.getMenus()) {
				menus.add(menu);
			}
		}
		User u = userService.loadToMain(user.getId());
		Set<Role> roles = new HashSet<Role>();
		for (Role role : u.getRoles()) {
			roles.add(role);
		}
		model.addAttribute("roles", roles);
		model.addAttribute("menu", menus);
		return "main";
	}

	@PostMapping("dologin")
	@ResponseBody
	public boolean dologin(User user, HttpSession session) {
		if (user != null) {
			User u = userService.login(user);
			if (u != null) {
				session.setAttribute("user", u);
				flag = true;
			}
		}
		return flag;
	}

	@GetMapping("list/{pageNum}")
	public String find(Model model, @PathVariable Integer pageNum) {
		if (pageNum > 0) {
			PageInfo<User> page = userService.find(pageNum);
			List<Role> role = roleService.list();
			model.addAttribute("role", role);
			model.addAttribute("page", page);
		}
		return "user/list";
	}

	@RequestMapping("del/{id}")
	@ResponseBody
	public boolean del(@PathVariable int id) {
		if (id > 0) {
			i = userService.del(id);
			j = userService.delRole(id);
		}
		if (i > 0 && j > 0) {
			flag = true;
		}
		return flag;
	}

	@PostMapping("show/{id}")
	@ResponseBody
	public User show(@PathVariable int id) {
		User user = null;
		if (id > 0) {
			user = userService.load(id);
		}
		return user;
	}

	@PostMapping("load/{id}")
	@ResponseBody
	public Map<String, Object> load(@PathVariable int id) {
		Map<String, Object> map = new HashMap<String, Object>();
		if (id > 0) {
			User user = userService.inload(id);
			List<Integer> roleIds = new ArrayList<Integer>();
			for (Role roles : user.getRoles()) {
				int roleId = roles.getRole_id();
				roleIds.add(roleId);
			}
			List<Role> role = null;
			if (roleIds.isEmpty()) {
				role = roleService.list();
			} else {
				role = userService.notinload(roleIds);
			}
			map.put("role", role);
			map.put("user", user);
		} else {
			map = null;
		}
		return map;
	}

	@PostMapping("doupdate")
	@ResponseBody
	public boolean doupdate(User user, @RequestParam(defaultValue = "-1") Integer[] roleid) {
		if (user != null) {
			i = userService.update(user);
		}
		if (roleid[0] == -1) {
			j = userService.delRole(user.getId());
		} else {
			j = userService.delRole(user.getId());
			userService.assignRole(roleid, user.getId());
		}
		if (i > 0 && j > 0) {
			flag = true;
		}
		return flag;
	}
	// 或
//	@PostMapping("doupdate")
//	@ResponseBody
//	public boolean doupdate(User user, HttpServletRequest request) {
//		Map<String, String[]> map = request.getParameterMap();
//		Set<String> keys = map.keySet();
//		List<String> str = null;
//		String[] list;
//		for (String k : keys) {
//			if (k.equals("roleid")) {
//				str = new ArrayList<String>();
//				list = map.get(k);
//				for (int j = 0; j < list.length; j++) {
//					str.add(map.get(k)[j]);
//				}
//			}
//		}
//		if (user != null) {
//			i = userService.update(user);
//		}
//		if (str != null) {
//			j = userService.delRole(user.getId());
//			userService.assignRole(str, user.getId());
//		} else if (str == null) {
//			j = userService.delRole(user.getId());
//		}
//		if (i > 0 && j > 0) {
//			flag = true;
//		}
//		return flag;
//	}

	@PostMapping("doadd")
	@ResponseBody
	public boolean doadd(User user, @RequestParam(defaultValue = "-1") Integer[] roleid) {
		if (user != null) {
			i = userService.add(user);
		}
		if (roleid[0] == -1) {

		} else {
			userService.assignRole(roleid, user.getId());
		}
		if (i > 0) {
			flag = true;
		}
		return flag;
	}
	// 或
//	@PostMapping("doadd")
//	@ResponseBody
//	public boolean doadd(User user, HttpServletRequest request) {
//		Map<String, String[]> map = request.getParameterMap();
//		Set<String> keys = map.keySet();
//		List<String> str = null;
//		String[] list;
//		for (String k : keys) {
//			if (k.equals("roleid")) {
//				str = new ArrayList<String>();
//				list = map.get(k);
//				for (int j = 0; j < list.length; j++) {
//					str.add(map.get(k)[j]);
//				}
//			}
//		}
//		if (user != null) {
//			i = userService.add(user);
//		}
//		if (str != null) {
//			userService.assignRole(str, user.getId());
//		}
//		if (i > 0) {
//			flag = true;
//		}
//		return flag;
//	}

	@GetMapping("loginOut")
	public void loginOut(HttpServletRequest request, HttpServletResponse response) {
		try {
			HttpSession session = request.getSession();
			session.invalidate();// 让session失效
			response.sendRedirect(request.getContextPath() + "/login.jsp");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
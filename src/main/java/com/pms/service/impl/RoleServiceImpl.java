package com.pms.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.pms.dao.RoleDao;
import com.pms.entity.Menu;
import com.pms.entity.Role;
import com.pms.service.RoleService;

@Service("roleService")
public class RoleServiceImpl implements RoleService {

	@Autowired
	private RoleDao roleDao;

	@Override
	public Integer add(Role role) {
		return roleDao.add(role);
	}

	@Override
	public Integer del(Integer id) {
		return roleDao.del(id);
	}

	@Override
	public Integer update(Role role) {
		return roleDao.update(role);
	}

	@Override
	public Role load(Integer id) {
		return roleDao.load(id);
	}

	@Override
	public PageInfo<Role> find(Integer pageNum) {
		if (pageNum == null || pageNum < 1) {
			pageNum = 1;// 页码，从1开始
		}
		Integer pageSize = 5;// 每页显示数据
		PageHelper.startPage(pageNum, pageSize);// 指定开始分页
		List<Role> list = roleDao.list();
		PageInfo<Role> page = new PageInfo<Role>(list);
		return page;
	}

	@Override
	public List<Role> list() {
		return roleDao.list();
	}

	@Override
	public Integer assignMenu(int[] menuid, int role_id) {
		Integer i = 0;
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("roleid", role_id);
		for (int str : menuid) {
			map.put("menuid", str);
			i = roleDao.assignMenu(map);
		}
		return i;
	}
	// 或
//	public Integer assignMenu(List<String> str, int role_id) {
//		Integer i = 0;
//		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("roleid", role_id);
//		for (String st : str) {
//			map.put("menuid", st);
//			i = roleDao.assignMenu(map);
//		}
//		return i;
//	}

	@Override
	public Integer delRole(Integer id) {
		return roleDao.delMenu(id);
	}

	@Override
	public Role inload(Integer id) {
		return roleDao.inload(id);
	}

	@Override
	public List<Menu> notinload(List<Integer> menuIds) {
		return roleDao.notinload(menuIds);
	}

}
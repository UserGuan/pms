package com.pms.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.pms.dao.UserDao;
import com.pms.entity.Role;
import com.pms.entity.User;
import com.pms.service.UserService;

@Service("userService")
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDao userDao;

	@Override
	public Integer add(User user) {
		return userDao.add(user);
	}

	@Override
	public Integer del(Integer id) {
		return userDao.del(id);
	}

	@Override
	public Integer update(User user) {
		return userDao.update(user);
	}

	@Override
	public User load(Integer id) {
		return userDao.load(id);
	}

	@Override
	public PageInfo<User> find(Integer pageNum) {
		if (pageNum == null || pageNum < 1) {
			pageNum = 1;// 页码，从1开始
		}
		Integer pageSize = 5;// 每页显示数据
		PageHelper.startPage(pageNum, pageSize);// 指定开始分页
		List<User> list = userDao.list();
		PageInfo<User> page = new PageInfo<User>(list);
		return page;
	}

	@Override
	public User login(User user) {
		return userDao.login(user);
	}

	@Override
	public Integer assignRole(Integer[] roleid, Integer id) {
		Integer i = 0;
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userid", id);
		for (Integer str : roleid) {
			map.put("roleid", str);
			i = userDao.assignRole(map);
		}
		return i;
	}
	// 或
//	public Integer assignRole(List<String> str, Integer id) {
//		Integer i = 0;
//		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("userid", id);
//		for(String st : str) {
//			map.put("roleid", st);
//			i = userDao.assignRole(map);
//		}
//		return i;
//	}

	@Override
	public Integer delRole(Integer id) {
		return userDao.delRole(id);
	}

	@Override
	public User loadUser(Integer id) {
		return userDao.loadUser(id);
	}

	@Override
	public User loadToMain(Integer id) {
		return userDao.loadToMain(id);
	}

	@Override
	public User inload(Integer id) {
		return userDao.inload(id);
	}

	@Override
	public List<Role> notinload(List<Integer> roleIds) {
		return userDao.notinload(roleIds);
	}

	@Override
	public List<User> listJSON() {
		return userDao.list();
	}

}
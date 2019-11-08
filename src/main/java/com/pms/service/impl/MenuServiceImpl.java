package com.pms.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.pms.dao.MenuDao;
import com.pms.entity.Menu;
import com.pms.service.MenuService;

@Service("menuService")
public class MenuServiceImpl implements MenuService {

	@Autowired
	private MenuDao menuDao;

	@Override
	public Integer add(Menu menu) {
		return menuDao.add(menu);
	}

	@Override
	public Integer del(Integer id) {
		return menuDao.del(id);
	}

	@Override
	public Integer update(Menu menu) {
		return menuDao.update(menu);
	}

	@Override
	public Menu load(Integer id) {
		return menuDao.load(id);
	}

	@Override
	public PageInfo<Menu> find(Integer pageNum) {
		if (pageNum == null || pageNum < 1) {
			pageNum = 1;// 页码，从1开始
		}
		Integer pageSize = 5;// 每页显示数据
		PageHelper.startPage(pageNum, pageSize);// 指定开始分页
		List<Menu> list = menuDao.list();
		PageInfo<Menu> page = new PageInfo<Menu>(list);
		return page;
	}

	@Override
	public List<Menu> list() {
		return menuDao.list();
	}

}
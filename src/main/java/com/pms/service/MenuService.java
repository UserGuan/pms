package com.pms.service;

import java.util.List;

import com.github.pagehelper.PageInfo;
import com.pms.entity.Menu;

public interface MenuService {

	// 添加权限信息
	Integer add(Menu menu);

	// 删除权限信息
	Integer del(Integer id);

	// 修改权限信息
	Integer update(Menu menu);

	// 根据id查询权限信息
	Menu load(Integer id);

	// 查询全部权限信息
	List<Menu> list();

	// 分页查询全部权限信息
	PageInfo<Menu> find(Integer pageNum);

}
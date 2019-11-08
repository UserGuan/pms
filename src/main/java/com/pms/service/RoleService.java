package com.pms.service;

import java.util.List;

import com.github.pagehelper.PageInfo;
import com.pms.entity.Menu;
import com.pms.entity.Role;

public interface RoleService {

	// 添加角色信息
	Integer add(Role role);

	// 删除角色信息
	Integer del(Integer id);

	// 修改角色信息
	Integer update(Role role);

	// 根据id查询角色信息
	Role load(Integer id);

	// 查询全部角色信息
	List<Role> list();

	// 分页查询全部角色信息
	PageInfo<Role> find(Integer pageNum);

	// 分配权限
	Integer assignMenu(int[] menuid, int role_id);
	// 或
//	Integer assignMenu(List<String> str, int role_id);

	// 删除权限中间表
	Integer delRole(Integer id);

	// 连接查询权限表和角色表，查询角色已有权限
	Role inload(Integer id);

	// 查询角色未有的权限
	List<Menu> notinload(List<Integer> menuIds);

}
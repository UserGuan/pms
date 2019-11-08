package com.pms.service;

import com.github.pagehelper.PageInfo;
import com.pms.entity.Role;
import com.pms.entity.User;

import java.util.List;

public interface UserService {

	// 添加用户信息
	Integer add(User user);

	// 删除用户信息
	Integer del(Integer id);

	// 修改用户信息
	Integer update(User user);

	// 根据id查询用户信息
	User load(Integer id);

	// 分页查询全部用户信息
	PageInfo<User> find(Integer pageNum);
	
	List<User> listJSON();

	// 登录查询
	User login(User user);

	// 分配角色
	Integer assignRole(Integer[] roleid, Integer id);
	// 或
//	Integer assignRole(List<String> str, Integer id);

	// 删除角色中间表
	Integer delRole(Integer id);

	// 连接查询用户表、角色表、权限表信息
	User loadUser(Integer id);

	// 根据id查询信息用于main主页
	User loadToMain(Integer id);

	// 连接查询用户表和角色表，查询用户已有角色
	User inload(Integer id);

	// 查询用户未有角色
	List<Role> notinload(List<Integer> roleIds);

}
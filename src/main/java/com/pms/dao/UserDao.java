package com.pms.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.pms.entity.Role;
import com.pms.entity.User;

@Repository
public interface UserDao extends BaseDao<User> {

	// 登录查询
	User login(User user);

	// 分配角色
	Integer assignRole(Map<String, Object> map);

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
package com.pms.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.pms.entity.Menu;
import com.pms.entity.Role;

@Repository
public interface RoleDao extends BaseDao<Role> {

	// 删除权限中间表
	Integer delMenu(Integer id);

	// 分配权限
	Integer assignMenu(Map<String, Object> map);

	// 连接查询权限表和角色表，查询角色已有权限
	Role inload(Integer id);

	// 查询角色未有的权限
	List<Menu> notinload(List<Integer> menuIds);

}
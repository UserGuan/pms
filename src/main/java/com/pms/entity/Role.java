package com.pms.entity;

import java.util.Set;

/**
 * @ClassName: Role
 * @Description: 角色实体
 */
public class Role {

	private int role_id;
	private String role_name; // 角色名字
	private String role_description; // 角色描述

	private String roleName; // 角色名称列表
	private String descList; // 角色描述列表
	private String menuNameList; // 权限列表
	private String menuId; // 权限ID
	private String parentId; // 父级ID
	private String menuFlag; // 权限状态

	private Set<Menu> menus; // 父权限列表

	public Role() {
		super();
	}

	public int getRole_id() {
		return role_id;
	}

	public void setRole_id(int role_id) {
		this.role_id = role_id;
	}

	public String getRole_name() {
		return role_name;
	}

	public void setRole_name(String role_name) {
		this.role_name = role_name;
	}

	public String getRole_description() {
		return role_description;
	}

	public void setRole_description(String role_description) {
		this.role_description = role_description;
	}

	public Set<Menu> getMenus() {
		return menus;
	}

	public void setMenus(Set<Menu> menus) {
		this.menus = menus;
	}

	@Override
	public String toString() {
		return "Role [role_id=" + role_id + ", role_name=" + role_name + ", role_description=" + role_description
				+ ", roleName=" + roleName + ", descList=" + descList + ", menuNameList=" + menuNameList + ", menuId="
				+ menuId + ", parentId=" + parentId + ", menuFlag=" + menuFlag + ", menus=" + menus + "]";
	}

	public String getDescList() {
		return descList;
	}

	public void setDescList(String descList) {
		this.descList = descList;
	}

	public String getMenuNameList() {
		return menuNameList;
	}

	public void setMenuNameList(String menuNameList) {
		this.menuNameList = menuNameList;
	}

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public String getMenuId() {
		return menuId;
	}

	public void setMenuId(String menuId) {
		this.menuId = menuId;
	}

	public String getParentId() {
		return parentId;
	}

	public void setParentId(String parentId) {
		this.parentId = parentId;
	}

	public String getMenuFlag() {
		return menuFlag;
	}

	public void setMenuFlag(String menuFlag) {
		this.menuFlag = menuFlag;
	}

}
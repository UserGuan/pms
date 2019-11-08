package com.pms.entity;

import java.util.List;

/**
 * @ClassName: Menu
 * @Description: 权限实体
 */
public class Menu {

	private int menu_id;
	private String menu_name;
	private int parent_id; // 父级id
	private String menu_icon;
	private String menu_url;
	private int menu_flag;

	private String menuNameList; // 权限列表
	private String menuId; // 权限ID
	private String parentId; // 父级ID
	private String menuFlag; // 权限状态

	private List<Menu> submenu; // 子权限列表

	public Menu() {
		super();
	}

	public int getMenu_id() {
		return menu_id;
	}

	public void setMenu_id(int menu_id) {
		this.menu_id = menu_id;
	}

	public String getMenu_name() {
		return menu_name;
	}

	public void setMenu_name(String menu_name) {
		this.menu_name = menu_name;
	}

	public int getParent_id() {
		return parent_id;
	}

	public void setParent_id(int parent_id) {
		this.parent_id = parent_id;
	}

	public String getMenu_icon() {
		return menu_icon;
	}

	public void setMenu_icon(String menu_icon) {
		this.menu_icon = menu_icon;
	}

	public String getMenu_url() {
		return menu_url;
	}

	public void setMenu_url(String menu_url) {
		this.menu_url = menu_url;
	}

	public int getMenu_flag() {
		return menu_flag;
	}

	public void setMenu_flag(int menu_flag) {
		this.menu_flag = menu_flag;
	}

	public List<Menu> getSubmenu() {
		return submenu;
	}

	public void setSubmenu(List<Menu> submenu) {
		this.submenu = submenu;
	}

	@Override
	public String toString() {
		return "Menu [menu_id=" + menu_id + ", menu_name=" + menu_name + ", parent_id=" + parent_id + ", menu_icon="
				+ menu_icon + ", menu_url=" + menu_url + ", menu_flag=" + menu_flag + ", menuNameList=" + menuNameList
				+ ", menuId=" + menuId + ", parentId=" + parentId + ", menuFlag=" + menuFlag + ", submenu=" + submenu
				+ "]";
	}

	public String getMenuNameList() {
		return menuNameList;
	}

	public void setMenuNameList(String menuNameList) {
		this.menuNameList = menuNameList;
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
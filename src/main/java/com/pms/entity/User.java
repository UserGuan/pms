package com.pms.entity;

import java.io.Serializable;
import java.util.List;

/**
 * @ClassName: User
 * @Description: 用户实体
 */
public class User implements Serializable {

	private static final long serialVersionUID = 1L;

	private int id;
	private String username;
	private String password;
	private String phone;
	private String nickname;
	private String email;

	private String roleName; // 角色名称列表
	private String descList; // 角色描述列表

	private List<Role> roles; // 角色列表

	public User() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public List<Role> getRoles() {
		return roles;
	}

	public void setRoles(List<Role> roles) {
		this.roles = roles;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", username=" + username + ", password=" + password + ", phone=" + phone
				+ ", nickname=" + nickname + ", email=" + email + ", roleName=" + roleName + ", descList=" + descList
				+ ", roles=" + roles + "]";
	}

	public String getDescList() {
		return descList;
	}

	public void setDescList(String descList) {
		this.descList = descList;
	}

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

}
package com.kaihuands.po;

import java.util.List;

/*
 * 角色表
 */
public class Role {
	private int id;//主键
	private String roleName;//角色名称
	private List<Permission> permission;
	public List<Permission> getPermission() {
		return permission;
	}
	public void setPermission(List<Permission> permission) {
		this.permission = permission;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getRoleName() {
		return roleName;
	}
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
}

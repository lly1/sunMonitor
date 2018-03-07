package com.kaihuands.po;
/*
 * 角色权限关系表
 */
public class RolePermission {
	private int id;//主键
	private int role_id;//角色主键
	private int permission_id;//权限主键
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getRole_id() {
		return role_id;
	}
	public void setRole_id(int role_id) {
		this.role_id = role_id;
	}
	public int getPermission_id() {
		return permission_id;
	}
	public void setPermission_id(int permission_id) {
		this.permission_id = permission_id;
	}
}

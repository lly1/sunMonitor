package com.kaihuands.po;

import java.util.List;

public class User {//用户表
	private int id;//主键
	private Integer region_id;//区域主键
	private String username;//用户名
	private Region region;//用户名
	private String passwd;//用户密码
	private String name;//用户姓名
	private String address;//用户地址
	private Integer userDTU;//关联DTU
	private Integer Grid;//并网
	private List<Role> role;
	
	public User(){}
	
	public Region getRegion() {
		return region;
	}

	public void setRegion(Region region) {
		this.region = region;
	}

	public List<Role> getRole() {
		return role;
	}

	public void setRole(List<Role> role) {
		this.role = role;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Integer getRegion_id() {
		return region_id;
	}

	public void setRegion_id(Integer regionId) {
		region_id = regionId;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPasswd() {
		return passwd;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Integer getUserDTU() {
		return userDTU;
	}

	public void setUserDTU(Integer userDTU) {
		this.userDTU = userDTU;
	}

	public Integer getGrid() {
		return Grid;
	}

	public void setGrid(Integer grid) {
		Grid = grid;
	};

}

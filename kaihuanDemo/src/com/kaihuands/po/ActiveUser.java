package com.kaihuands.po;

import java.io.Serializable;
import java.util.List;

public class ActiveUser implements Serializable {
	private int id;//主键
	private String regionName;//区域名
	private StringBuffer roleName;//角色名称
	private StringBuffer pName;//权限名称
    private String username;//用户名
	private String passwd;//用户密码
	private String name;//用户姓名
	private String address;//用户地址
	private Integer userDTU;//关联DTU
	private int Grid;//并网
	private String Meter_Power;
	private String Light_Power;
	private String UMng_Power;
	public String getMeter_Power() {
		return Meter_Power;
	}
	public void setMeter_Power(String meterPower) {
		Meter_Power = meterPower;
	}
	public String getLight_Power() {
		return Light_Power;
	}
	public void setLight_Power(String lightPower) {
		Light_Power = lightPower;
	}
	public String getUMng_Power() {
		return UMng_Power;
	}
	public void setUMng_Power(String uMngPower) {
		UMng_Power = uMngPower;
	}
	public StringBuffer getpName() {
		return pName;
	}
	public void setpName(StringBuffer pName) {
		this.pName = pName;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getRegionName() {
		return regionName;
	}
	public void setRegionName(String regionName) {
		this.regionName = regionName;
	}
	public StringBuffer getRoleName() {
		return roleName;
	}
	public void setRoleName(StringBuffer roleName) {
		this.roleName = roleName;
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
	public int getGrid() {
		return Grid;
	}
	public void setGrid(int grid) {
		Grid = grid;
	}
	
}

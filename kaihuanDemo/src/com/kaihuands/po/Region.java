package com.kaihuands.po;
/*
 * 用户区域表
 */
public class Region {
	private int id;//主键
	private String regionName;//区域名
	private Integer regionDTU;//区域DTU
	
	public Region(){}

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

	public Integer getRegionDTU() {
		return regionDTU;
	}

	public void setRegionDTU(Integer regionDTU) {
		this.regionDTU = regionDTU;
	};
}

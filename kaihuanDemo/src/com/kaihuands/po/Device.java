package com.kaihuands.po;

import java.util.Date;

import org.codehaus.jackson.map.annotate.JsonSerialize;
import org.springframework.format.annotation.DateTimeFormat;

import com.kaihuands.controller.JsonDateSerializer;
/*
 * 设备表
 */
public class Device {
	private int id;//主键
	private Integer user_id;//对应用户id
	private String Invert_SN;
	private String Phone;
	private String Place;
	private String Manager;
	private Integer State;
	private Integer isRegisted;
	private Date PlaceTime;
	private Date DtuOnToOffTime;
	private User user;
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getInvert_SN() {
		return Invert_SN;
	}
	public void setInvert_SN(String invert_SN) {
		Invert_SN = invert_SN;
	}
	public String getPhone() {
		return Phone;
	}
	public void setPhone(String phone) {
		Phone = phone;
	}
	public String getPlace() {
		return Place;
	}
	public void setPlace(String place) {
		Place = place;
	}
	public String getManager() {
		return Manager;
	}
	public void setManager(String manager) {
		Manager = manager;
	}
	public Integer getState() {
		return State;
	}
	public void setState(Integer state) {
		State = state;
	}
	public Integer getIsRegisted() {
		return isRegisted;
	}
	public void setIsRegisted(Integer isRegisted) {
		this.isRegisted = isRegisted;
	}
	public Integer getUser_id() {
		return user_id;
	}
	public void setUser_id(Integer user_id) {
		this.user_id = user_id;
	}
	@JsonSerialize(using=JsonDateSerializer.class)
	public Date getPlaceTime() {
		return PlaceTime;
	}
	public void setPlaceTime(Date placeTime) {
		PlaceTime = placeTime;
	}
	@JsonSerialize(using=JsonDateSerializer.class)
	public Date getDtuOnToOffTime() {
		return DtuOnToOffTime;
	}
	public void setDtuOnToOffTime(Date dtuOnToOffTime) {
		DtuOnToOffTime = dtuOnToOffTime;
	}
	
	
}

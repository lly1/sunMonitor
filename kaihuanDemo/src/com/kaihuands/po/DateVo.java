package com.kaihuands.po;

import java.util.Date;

import org.codehaus.jackson.map.annotate.JsonSerialize;

import com.kaihuands.controller.JsonDateSerializer;

/*
 * 根据时间进行数据查询的包装类
 * 用来存放前端页面传递过来的参数
 */
public class DateVo {
	   //查询条件
	   private String Device_ID;//设备id
	   private Date begintime;//开始时间
	   private Date endtime;//结束时间
	   //分页
	   private Integer start ;
	   private Integer end ;
	   //字段排序
	   private String sortField;
	   private String sortOrder;
	public String getDevice_ID() {
		return Device_ID;
	}
	public void setDevice_ID(String device_ID) {
		Device_ID = device_ID;
	}
	@JsonSerialize(using=JsonDateSerializer.class)
	public Date getBegintime() {
		return begintime;
	}
	public void setBegintime(Date begintime) {
		this.begintime = begintime;
	}
	@JsonSerialize(using=JsonDateSerializer.class)
	public Date getEndtime() {
		return endtime;
	}
	public void setEndtime(Date endtime) {
		this.endtime = endtime;
	}
	public String getSortField() {
		return sortField;
	}
	public void setSortField(String sortField) {
		this.sortField = sortField;
	}
	public String getSortOrder() {
		return sortOrder;
	}
	public void setSortOrder(String sortOrder) {
		this.sortOrder = sortOrder;
	}
	public Integer getStart() {
		return start;
	}
	public void setStart(Integer start) {
		this.start = start;
	}
	public Integer getEnd() {
		return end;
	}
	public void setEnd(Integer end) {
		this.end = end;
	}
	}


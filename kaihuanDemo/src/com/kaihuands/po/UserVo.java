package com.kaihuands.po;

public class UserVo {
   private String key;//查询条件
   //分页
   private Integer start ;
   private Integer end ;
   //字段排序
   private String sortField;
   private String sortOrder;
public String getKey() {
	return key;
}
public void setKey(String key) {
	this.key = key;
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

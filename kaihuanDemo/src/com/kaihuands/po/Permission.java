package com.kaihuands.po;
/*
 * 权限表
 */
public class Permission {
   private int id;//主键
   private String pName;//权限名称 （光伏，水表，路灯，用户）
   private String type;//资源类型
   private String url;//访问地址
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public String getpName() {
	return pName;
}
public void setpName(String pName) {
	this.pName = pName;
}
public String getType() {
	return type;
}
public void setType(String type) {
	this.type = type;
}
public String getUrl() {
	return url;
}
public void setUrl(String url) {
	this.url = url;
}    

}

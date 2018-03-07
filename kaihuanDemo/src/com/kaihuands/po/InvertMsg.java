package com.kaihuands.po;

import java.util.Date;

import org.codehaus.jackson.map.annotate.JsonSerialize;

import com.kaihuands.controller.JsonDateSerializer;

public class InvertMsg {
	private int id;// 主键
	private Integer user_id;// 对应用户id
	private String Temperature;
	private String Vpv1;
	private String Vpv2;
	private String Ipv1;
	private String Ipv2;
	private String Iac;
	private String Vac;
	private String Fac;
	private String Pac;
	private String E_total;
	private String H_total;
	private String Mode;
	private String ErrorMsg;
	private String E_today;
	private String E_todayA;
	private String E_todayB;
	private String Temperature2;
	private String VPN;
	private String reactivePower;
	private String PV3voltage;
	private String PV4voltage;
	private String PV4current;
	private String Uvoltage;
	private String Ucurrent;
	private String Vvoltage;
	private String Vcurrent;
	private String Wvoltage;
	private String Wcurrent;
	private String BUSvoltage;
	private String BUScurrent;
	private String gridFrequency;
	private String powerFactor;
	private String inputPower;
	private String outputPower;
	private String temperature3;
	private String groundingResistance;
	private String leakageCurrent;
	private String DCcomponent;
	private Date receiveTime;
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
	public Integer getUser_id() {
		return user_id;
	}
	public void setUser_id(Integer user_id) {
		this.user_id = user_id;
	}
	public String getTemperature() {
		return Temperature;
	}
	public void setTemperature(String temperature) {
		Temperature = temperature;
	}
	public String getVpv1() {
		return Vpv1;
	}
	public void setVpv1(String vpv1) {
		Vpv1 = vpv1;
	}
	public String getVpv2() {
		return Vpv2;
	}
	public void setVpv2(String vpv2) {
		Vpv2 = vpv2;
	}
	public String getIpv1() {
		return Ipv1;
	}
	public void setIpv1(String ipv1) {
		Ipv1 = ipv1;
	}
	public String getIpv2() {
		return Ipv2;
	}
	public void setIpv2(String ipv2) {
		Ipv2 = ipv2;
	}
	public String getIac() {
		return Iac;
	}
	public void setIac(String iac) {
		Iac = iac;
	}
	public String getVac() {
		return Vac;
	}
	public void setVac(String vac) {
		Vac = vac;
	}
	public String getFac() {
		return Fac;
	}
	public void setFac(String fac) {
		Fac = fac;
	}
	public String getPac() {
		return Pac;
	}
	public void setPac(String pac) {
		Pac = pac;
	}
	public String getE_total() {
		return E_total;
	}
	public void setE_total(String e_total) {
		E_total = e_total;
	}
	public String getH_total() {
		return H_total;
	}
	public void setH_total(String h_total) {
		H_total = h_total;
	}
	public String getMode() {
		return Mode;
	}
	public void setMode(String mode) {
		Mode = mode;
	}
	public String getErrorMsg() {
		return ErrorMsg;
	}
	public void setErrorMsg(String errorMsg) {
		ErrorMsg = errorMsg;
	}
	public String getE_today() {
		return E_today;
	}
	public void setE_today(String e_today) {
		E_today = e_today;
	}
	public String getE_todayA() {
		return E_todayA;
	}
	public void setE_todayA(String e_todayA) {
		E_todayA = e_todayA;
	}
	public String getE_todayB() {
		return E_todayB;
	}
	public void setE_todayB(String e_todayB) {
		E_todayB = e_todayB;
	}
	public String getTemperature2() {
		return Temperature2;
	}
	public void setTemperature2(String temperature2) {
		Temperature2 = temperature2;
	}
	public String getVPN() {
		return VPN;
	}
	public void setVPN(String vPN) {
		VPN = vPN;
	}
	public String getReactivePower() {
		return reactivePower;
	}
	public void setReactivePower(String reactivePower) {
		this.reactivePower = reactivePower;
	}
	public String getPV3voltage() {
		return PV3voltage;
	}
	public void setPV3voltage(String pV3voltage) {
		PV3voltage = pV3voltage;
	}
	public String getPV4voltage() {
		return PV4voltage;
	}
	public void setPV4voltage(String pV4voltage) {
		PV4voltage = pV4voltage;
	}
	public String getPV4current() {
		return PV4current;
	}
	public void setPV4current(String pV4current) {
		PV4current = pV4current;
	}
	public String getUvoltage() {
		return Uvoltage;
	}
	public void setUvoltage(String uvoltage) {
		Uvoltage = uvoltage;
	}
	public String getUcurrent() {
		return Ucurrent;
	}
	public void setUcurrent(String ucurrent) {
		Ucurrent = ucurrent;
	}
	public String getVvoltage() {
		return Vvoltage;
	}
	public void setVvoltage(String vvoltage) {
		Vvoltage = vvoltage;
	}
	public String getVcurrent() {
		return Vcurrent;
	}
	public void setVcurrent(String vcurrent) {
		Vcurrent = vcurrent;
	}
	public String getWvoltage() {
		return Wvoltage;
	}
	public void setWvoltage(String wvoltage) {
		Wvoltage = wvoltage;
	}
	public String getWcurrent() {
		return Wcurrent;
	}
	public void setWcurrent(String wcurrent) {
		Wcurrent = wcurrent;
	}
	public String getBUSvoltage() {
		return BUSvoltage;
	}
	public void setBUSvoltage(String bUSvoltage) {
		BUSvoltage = bUSvoltage;
	}
	public String getBUScurrent() {
		return BUScurrent;
	}
	public void setBUScurrent(String bUScurrent) {
		BUScurrent = bUScurrent;
	}
	public String getGridFrequency() {
		return gridFrequency;
	}
	public void setGridFrequency(String gridFrequency) {
		this.gridFrequency = gridFrequency;
	}
	public String getPowerFactor() {
		return powerFactor;
	}
	public void setPowerFactor(String powerFactor) {
		this.powerFactor = powerFactor;
	}
	public String getInputPower() {
		return inputPower;
	}
	public void setInputPower(String inputPower) {
		this.inputPower = inputPower;
	}
	public String getOutputPower() {
		return outputPower;
	}
	public void setOutputPower(String outputPower) {
		this.outputPower = outputPower;
	}
	public String getTemperature3() {
		return temperature3;
	}
	public void setTemperature3(String temperature3) {
		this.temperature3 = temperature3;
	}
	public String getGroundingResistance() {
		return groundingResistance;
	}
	public void setGroundingResistance(String groundingResistance) {
		this.groundingResistance = groundingResistance;
	}
	public String getLeakageCurrent() {
		return leakageCurrent;
	}
	public void setLeakageCurrent(String leakageCurrent) {
		this.leakageCurrent = leakageCurrent;
	}
	public String getDCcomponent() {
		return DCcomponent;
	}
	public void setDCcomponent(String dCcomponent) {
		DCcomponent = dCcomponent;
	}
	@JsonSerialize(using=JsonDateSerializer.class)
	public Date getReceiveTime() {
		return receiveTime;
	}
	public void setReceiveTime(Date receiveTime) {
		this.receiveTime = receiveTime;
	}

}

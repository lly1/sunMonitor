package com.kaihuands.po;
/*
 * 离网设备
 */
import java.util.Date;

import org.codehaus.jackson.map.annotate.JsonSerialize;

import com.kaihuands.controller.JsonDateSerializer;

public class NoinvertMsg {
    private Integer id;

    private Integer userId;

    private String invertSn;

    private String rownumber;

    private String chargestate;

    private String batterycap;

    private String batterytemperature;

    private String chargekwh;

    private String errormsg;

    private String diskwh;

    private String distime;

    private String ia;

    private String ib;

    private String itotal;

    private String idis;

    private String eToday;

    private String loadstate;

    private String pc;

    private String pd;

    private String vpv;

    private Date receivetime;

    private String vxdc;

    private String version;

    private String temperature;
    private User user;
    
    public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getInvertSn() {
        return invertSn;
    }

    public void setInvertSn(String invertSn) {
        this.invertSn = invertSn == null ? null : invertSn.trim();
    }

    public String getRownumber() {
        return rownumber;
    }

    public void setRownumber(String rownumber) {
        this.rownumber = rownumber == null ? null : rownumber.trim();
    }

    public String getChargestate() {
        return chargestate;
    }

    public void setChargestate(String chargestate) {
        this.chargestate = chargestate == null ? null : chargestate.trim();
    }

    public String getBatterycap() {
        return batterycap;
    }

    public void setBatterycap(String batterycap) {
        this.batterycap = batterycap == null ? null : batterycap.trim();
    }

    public String getBatterytemperature() {
        return batterytemperature;
    }

    public void setBatterytemperature(String batterytemperature) {
        this.batterytemperature = batterytemperature == null ? null : batterytemperature.trim();
    }

    public String getChargekwh() {
        return chargekwh;
    }

    public void setChargekwh(String chargekwh) {
        this.chargekwh = chargekwh == null ? null : chargekwh.trim();
    }

    public String getErrormsg() {
        return errormsg;
    }

    public void setErrormsg(String errormsg) {
        this.errormsg = errormsg == null ? null : errormsg.trim();
    }

    public String getDiskwh() {
        return diskwh;
    }

    public void setDiskwh(String diskwh) {
        this.diskwh = diskwh == null ? null : diskwh.trim();
    }

    public String getDistime() {
        return distime;
    }

    public void setDistime(String distime) {
        this.distime = distime == null ? null : distime.trim();
    }

    public String getIa() {
        return ia;
    }

    public void setIa(String ia) {
        this.ia = ia == null ? null : ia.trim();
    }

    public String getIb() {
        return ib;
    }

    public void setIb(String ib) {
        this.ib = ib == null ? null : ib.trim();
    }

    public String getItotal() {
        return itotal;
    }

    public void setItotal(String itotal) {
        this.itotal = itotal == null ? null : itotal.trim();
    }

    public String getIdis() {
        return idis;
    }

    public void setIdis(String idis) {
        this.idis = idis == null ? null : idis.trim();
    }

    public String geteToday() {
        return eToday;
    }

    public void seteToday(String eToday) {
        this.eToday = eToday == null ? null : eToday.trim();
    }

    public String getLoadstate() {
        return loadstate;
    }

    public void setLoadstate(String loadstate) {
        this.loadstate = loadstate == null ? null : loadstate.trim();
    }

    public String getPc() {
        return pc;
    }

    public void setPc(String pc) {
        this.pc = pc == null ? null : pc.trim();
    }

    public String getPd() {
        return pd;
    }

    public void setPd(String pd) {
        this.pd = pd == null ? null : pd.trim();
    }

    public String getVpv() {
        return vpv;
    }

    public void setVpv(String vpv) {
        this.vpv = vpv == null ? null : vpv.trim();
    }
    @JsonSerialize(using=JsonDateSerializer.class)
    public Date getReceivetime() {
        return receivetime;
    }

    public void setReceivetime(Date receivetime) {
        this.receivetime = receivetime;
    }

    public String getVxdc() {
        return vxdc;
    }

    public void setVxdc(String vxdc) {
        this.vxdc = vxdc == null ? null : vxdc.trim();
    }

    public String getVersion() {
        return version;
    }

    public void setVersion(String version) {
        this.version = version == null ? null : version.trim();
    }

    public String getTemperature() {
        return temperature;
    }

    public void setTemperature(String temperature) {
        this.temperature = temperature == null ? null : temperature.trim();
    }
}
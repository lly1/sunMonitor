package com.kaihuands.service;

import java.util.List;
import java.util.Map;

import com.kaihuands.po.DateVo;
import com.kaihuands.po.Device;
import com.kaihuands.po.InvertMsg;
import com.kaihuands.po.NoinvertMsg;
import com.kaihuands.po.User;
import com.kaihuands.po.UserVo;

/*
 * 光伏监控业务逻辑
 */
public interface DboService {
	//设备
	//分页查询
    public List<Device> findDevice(UserVo userVo) throws Exception;
    //查询总数
    public Integer countDevice(UserVo userVo) throws Exception;
    //增加User
    public int addUser(User user) throws Exception;
    //增加device
    public int addDevice(Device device) throws Exception;
    //修改User
    public int upSunUser(User user) throws Exception;
    //修改device
    public int upDevice(Device device) throws Exception;
    //删除设备
    public int rmDevice(Integer id) throws Exception;
    //查询所有安装地点 
    public List<String> getAllPlace(Integer grid) throws Exception;
    //根据place查询DTU（模块sn）
    public List<Map<String, Object>> getIdByPlace(Integer grid,String place) throws Exception;
    //逆变器
    //离网
    //分页查询
	public List<NoinvertMsg> findoff_gridInvertMsg(UserVo userVo) throws Exception;
    //查询总数
	public Integer countoff_gridInvertMsg(UserVo userVo) throws Exception;
	//根据id查询逆变器信息，取最新一条
	public List<NoinvertMsg> findoff_gridInvertMsgById(Integer id) throws Exception;
	//根据时间和设备id查询数据
  	public List<NoinvertMsg> findDateNIMsg(DateVo dateVo) throws Exception;
  	//根据时间和设备id查询数据总数
  	public Integer countDateNIMsg(DateVo dateVo) throws Exception;
	
	//并网
    //分页查询
	public List<InvertMsg> findInvertMsg(UserVo userVo) throws Exception;
    //查询总数
	public Integer countInvertMsg(UserVo userVo) throws Exception;
	//根据id查询逆变器信息，取最新一条
	public List<InvertMsg> findgridInvertMsgById(Integer id) throws Exception;
	//根据时间和设备id查询数据
	public List<InvertMsg> findDateIMsg(DateVo dateVo) throws Exception;
	//根据时间和设备id查询数据总数
	public Integer countDateIMsg(DateVo dateVo) throws Exception;
	
}

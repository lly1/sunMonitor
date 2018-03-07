package com.kaihuands.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.kaihuands.mapper.DeviceMapper;
import com.kaihuands.mapper.InvertMsgMapper;
import com.kaihuands.po.DateVo;
import com.kaihuands.po.Device;
import com.kaihuands.po.InvertMsg;
import com.kaihuands.po.NoinvertMsg;
import com.kaihuands.po.User;
import com.kaihuands.po.UserVo;
import com.kaihuands.service.DboService;

public class DboServiceImpl implements DboService {
	@Autowired
	private DeviceMapper deviceMapper;
	@Autowired
	private InvertMsgMapper invertMsgMapper;
	//查询设备信息
	public List<Device> findDevice(UserVo userVo) throws Exception {
		// TODO Auto-generated method stub
		List<Device> devices = deviceMapper.findDevice(userVo);
		System.out.println(devices.get(0).getPlaceTime());
		return devices;
	}
	//查询设备信息总数
	public Integer countDevice(UserVo userVo) throws Exception {
		// TODO Auto-generated method stub
		return deviceMapper.countDevice(userVo);
	}
	//查询所有安装地点 
    public List<String> getAllPlace(Integer grid) throws Exception {
    	return deviceMapper.getAllPlace(grid);
    }
    //根据place查询DTU（模块sn）
    public List<Map<String, Object>> getIdByPlace(Integer grid,String place) throws Exception{
    	System.out.println(place);
    	List<Map<String, Object>> maps=new ArrayList<Map<String,Object>>();
		List<String> userDTUs= deviceMapper.getIdByPlace(grid,place);
		String pid =null;
		for(int i=0;i<userDTUs.size();i++){
			HashMap<String, Object> map =new HashMap<String, Object>() ;
			HashMap<String, Object> map1 =new HashMap<String, Object>() ;
			int flag=0;
			String head=userDTUs.get(i);
			if(head.length()>5){
				String subhead=head.substring(0, 3);
				pid=subhead;
				//id去重，遍历maps数组，有相同的不让添加
				if(!maps.isEmpty())
				{	for(int j=0;j<maps.size();j++){
						Map map2=(Map)maps.get(j);
						if(map2.get("id").equals(pid)){
							flag++;
						}
					}
					if(flag==0){
						map.put("id",subhead);
						map.put("pid","" );
						map.put("text",subhead);
						maps.add(map);
					}
				}
				map1.put("id",head);
				map1.put("pid",pid );
				map1.put("text",head);
				maps.add(map1);
			}
			if(head.length()<5){
				String subhead=head.substring(0, 1);
				pid=subhead;
				//id去重，遍历maps数组，有相同的不让添加
				if(!maps.isEmpty())
				{	for(int j=0;j<maps.size();j++){
						Map map2=(Map)maps.get(j);
						if(map2.get("id").equals(pid)){
							flag++;
						}
					}
					if(flag==0){
						map.put("id",subhead);
						map.put("pid","" );
						map.put("text",subhead);
						maps.add(map);
					}
				}
				map1.put("id",head);
				map1.put("pid",pid );
				map1.put("text",head);
				maps.add(map1);
			}
		}
		return maps;
    }
	//离网
	//查询逆变器信息
	public List<NoinvertMsg> findoff_gridInvertMsg(UserVo userVo) throws Exception {
		// TODO Auto-generated method stub
			
		return invertMsgMapper.findoff_gridInvertMsg(userVo);
	}
	//查询逆变器信息总数
	public Integer countoff_gridInvertMsg(UserVo userVo) throws Exception {
		// TODO Auto-generated method stub
		return invertMsgMapper.countoff_gridInvertMsg(userVo);
	}
	//根据id查询逆变器信息，取最新一条
	public List<NoinvertMsg> findoff_gridInvertMsgById(Integer id) throws Exception{
		return invertMsgMapper.findoff_gridInvertMsgById(id);
	}
	//并网
	//查询逆变器信息
	public List<InvertMsg> findInvertMsg(UserVo userVo) throws Exception {
		// TODO Auto-generated method stub
		
		return invertMsgMapper.findInvertMsg(userVo);
	}
	//查询逆变器信息总数
	public Integer countInvertMsg(UserVo userVo) throws Exception {
		// TODO Auto-generated method stub
		return invertMsgMapper.countInvertMsg(userVo);
	}
	//根据id查询逆变器信息，取最新一条
	public List<InvertMsg> findgridInvertMsgById(Integer id) throws Exception{
		return invertMsgMapper.findgridInvertMsgById(id);
	}
	
	
	
	
	//添加用户
	public int addUser(User user) throws Exception {
		// TODO Auto-generated method stub
		return deviceMapper.addUser(user);
	}
	//添加设备
	public int addDevice(Device device) throws Exception {
		// TODO Auto-generated method stub
		return deviceMapper.addDevice(device);
	}
	//修改用户
	public int upSunUser(User user) throws Exception {
		// TODO Auto-generated method stub
		return deviceMapper.upSunUser(user);
	}
	//修改设备
	public int upDevice(Device device) throws Exception {
		// TODO Auto-generated method stub
		return deviceMapper.upDevice(device);
	}
	//删除设备
	public int rmDevice(Integer id) throws Exception {
		// TODO Auto-generated method stub
		return deviceMapper.rmDevice(id);
	}
	 /************************根据设备id和时间来分页查询数据********************************/
	//并网	
	public List<InvertMsg> findDateIMsg(DateVo dateVo) throws Exception {
		return invertMsgMapper.findDateIMsg(dateVo);
	}

	public Integer countDateIMsg(DateVo dateVo) throws Exception {
		return invertMsgMapper.countDateIMsg(dateVo);
	}
		
		
	//离网
	public List<NoinvertMsg> findDateNIMsg(DateVo dateVo) throws Exception {
		// TODO Auto-generated method stub
		return invertMsgMapper.findDateNIMsg(dateVo);
	}

	public Integer countDateNIMsg(DateVo dateVo) throws Exception {
		// TODO Auto-generated method stub
		return invertMsgMapper.countDateNIMsg(dateVo);
	}
}

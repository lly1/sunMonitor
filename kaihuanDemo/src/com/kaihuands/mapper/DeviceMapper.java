package com.kaihuands.mapper;

import java.util.List;

import com.kaihuands.po.Device;
import com.kaihuands.po.User;
import com.kaihuands.po.UserVo;

/*
 * 设备的Mapper接口
 */
public interface DeviceMapper {
     //分页查询
     public List<Device> findDevice(UserVo userVo) throws Exception;
     //查询总数
     public Integer countDevice(UserVo userVo) throws Exception;
     //增加User
     public int addUser(User user) throws Exception;
     //增加device
     public int addDevice(Device device) throws Exception;
     //修改用户
     public int upSunUser(User user) throws Exception;
     //修改设备
     public int upDevice(Device device) throws Exception;
     //删除
     public int rmDevice(Integer id) throws Exception;
     //查询所有安装地点 
     public List<String> getAllPlace(Integer grid) throws Exception;
     //根据place查询DTU（模块sn）
     public List<String> getIdByPlace(Integer grid,String place) throws Exception;
     //查询树结构
     public Integer getTree(String s) throws Exception;
}

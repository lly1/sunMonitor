package com.kaihuands.mapper;

import java.util.List;

import com.kaihuands.po.DateVo;
import com.kaihuands.po.InvertMsg;
import com.kaihuands.po.NoinvertMsg;
import com.kaihuands.po.UserVo;

/*
 * 逆变器数据的Mapper接口
 */
public interface InvertMsgMapper {
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

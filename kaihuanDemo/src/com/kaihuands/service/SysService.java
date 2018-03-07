package com.kaihuands.service;

import java.util.List;

import com.kaihuands.po.ActiveUser;
import com.kaihuands.po.Region;
import com.kaihuands.po.User;
import com.kaihuands.po.UserRole;
import com.kaihuands.po.UserVo;

/*
 * 授权以及登陆认证
 */
public interface SysService {
	//根据用户的身份和密码进行认证，如果认证通过，返回用户身份信息  
    public User login(String username,String passwd) throws Exception; 
    //检查用户是否存在
    public String check(String username) throws Exception;
    //返回所有管理员用户信息
    public List<ActiveUser> findUser(UserVo userVo) throws Exception; 
    //返回所有光伏用户信息
    public List<ActiveUser> findSunUser(UserVo userVo) throws Exception; 
    //添加用户
    public int addUser(User user) throws Exception;
    //添加用户权限
    public int addUserRole(UserRole userRole) throws Exception;
    //删除用户
    public void removeUserById(int id);
    //重置用户密码
    public void updatePasswdById(int id);
	//根据id查询用户
	public User findByIdUser(int id) throws Exception;
	//根据账号查询用户
	public User findByUnameUser(String username) throws Exception;
	//修改用户信息
	public void updateUser(User user) throws Exception;
	//修改用户角色
	public void updateUserRole(UserRole userRole) throws Exception;
	//查询管理操作用户总数
	public int count(UserVo userVo) throws Exception;
	//查询光伏用户总数
	public int sunCount(UserVo userVo) throws Exception;
	//查询用户角色id
	public List<Region> findRole();
	//分页查询地区
	public List<Region> findregion();
	public List<Region> findAllregion(UserVo userVo)throws Exception;
	//查询地区总条数
	public int regionCount(UserVo userVo) throws Exception;
	//添加地区
	public int addRegion(Region region) throws Exception;
	//根据id查询地区
	public Region findByIdRegion(int id) throws Exception;
	//修改地区
	public int updateRegion(Region region) throws Exception;
	   
}

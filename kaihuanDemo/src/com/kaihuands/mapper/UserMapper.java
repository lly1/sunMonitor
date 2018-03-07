package com.kaihuands.mapper;

import java.util.List;

import com.kaihuands.po.Region;
import com.kaihuands.po.User;
import com.kaihuands.po.UserRole;
import com.kaihuands.po.UserVo;


public interface UserMapper{
	/**
	 * 分页且按条件查询所有的管理员用户所有信息
	 */
	public List<User> findUser(UserVo userVo);
	/**
	 * 分页且按条件查询所有的太阳用户所有信息
	 */
	public List<User> findSunUser(UserVo userVo);
	/**
	 * 查询管理操作用户总数
	 */
	public int count(UserVo userVo);
	/**
	 * 查询光伏用户总数
	 */
	public int sunCount(UserVo userVo);
	/**
	 * 检查用户是否存在
	 */
	public String check(String username);
	
	/**
	 * 按条件统计用户的总记录数
	 */
	public int findTotalCount(User user);
	/**
	 * 根据用户名查找用户名，密码
	 */
	public User findup(String username);
	/**
	 * 添加用户
	 */
	public int addUser(User user);
	/**
	 * 添加用户角色id
	 */
	public int addUserRole(UserRole userRole);
	/**
	 * 根据id查询用户
	 */
	public User findByIdUser(int id);
	/**
	 * 根据账号查询用户
	 */
	public User findByUnameUser(String username);
	/**
	 * 根据id修改用户
	 */
	public int updateUser(User user);
	/**
	 * 根据id修改用户角色
	 */
	public int updateUserRole(UserRole userRole);
	/**
	 * 删除用户
	 */
	public int deleteUser(int id);
	/**
	 * 删除用户，角色关联
	 */ 
	public int deleteUserRole(int id);
	/**
	 * 重置用户密码
	 */ 
	public int updatePasswd(int id);
	/**
	 * 查询所有用户角色id
	 */
	public List<Region> findRole();
	/**
	 * 查询所有地区
	 */
	public List<Region> findregion();
	public List<Region> findAllregion(UserVo userVo);
	/**
	 * 查询地区总条数
	 */
	public int regionCount(UserVo userVo);
	/**
	 * 添加地区
	 */
	public int addRegion(Region region);
	/**
	 * 根据id查询地区
	 */
	public Region findByIdRegion(int id);
	/**
	 * 修改地区
	 */
	public int updateRegion(Region region);
}
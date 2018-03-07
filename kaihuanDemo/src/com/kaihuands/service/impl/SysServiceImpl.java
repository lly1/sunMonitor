package com.kaihuands.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.kaihuands.mapper.UserMapper;
import com.kaihuands.po.ActiveUser;
import com.kaihuands.po.Region;
import com.kaihuands.po.User;
import com.kaihuands.po.UserRole;
import com.kaihuands.po.UserVo;
import com.kaihuands.service.SysService;

public class SysServiceImpl implements SysService {
    @Autowired
    private UserMapper userMapper;
	public User login(String username, String passwd) throws Exception {
		  /** 
         * 认证过程： 根据用户身份(账号)查询数据库，如果查询不到则用户不存在  
         * 对输入的密码和数据库密码进行比对，如果一致则认证通过 
         */  
        // 根据用户账号查询数据库 
		User user= userMapper.findup(username);
		if(user==null){
			// 抛出异常 
			System.out.println("查询不到账号");
          return null;  
		}
		else
		{
			if(user.getPasswd().equals(passwd)){
				System.out.println("欢迎进入");
				return user;
			}
			
		}
		System.out.println("用户名密码错误");
		return null;
	}
	 /** 
     * 查询所有管理员用户
     */ 
	public List<ActiveUser> findUser(UserVo userVo) throws Exception {
		// TODO Auto-generated method stub
		List<User> users=userMapper.findUser(userVo);
		   List<ActiveUser> activeUsers=new ArrayList<ActiveUser>();
		   ActiveUser activeUser= new ActiveUser();
		   StringBuffer pName= new StringBuffer();
		   StringBuffer roleName=new StringBuffer();
		
		   for(int i = 0 ; i < users.size() ; i++) {
			   activeUser=new ActiveUser();
			   activeUser.setId(users.get(i).getId());
			   activeUser.setName(users.get(i).getName());
			   activeUser.setPasswd(users.get(i).getPasswd());
			   activeUser.setRegionName(users.get(i).getRegion().getRegionName());
			  
			   for(int j = 0 ; j < users.get(i).getRole().size(); j++) {
				   roleName=new StringBuffer();
				   pName=new StringBuffer();
				   roleName.append(users.get(i).getRole().get(j).getRoleName());
				   System.out.println("测试！！！"+users.get(i).getRole().get(j).getPermission().size());
				   switch(users.get(i).getRole().get(j).getPermission().size()){
				   case 1:
					   activeUser.setMeter_Power(users.get(i).getRole().get(j).getPermission().get(0).getpName());
					   break;
				   case 2:
					   activeUser.setUMng_Power(users.get(i).getRole().get(j).getPermission().get(0).getpName());
					   activeUser.setMeter_Power(users.get(i).getRole().get(j).getPermission().get(1).getpName());
					   break;
				   default:
					   activeUser.setUMng_Power(users.get(i).getRole().get(j).getPermission().get(0).getpName());
					   activeUser.setMeter_Power(users.get(i).getRole().get(j).getPermission().get(1).getpName());
					   activeUser.setLight_Power(users.get(i).getRole().get(j).getPermission().get(2).getpName());
					   break;
				   }
				   
				  
				  }
			   activeUser.setpName(pName);
			   activeUser.setRoleName(roleName);
			   activeUser.setAddress(users.get(i).getAddress());
			   activeUser.setUserDTU(users.get(i).getUserDTU());
			   activeUser.setGrid(users.get(i).getGrid());
			   activeUser.setUsername(users.get(i).getUsername());
			   activeUsers.add(i, activeUser);
		 }
	   System.out.println(activeUsers.size());
	    return activeUsers;
	}
	 /** 
     * 查询所有光伏用户
     */ 
	public List<ActiveUser> findSunUser(UserVo userVo) throws Exception {
		// TODO Auto-generated method stub
		   List<User> users=userMapper.findSunUser(userVo);
		   List<ActiveUser> activeUsers=new ArrayList<ActiveUser>();
		   ActiveUser activeUser= new ActiveUser();
		
		   for(int i = 0 ; i < users.size() ; i++) {
			   activeUser=new ActiveUser();
			   activeUser.setId(users.get(i).getId());
			   activeUser.setName(users.get(i).getName());
			   activeUser.setUserDTU(users.get(i).getUserDTU());
			   activeUser.setGrid(users.get(i).getGrid());
			   activeUser.setUsername(users.get(i).getUsername());
			   activeUsers.add(i, activeUser);
		 }
	   System.out.println(activeUsers.size());
	    return activeUsers;
		  
	    
	}
	public int addUser(User user) throws Exception {
		// TODO Auto-generated method stub
		int addflag=userMapper.addUser(user);
		return addflag;
	}
	public int addUserRole(UserRole userRole) throws Exception {
		// TODO Auto-generated method stub
		int addRoleflag=userMapper.addUserRole(userRole);
		return addRoleflag;
	}
	public void removeUserById(int id) {
		// TODO Auto-generated method stub
		userMapper.deleteUserRole(id);
		userMapper.deleteUser(id);
		
	}
	public void updatePasswdById(int id) {
		// TODO Auto-generated method stub
		userMapper.updatePasswd(id);
		
	}
	public User findByIdUser(int id) throws Exception {
		// TODO Auto-generated method stub
		User user =new User();
		user=userMapper.findByIdUser(id);
		return user;
	}
	public User findByUnameUser(String username) throws Exception {
		// TODO Auto-generated method stub
		User user =new User();
		user=userMapper.findByUnameUser(username);
		return user;
	}
	public void updateUser(User user) throws Exception {
		// TODO Auto-generated method stub
		userMapper.updateUser(user);
		
	}
	public void updateUserRole(UserRole userRole) throws Exception {
		// TODO Auto-generated method stub
		userMapper.updateUserRole(userRole);
	}
	public String check(String username) throws Exception {
		// TODO Auto-generated method stub
		return userMapper.check(username);
	}
	public int count(UserVo userVo) throws Exception {
		// TODO Auto-generated method stub
		return userMapper.count(userVo);
	}
	public int sunCount(UserVo userVo) throws Exception {
		// TODO Auto-generated method stub
		return userMapper.sunCount(userVo);
	}
	public List<Region> findRole() {
		// TODO Auto-generated method stub
		return userMapper.findRole();
	}
	public List<Region> findregion() {
		// TODO Auto-generated method stub
		return userMapper.findregion();
	}
	public List<Region> findAllregion(UserVo userVo) throws Exception {
		// TODO Auto-generated method stub
		return userMapper.findAllregion(userVo);
	}
	public int regionCount(UserVo userVo) throws Exception {
		// TODO Auto-generated method stub
		return userMapper.regionCount(userVo);
	}
	public int addRegion(Region region) throws Exception {
		// TODO Auto-generated method stub
		return userMapper.addRegion(region);
	}
	public Region findByIdRegion(int id) throws Exception{
		// TODO Auto-generated method stub
		return userMapper.findByIdRegion(id);
	}
	public int updateRegion(Region region)throws Exception {
		// TODO Auto-generated method stub
		return userMapper.updateRegion(region);
	}
	

}

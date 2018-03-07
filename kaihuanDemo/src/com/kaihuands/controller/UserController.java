package com.kaihuands.controller;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;








import org.apache.ibatis.annotations.Param;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kaihuands.po.ActiveUser;
import com.kaihuands.po.AjaxJson;
import com.kaihuands.po.Region;
import com.kaihuands.po.Role;
import com.kaihuands.po.User;
import com.kaihuands.po.UserRole;
import com.kaihuands.po.UserVo;
import com.kaihuands.service.SysService;
import com.kaihuands.service.impl.SysServiceImpl;
/**
 * 处理用户请求控制器
 * */

@Controller
public class UserController {
	
	/**
	 * 自动注入UserService
	 * */
	@Autowired
	@Qualifier("SysService")
	private SysService sysService;
	@RequestMapping(value="/login")
	@ResponseBody
	 public User login(@RequestParam("username") String username,
			 @RequestParam("passwd") String passwd,
			 HttpSession session
			 ) throws Exception{
		// 调用业务逻辑组件判断用户是否可以登录
		User user = sysService.login(username, passwd);
		if(user != null){
			// 将用户保存到HttpSession当中
			session.setAttribute("username", user);
		}
		return user;
	  }
	@RequestMapping(value="/showUser")
	@ResponseBody
	 public User showUser(User user,
			 HttpSession session
			 ) throws Exception{
		// session取值
		user=(User)session.getAttribute("username");
		
		return user;
	  }
	@RequestMapping(value="/check")
	@ResponseBody
	 public String check(@RequestParam("username") String username
			 ) throws Exception{
		// 调用业务逻辑组件判断用户是否已经注册
		 return sysService.check(username);
	  }
	/**
	 * 查询管理员用户
	 * */
	@RequestMapping(value="/user/queryUser",method=RequestMethod.POST)
    @ResponseBody
	public AjaxJson queryUser(HttpServletRequest request,HttpServletResponse response) throws Exception{
		// 调用业务逻辑组件查询用户
		UserVo userVo=new UserVo();
		userVo.setKey(request.getParameter("key"));
		int pageIndex=Integer.parseInt(request.getParameter("pageIndex"));
		int pageSize=Integer.parseInt(request.getParameter("pageSize"));
		int start = pageIndex * pageSize;  
        int end = start + pageSize; 
        userVo.setStart(start);
        userVo.setEnd(end);
		System.out.println(request.getParameter("pageSize"));
		List<ActiveUser> activeUsers = sysService.findUser(userVo);
	    AjaxJson a = new AjaxJson();
		a.setData(activeUsers);
		a.setTotal(sysService.count(userVo));
	    return a;
	  }
	/**
	 * 查询光伏用户
	 * */
	@RequestMapping(value="/user/querySunUser",method=RequestMethod.POST)
    @ResponseBody
	public AjaxJson querySunUser(HttpServletRequest request,HttpServletResponse response) throws Exception{
		// 调用业务逻辑组件查询用户
		UserVo userVo=new UserVo();
		userVo.setKey(request.getParameter("key"));
		int pageIndex=Integer.parseInt(request.getParameter("pageIndex"));
		int pageSize=Integer.parseInt(request.getParameter("pageSize"));
		int start = pageIndex * pageSize;  
        int end = start + pageSize; 
        userVo.setStart(start);
        userVo.setEnd(end);
        List<ActiveUser> users = sysService.findSunUser(userVo);
        AjaxJson a = new AjaxJson();
		a.setData(users);
		a.setTotal(sysService.sunCount(userVo));
	    return a;
	  }
	/**
	 * 处理添加请求
	 * @param String flag 标记， 1表示跳转到添加页面，2表示执行添加操作
	 * @param User user  要添加用户的对象
	 * @param ModelAndView mv
	 * */
	@RequestMapping(value="/user/addUser",method=RequestMethod.POST)
	@ResponseBody
	 public String addUser(
			 @ModelAttribute User user,//自动获取表单数据插入pojo
			 @ModelAttribute UserRole userRole,
			 ModelAndView mv) throws Exception{
			// 调用业务逻辑组件进行添加操作
			sysService.addUser(user);
			//获取自增user_id
			int user_id=user.getId();
			//将id插入用户角色表
			userRole.setId(user_id);
			sysService.addUserRole(userRole);
		// 返回
		return "ok";
	}
	/**
	 * 处理删除用户请求
	 * @param String ids 需要删除的id字符串
	 * @param ModelAndView mv
	 * */
	@RequestMapping(value="/user/removeUser")
	 public ModelAndView removeUser(String ids,ModelAndView mv){
		// 分解id字符串
		String[] idArray = ids.split(",");
	 for(String id : idArray){
		// 根据id删除员工
		sysService.removeUserById(Integer.parseInt(id));
		}
		// 设置客户端跳转到查询请求
		mv.setViewName("redirect:/jsp/user/admintable.jsp");
		// 返回ModelAndView
		return mv;
	}
	/**
	 * 处理重置密码请求
	 * @param String ids 需要重置的id字符串
	 * @param ModelAndView mv
	 * */
	@RequestMapping(value="/user/updatePasswd")
	 public ModelAndView updatePasswd(String[] ids,ModelAndView mv){
		System.out.println(ids[0]);
		// 分解id字符串
      	
	 for(String id : ids){
		// 根据id删除员工
		System.out.println(id);
		sysService.updatePasswdById(Integer.parseInt(id));
		}
		// 设置客户端跳转到查询请求
		mv.setViewName("redirect:/jsp/user/admintable.jsp");
		// 返回ModelAndView
		return mv;
	}
	/**
	 * 处理修改用户请求
	 * */
	@RequestMapping(value="/user/findUserById")
	@ResponseBody
	 public User findUserById(
			 int id
			 ) throws Exception{
			// 根据id查询用户
			return sysService.findByIdUser(id);
	}
	@RequestMapping(value="/user/findUserByUname")
	@ResponseBody
	 public User findUserByUname(
			 String username
			 ) throws Exception{
			// 根据账号查询用户
			return sysService.findByUnameUser(username);
	}
	@RequestMapping(value="/user/updateUser",method=RequestMethod.POST)
	@ResponseBody 
	public String updateUser(
			 @ModelAttribute User user,
			 int r_id//role_id
	        ) throws Exception{
			// 执行修改操作
		if(r_id!=0){
			sysService.updateUser(user);
			UserRole role =new UserRole();
			role.setRole_id(r_id);
			role.setUser_id(user.getId());
			sysService.updateUserRole(role);
		}
		else {
			sysService.updateUser(user);
		}
		
		// 返回
		return "ok";
	}
	/**
	 * 控制地区分页查询
	 * @param request
	 * @param response
	 * @return 
	 * @throws Exception
	 */
	@RequestMapping(value="/user/findregion")
	@ResponseBody
	 public AjaxJson findregion(HttpServletRequest request,HttpServletResponse response)
			throws Exception{
		UserVo userVo=new UserVo();
		userVo.setKey(request.getParameter("key"));
		int pageIndex=Integer.parseInt(request.getParameter("pageIndex"));
		int pageSize=Integer.parseInt(request.getParameter("pageSize"));
		int start = pageIndex * pageSize;  
        int end = start + pageSize; 
        userVo.setStart(start);
        userVo.setEnd(end);
		AjaxJson a=new AjaxJson();
	    a.setData(sysService.findAllregion(userVo));
	    a.setTotal(sysService.regionCount(userVo));
	    return a;
	}
	/**
	 * 查询地区
	 * */
	@RequestMapping(value="/user/findregionId")
	@ResponseBody
	 public List<Region> findregion() throws Exception{
	   return sysService.findregion();
	}
	@RequestMapping(value="/user/findAllregion")
	@ResponseBody
	 public List<Region> findAllregion() throws Exception{
	   return sysService.findAllregion(null);
	}
	/**
	 * 处理添加地区请求
	 */
	@RequestMapping(value="/user/addRegion",method=RequestMethod.POST)
	@ResponseBody
	 public String addRegion(
			 @ModelAttribute Region region//自动获取表单数据插入pojo
		    ) throws Exception{
			// 调用业务逻辑组件进行添加操作
			sysService.addRegion(region);	
		// 返回
		return "ok";
	}
	/**
	 * 处理修改地区请求
	 */
	@RequestMapping(value="/user/findRegionById")
	@ResponseBody
	 public Region findRegionById(
			 int id
			 ) throws Exception{
			// 根据id查询用户
			return sysService.findByIdRegion(id);
	}
	@RequestMapping(value="/user/updateRegion")
	@ResponseBody
	 public String updateRegion(
			 @ModelAttribute Region region,
			 ModelAndView mv) throws Exception{
			// 执行修改操作
			sysService.updateRegion(region);
	        return "ok";
	}
	/**
	 * 查询用户角色id
	 *
	 * */
	@RequestMapping(value="/user/findRole")
	@ResponseBody
	 public List<Region> findRole()
			throws Exception{
			// 根据id查询用户
			
			return sysService.findRole();
	}
}

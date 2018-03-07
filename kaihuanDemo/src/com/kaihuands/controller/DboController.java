package com.kaihuands.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.RowSet;

import org.apache.commons.collections.CollectionUtils;
import org.apache.poi.ss.formula.functions.Value;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kaihuands.po.AjaxJson;
import com.kaihuands.po.DateVo;
import com.kaihuands.po.Device;
import com.kaihuands.po.InvertMsg;
import com.kaihuands.po.NoinvertMsg;
import com.kaihuands.po.User;
import com.kaihuands.po.UserVo;
import com.kaihuands.service.DboService;
import com.kaihuands.util.ExcelUtils;

import flexjson.JSONDeserializer;

/**
 * 光伏监控处理器
 * */

@Controller
public class DboController {
	/**
	 * 自动注入DboService
	 * */
	@Autowired
	@Qualifier("DboService")
	private DboService dboService;
	@Autowired
	private CustomDateConverter converter;
	private String key;//全局查询标志
	DateVo dateVos=new DateVo();//全局Date查询标志
	//查询设备信息
	@RequestMapping(value="/querySunSite")
	@ResponseBody
	public AjaxJson querySunSite(HttpServletRequest request) throws Exception{
		UserVo userVo=new UserVo();
		key=request.getParameter("key");
		userVo.setKey(key);
		int pageIndex=Integer.parseInt(request.getParameter("pageIndex"));
		int pageSize=Integer.parseInt(request.getParameter("pageSize"));
		int start = pageIndex * pageSize;  
        int end = start + pageSize; 
        userVo.setStart(start);
        userVo.setEnd(end);
		List<Device> devices =dboService.findDevice(userVo);
		AjaxJson a = new AjaxJson();
		a.setData(devices);
		a.setTotal(dboService.countDevice(userVo));
		return a;
	}
	//查询所有设备安装地点
	@RequestMapping(value="/getAllPlace")
	@ResponseBody
	public List<String> getAllPlace(int grid) throws Exception{
		System.out.println(grid);
		return dboService.getAllPlace(grid);
	}
	//根据place查询DTU（模块sn）
		@RequestMapping(value="/getIdByPlace")
		@ResponseBody
		public List<Map<String, Object>> getIdByPlace(@RequestParam(value="grid") Integer grid,@RequestParam(value="place") String place) throws Exception{
			
			return dboService.getIdByPlace(grid,place);
		}
	//处理设备信息
		@RequestMapping(value="/service")
		@ResponseBody
		public String service(HttpServletRequest request)
				throws Exception{
			// 调用业务逻辑组件进行添加操作
			String data =request.getParameter("data");
			//解析json
			JSONDeserializer deserializer = new JSONDeserializer();
			ArrayList rows = (ArrayList)deserializer.deserialize(data);
			for(int i=0;i<rows.size(); i++){
		    	HashMap row = (HashMap)rows.get(i);
		    	System.out.println(rows.get(i));
		    	for(Object key: row.keySet()){
		    		//for-each 把row.keySet()的值给kety，直到row.keySet()循环完
		    		//row.keyset是row的key
		    		System.out.println("key-----"+key+"----value-----"+row.get(key));
		    	}
				String id = row.get("id") != null ? row.get("id").toString() : "";
		        String state = row.get("_state") != null ? row.get("_state").toString() : "";
		        Device device=new Device();
		        User user=new User();
		        if(state.equals("added") || id.equals(""))	//新增：id为空，或_state为added
		        {    
		        	if(row.get("user")!=null){
		        		Map users=(Map)row.get("user");
		        		if (users.get("userDTU") != null) {
		    				Integer userDTU = new Integer(users.get("userDTU").toString());
		    				user.setUserDTU(userDTU);
		    				user.setUsername(users.get("userDTU").toString() + "001");
		    			}
		    			if (users.get("grid") != null) {
		    				Integer grid = new Integer(users.get("grid").toString());
		    				user.setGrid(grid);
		    			}
		    			if (users.get("name") != null)
		    				user.setName(users.get("name").toString());
		    			dboService.addUser(user);
		        	}
		        	if (row.get("Invert_SN") != null)
		    			device.setInvert_SN(row.get("Invert_SN").toString());
		    		if (row.get("manager") != null)
		    			device.setManager(row.get("manager").toString());
		    		if (row.get("phone") != null)
		    			device.setPhone(row.get("phone").toString());
		    		if (row.get("place") != null)
		    			device.setPlace(row.get("place").toString());
		    		if (row.get("placeTime") != null) {
		    			// 用时间转换器将String转换成Date
		    			Date date = converter.convert(row.get("placeTime").toString());
		    			device.setPlaceTime(date);
		    		}
		    		if (row.get("state") != null) {
		    			Integer d_state = new Integer(row.get("state").toString());
		    			device.setState(d_state);
		    		}
		    		int user_id=user.getId();
		    		device.setUser_id(user_id);
		    		dboService.addDevice(device);
		        }
		        else if (state.equals("removed") || state.equals("deleted"))
		        {
		        	//获取id
	    			Integer d_id =(Integer) row.get("id");
	    			//执行删除操作
	    			dboService.rmDevice(d_id);
		        }
		        else if (state.equals("modified") || state.equals(""))	//更新：_state为空，或modified
		        {
	    			if(row.get("user")!=null){
		        		Map users=(Map)row.get("user");
		        		if (users.get("userDTU") != null) {
		    				Integer userDTU = new Integer(users.get("userDTU").toString());
		    				user.setUserDTU(userDTU);
		    				user.setUsername(users.get("userDTU").toString() + "001");
		    			}
		    			if (users.get("grid") != null) {
		    				Integer grid = new Integer(users.get("grid").toString());
		    				user.setGrid(grid);
		    			}
		    			if (users.get("name") != null)
		    				user.setName(users.get("name").toString());
		    			if (users.get("id") != null) {
		    				Integer user_id = new Integer(users.get("id").toString());
		    				user.setId(user_id);
		    			}
		    			dboService.upSunUser(user);
		        	}
		        	if (row.get("Invert_SN") != null)
		    			device.setInvert_SN(row.get("Invert_SN").toString());
		    		if (row.get("manager") != null)
		    			device.setManager(row.get("manager").toString());
		    		if (row.get("phone") != null)
		    			device.setPhone(row.get("phone").toString());
		    		if (row.get("place") != null)
		    			device.setPlace(row.get("place").toString());
		    		if (row.get("placeTime") != null) {
		    			// 用时间转换器将String转换成Date
		    			Date date = converter.convert(row.get("placeTime").toString());
		    			device.setPlaceTime(date);
		    		}
		    		if (row.get("state") != null) {
		    			Integer d_state = new Integer(row.get("state").toString());
		    			device.setState(d_state);
		    		}
		    		Integer d_id = new Integer(row.get("id").toString());
		    		device.setId(d_id);
		    		dboService.upDevice(device);
		        }
			}
			return "ok";
		}
	//查询逆变器信息
	@RequestMapping(value="/querySunInvert")
	@ResponseBody
	public AjaxJson querySunInvert(HttpServletRequest request) throws Exception{
		UserVo userVo=new UserVo();
		userVo.setKey(request.getParameter("key"));
		int grid =Integer.parseInt(request.getParameter("grid"));
		int pageIndex=Integer.parseInt(request.getParameter("pageIndex"));
		int pageSize=Integer.parseInt(request.getParameter("pageSize"));
		int start = pageIndex * pageSize;  
        int end = start + pageSize; 
        userVo.setStart(start);
        userVo.setEnd(end);
        if(grid!=0){
        	//并网
        	List<InvertMsg> invertMsgs =dboService.findInvertMsg(userVo);
    		AjaxJson a = new AjaxJson();
    		a.setData(invertMsgs);
    		a.setTotal(dboService.countInvertMsg(userVo));
    		return a;
		}
        else {
        	//离网
        	List<NoinvertMsg> noinvertMsgs =dboService.findoff_gridInvertMsg(userVo);
    		AjaxJson a = new AjaxJson();
    		a.setData(noinvertMsgs);
    		a.setTotal(dboService.countoff_gridInvertMsg(userVo));
    		return a;
		}
	}
	//根据id查询离网逆变器信息
	@RequestMapping("/findoff_gridInvertMsgById")
	@ResponseBody
	public List<NoinvertMsg> findoff_gridInvertMsgById(Integer DeviceID) throws Exception{
		return dboService.findoff_gridInvertMsgById(DeviceID);
	}
	//根据id查询并网逆变器信息
	@RequestMapping("/findgridInvertMsgById")
	@ResponseBody
	public List<InvertMsg> findgridInvertMsgById(Integer DeviceID) throws Exception{
		return dboService.findgridInvertMsgById(DeviceID);
	}
	/*
	 * 导出excel表的控制器
	 */
	@RequestMapping("/exprotAccountList")  
    public void exportExcel(HttpSession session,HttpServletRequest request,HttpServletResponse response,@RequestParam(value="flag") String flag){  
		List<Device> flowList1 =new ArrayList<Device>();
		List<NoinvertMsg> flowList2=new ArrayList<NoinvertMsg>();
		List<InvertMsg> flowList3 =new ArrayList<InvertMsg>();
		DateVo dateVo=new DateVo();
		UserVo userVo=new UserVo();
		userVo.setKey(key);
		SimpleDateFormat formatter=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
        if(flag.equals("1")){
	        int[] ds_format = { 2, 2, 2, 2, 2, 2, 2, 2, 2, 2};  
			String[] excelHeader = { "通讯模块SN", "站点名称", "设备SN号","设备状态","手机号","安装地点","安装日期","管理员","是否为并网设备","是否注册"};
	        String[] ds_titles = { "userDTU", "name", "Invert_SN","state","phone","place","placeTime","manager","grid","isRegisted"};  
			//date转换成字符串
	        try{  
	            flowList1 = dboService.findDevice(userVo);  
	            List<Map<String,Object>> data = new ArrayList<Map<String,Object>>();  
	            if(CollectionUtils.isNotEmpty(flowList1)){  
	                for(Device device : flowList1){  
	                    Map<String,Object> map = new HashMap<String,Object>();  
	                    map.put("userDTU",device.getUser().getUserDTU());  
	                    map.put("name",device.getUser().getName());  
	                    map.put("Invert_SN",device.getInvert_SN() );  
	                    if(device.getState()==1)
	                    map.put("state","在线" );
	                    else
	                    map.put("state","不在线" );	
	                    map.put("phone",device.getPhone() );  
	                    map.put("place",device.getPlace() ); 
	                    //将date转换成String 格式插入xls表
	                    map.put("placeTime",formatter.format(device.getPlaceTime()) );  
	                    map.put("manager",device.getManager() );  
	                    if(device.getUser().getGrid()==1)
	                        map.put("grid","并网" );
	                        else
	                        map.put("grid","离网" );	
	                    if(device.getUser().getGrid()==1)
	                    	map.put("isRegisted","已注册" );  
	                        else
	                        map.put("isRegisted","未注册");  
	                       data.add(map);  
	                }  
	            }  
	            ExcelUtils.export("站点查询", "设备表", excelHeader, ds_titles, ds_format, null, data, request, response);  
	        }catch(Exception e){  
	            
	        }  
        } 
        else if(flag.equals("2") || flag.equals("3")){
        	System.out.println(",,,,,,,,,,,,,,,,,"+flag);
            String[] excelHeader = { "通讯模块SN", "站点名称","时间","PV电压", "蓄电池电压", "A通道电流", "B通道电流", "充电总电流", "当前温度", "充电功率", "放电功率", "蓄电池容量", "充电状态", "负载状态", "放电电流", "过放次数", "充电总瓦时数", "放电总瓦时数", "蓄电池温度","错误码"};
            String[] ds_titles = { "userDTU", "name","receivetime","vpv", "vxdc", "ia", "ib", "itotal", "temperature", "pc", "pd", "batteryCap", "chargeState", "loadState", "idis", "distime", "chargeKWH", "disKWH", "batteryTemperature", "ErrorMsg"};  
            String t=null;//设置文件名
            int[] ds_format = { 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2};
    		//date转换成字符串
            try{ 
            	if(flag.equals("2")){
            	flowList2 = dboService.findoff_gridInvertMsg(userVo);
            	t="离网查询之全局监控";
            	}
            	else{
            	flowList2 = dboService.findDateNIMsg(dateVos);
            	t="离网查询之数据查询";
            	}
                List<Map<String,Object>> data = new ArrayList<Map<String,Object>>();  
                if(CollectionUtils.isNotEmpty(flowList2)){  
                    for(NoinvertMsg ninvertMsg : flowList2){  
                        Map<String,Object> map = new HashMap<String,Object>();  
                        map.put("userDTU",ninvertMsg.getUser().getUserDTU());  
                        map.put("name",ninvertMsg.getUser().getName());  
                        map.put("vpv",ninvertMsg.getVpv());  
                        map.put("vxdc",ninvertMsg.getVxdc() );
                        map.put("ia",ninvertMsg.getIa() );	
                        map.put("ib",ninvertMsg.getIb() );  
                        map.put("itotal",ninvertMsg.getItotal() ); 
                        //将date转换成String 格式插入xls表
                        map.put("receivetime",formatter.format(ninvertMsg.getReceivetime()) );  
                        map.put("temperature",ninvertMsg.getTemperature());  
                        map.put("pc",ninvertMsg.getPc() );
                        map.put("pd",ninvertMsg.getPd() );	
                        map.put("batteryCap",ninvertMsg.getBatterycap() );  
                        map.put("chargeState",ninvertMsg.getChargestate()); 
                        map.put("loadState",ninvertMsg.getLoadstate());  
                        map.put("idis",ninvertMsg.getIdis());  
                        map.put("distime",ninvertMsg.getDistime());  
                        map.put("chargeKWH",ninvertMsg.getChargekwh());  
                        map.put("disKWH",ninvertMsg.getDiskwh());  
                        map.put("batteryTemperature",ninvertMsg.getBatterytemperature());  
                        map.put("ErrorMsg",ninvertMsg.getErrormsg());  
                         data.add(map);  
                    }  
                }  
                ExcelUtils.export(t, "数据表", excelHeader, ds_titles, ds_format, null, data, request, response);  
            }catch(Exception e){  
                
            }  
        }
	}
	/*
	 * 数据查询功能前端控制器
	 */
	@RequestMapping(value="/queryDateIM")
	@ResponseBody
	public AjaxJson queryDateIM(HttpServletRequest request,@ModelAttribute DateVo dateVo ,@RequestParam(value="grid") String grid) throws Exception{
		int pageIndex=Integer.parseInt(request.getParameter("pageIndex"));
		int pageSize=Integer.parseInt(request.getParameter("pageSize"));
		int start = pageIndex * pageSize;  
        int end = start + pageSize; 
        dateVo.setStart(start);
        dateVo.setEnd(end);
        dateVos=dateVo;
        AjaxJson a = new AjaxJson();
        System.out.println("************"+grid);
        //判断是离网还是并网
        if(grid.equals("1")){
		List<InvertMsg> invertMsgs = dboService.findDateIMsg(dateVo);
		a.setData(invertMsgs);
		a.setTotal(dboService.countDateIMsg(dateVo));
		}
        else{
        	List<NoinvertMsg> ninvertMsgs = dboService.findDateNIMsg(dateVo);
    		a.setData(ninvertMsgs);
    		a.setTotal(dboService.countDateNIMsg(dateVo));
        }
		return a;
	}
}

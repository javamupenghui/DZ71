package com.prj.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class ChartController {
	
	static List<Map<String,Object>> json=new ArrayList<Map<String,Object>>();
	
	public ChartController(){
			Map<String,Object> map=new HashMap<String, Object>();
			map.put("value", 99);
			map.put("name", "邮件营销");
			json.add(map);
		
			Map<String,Object> map1=new HashMap<String, Object>();
			map1.put("value", 4);
			map1.put("name", "直接访问");
			json.add(map1);
			
			
			Map<String,Object> map2=new HashMap<String, Object>();
			map2.put("value", 33);
			map2.put("name", "搜索引擎");
			json.add(map2);
	}
	@ResponseBody
	@RequestMapping("/show")
	public List<Map<String,Object>> show(){
		
		return json;
	}
	
	
}

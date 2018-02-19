package com.pcf.readlog.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pcf.readlog.service.PcfLogService;

@Controller
public class PcfLogController {
	
	@Autowired
	private PcfLogService pcfLogService;
	
	@RequestMapping("/")
	public String getPcfApplications(Map<String,Object> model){
		model.put("appDetailsMap", pcfLogService.getApplicationDetails());
		
		
		return "index";  
	}

}

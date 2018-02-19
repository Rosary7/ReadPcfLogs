package com.pcf.readlog.restcontroller;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.pcf.readlog.model.PcfAppDetails;
import com.pcf.readlog.service.PcfLogService;

@RestController
public class PcfLogRestController {
	
	private static final Logger logger = LoggerFactory.getLogger(PcfLogRestController.class);
	
	@Autowired
	private PcfLogService pcfLogService;
	
	@GetMapping("/applicationDetails")
	public Map<String,PcfAppDetails>  getApplicationDetails(){
		logger.info("----------- : getApplicationDetails() : START");
		return pcfLogService.getApplicationDetails();
	}
      
	@GetMapping("/logs")
	public String getLog(@RequestParam(value="appName")String appName){
		logger.info("----------- : getLog() : START");
		 
		return pcfLogService.getLogMessage(appName);
	}
	
}

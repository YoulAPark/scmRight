package kr.happyjob.study.admstd.controller;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admstd/")
public class AdmstdSupInfoController {
	
	// Set logger
	private final Logger logger = LogManager.getLogger(this.getClass());

	// Get class name for logger
	private final String className = this.getClass().toString();
		
	@RequestMapping("admstdSupInfo.do")
	public String AdmstdSupInfo() throws Exception {
		logger.info("+ Start " + className + ".initApproval");
		logger.info("+ End " + className + ".initApproval");
		return "admstd/admstdSupInfo";
	}

}

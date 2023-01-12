package kr.happyjob.study.admstd.controller;

import java.util.HashMap;
import java.util.Map;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admstd/")
public class AdmstdNoticeController {

	// Set logger
	private final Logger logger = LogManager.getLogger(this.getClass());

	// Get class name for logger
	private final String className = this.getClass().toString();
		
	// 단순 네비게이션
	@RequestMapping("admstdNotice.do")
	public String AdmstdNotice() throws Exception {
		logger.info("+ Start " + className + ".initApproval");
		logger.info("+ End " + className + ".initApproval");
		return "admstd/admstdNotice";
	}
	               
}

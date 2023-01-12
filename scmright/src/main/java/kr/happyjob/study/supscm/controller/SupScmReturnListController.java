package kr.happyjob.study.supscm.controller;

import java.util.Map;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.happyjob.study.supscm.service.SupScmReturnListService;

@Controller
@RequestMapping("/supscm/")
public class SupScmReturnListController {
	
	
	
	@Autowired
	SupScmReturnListService supscmreturnlistService;

	// Set logger
	private final Logger logger = LogManager.getLogger(this.getClass());

	
	
	@RequestMapping("/SupScmReturnList")
	public String test(@RequestParam Map<String, Object> paramMap) throws Exception {
		
		//supscmreturnlistService.selectSupScmReturnListMode(paramMap);
		
		
		return "supscm/SupScmReturnList";

	}

	

}

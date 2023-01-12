package kr.happyjob.study.supscm.controller;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.happyjob.study.supscm.service.SupScmOrderListService;

@Controller
@RequestMapping("/supscm/")
public class SupScmOrderListController {
	
	
//	@Autowired
//	SupScmOrderListService supscmorderlistService;

	// Set logger
	private final Logger logger = LogManager.getLogger(this.getClass());

	
	@RequestMapping("/SupScmOrderList")
	public String test() throws Exception {
		
		
		return "supscm/SupScmOrderList";

	}
	
	

}

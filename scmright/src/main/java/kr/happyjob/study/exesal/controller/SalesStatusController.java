package kr.happyjob.study.exesal.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.happyjob.study.exesal.model.SalesStatusModel;
import kr.happyjob.study.exesal.service.SalesStatusService;



	@Controller
	@RequestMapping("/exesal/")
	public class SalesStatusController {
		 
		@Autowired
		SalesStatusService salesStatusService;
		
		// Set logger
		private final Logger logger = LogManager.getLogger(this.getClass());

		// Get class name for logger
		private final String className = this.getClass().toString();
	
	
	/**
	 * 초기화면
	 */
	@RequestMapping("salesStatus.do")
	public String salesStatus(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
	
		logger.info("+ Start " + className + ".salesStatus");
		logger.info("   - paramMap : " + paramMap);
		logger.info("+ End " + className + ".salesStatus");
		
		
		return "exesal/salesStatus";
	}
	
	@RequestMapping("salesStatusList.do")
	public String salesStatusList(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		logger.info("+ Start " + className + ".salesStatusList");
		logger.info("   - paramMap : " + paramMap);
		
		int clickpagenum = Integer.parseInt( String.valueOf(paramMap.get("clickpagenum"))) ;   
		int pagesize = Integer.parseInt( String.valueOf(paramMap.get("pagesize"))) ;  
		int startnum = (clickpagenum - 1) * pagesize;
		
		paramMap.put("startnum", startnum);
		paramMap.put("pagesize", pagesize);
		
		List<SalesStatusModel>searchlist = salesStatusService.salesStatusList(paramMap);
		
		model.addAttribute("searchlist", searchlist);
		
		int searchlistcnt = salesStatusService.searchlistcnt(paramMap);
		
		model.addAttribute("searchlistcnt", searchlistcnt);
		
		logger.info("+ End " + className + ".salesStatusList");
		
		
		return  "exesal/salesStatusList";	
		
		
		
	}
	
	@RequestMapping("salesStatusDetailList.do")
	public String salesStatusDetailList(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		System.err.println(paramMap);
		
		logger.info("+ Start " + className + ".salesStatusDetailList");
		logger.info("   - paramMap : " + paramMap);
		
		int clickpagenum = Integer.parseInt( String.valueOf(paramMap.get("clickpagenum"))) ;   
		int pagesize = Integer.parseInt( String.valueOf(paramMap.get("pagesize"))) ;  
		int startnum = (clickpagenum - 1) * pagesize;
		
		paramMap.put("startnum", startnum);
		paramMap.put("pagesize", pagesize);
		
		List<SalesStatusModel> searchlist = salesStatusService.salesStatusDetailList(paramMap);
		
		System.out.println(searchlist.size());
		model.addAttribute("searchlist2", searchlist);
		
		int searchlistcnt2 = salesStatusService.searchlistcnt2(paramMap);
		
		model.addAttribute("searchlistcnt2", searchlistcnt2);
		
		logger.info("+ End " + className + ".salesStatusDetailList");
		
		
		return  "exesal/salesStatusDetailList";	
		
		
		
	}
	
	
	
	
	
	}
	


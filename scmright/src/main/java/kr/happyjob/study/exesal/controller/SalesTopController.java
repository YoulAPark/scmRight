package kr.happyjob.study.exesal.controller;

import java.util.HashMap;
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
import org.springframework.web.bind.annotation.ResponseBody;

import kr.happyjob.study.exesal.model.SalesStatusModel;
import kr.happyjob.study.exesal.model.SalesTopModel;
import kr.happyjob.study.exesal.service.SalesTopService;



	@Controller
	@RequestMapping("/exesal/")
	public class SalesTopController {
		 
		@Autowired
		SalesTopService salesTopService;
		
		// Set logger
		private final Logger logger = LogManager.getLogger(this.getClass());

		// Get class name for logger
		private final String className = this.getClass().toString();
	
	
	/**
	 * 화면단
	 */
	@RequestMapping("salesTop.do")
	public String salesTop(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
	
		logger.info("+ Start " + className + ".salesTop");
		logger.info("   - paramMap : " + paramMap);
		logger.info("+ End " + className + ".salesTop");
		
		return "exesal/salesTop";
		
		
	}
	
	@RequestMapping("salesTopList.do")
	public String salesTopList(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		logger.info("+ Start " + className + ".salesTopList");
		logger.info("   - paramMap : " + paramMap);
		
		int clickpagenum = Integer.parseInt( String.valueOf(paramMap.get("clickpagenum"))) ;   
		int pageSize = Integer.parseInt( String.valueOf(paramMap.get("pageSize"))) ;  
		int startnum = (clickpagenum - 1) * pageSize;
		
		paramMap.put("startnum", startnum);
		paramMap.put("pageSize", pageSize);
		
		List<SalesTopModel>searchlist = salesTopService.salesTopList(paramMap);
		
		model.addAttribute("searchlist", searchlist);
		
//		int searchlistcnt = salesTopService.searchlistcnt(paramMap);
//		
//		model.addAttribute("searchlistcnt", searchlistcnt);
		
		logger.info("+ End " + className + ".salesTopList");
		
		
		return  "exesal/salesTopList";	
		
		
		
	}

	
	



		
		
		
		
	}

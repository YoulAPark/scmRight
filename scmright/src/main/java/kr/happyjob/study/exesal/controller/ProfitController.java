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

import kr.happyjob.study.exesal.model.ProfitModel;
import kr.happyjob.study.exesal.model.SalesStatusModel;
import kr.happyjob.study.exesal.service.ProfitService;

@Controller
@RequestMapping("/exesal/")
public class ProfitController {

	@Autowired
	ProfitService  profitService;
	
	// Set logger
	private final Logger logger = LogManager.getLogger(this.getClass());

	// Get class name for logger
	private final String className = this.getClass().toString();
	
	/**
	 * 초기화면
	 */
	@RequestMapping("profit.do")
	public String salesStatus(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
	
		logger.info("+ Start " + className + ".profit");
		logger.info("   - paramMap : " + paramMap);
		logger.info("+ End " + className + ".profit");
		
		
		return "exesal/profit";
	}
	
	@RequestMapping("profitList.do")
	public String profitList(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		logger.info("+ Start " + className + ".profitList");
		logger.info("   - paramMap : " + paramMap);
		
		int clickpagenum = Integer.parseInt( String.valueOf(paramMap.get("clickpagenum"))) ;   
		int pagesize = Integer.parseInt( String.valueOf(paramMap.get("pagesize"))) ;  
		int startnum = (clickpagenum - 1) * pagesize;
		
		paramMap.put("startnum", startnum);
		paramMap.put("pagesize", pagesize);
		
		List<ProfitModel>searchlist = profitService.profitList(paramMap);
		
		model.addAttribute("searchlist", searchlist);
		
		int searchlistcnt = profitService.searchlistcnt(paramMap);
		
		model.addAttribute("searchlistcnt", searchlistcnt);
		
		logger.info("+ End " + className + ".profitList");
		
		
		return  "exesal/profitList";	
		
		
		
	}
	
	
	@RequestMapping("profitDetailList.do")
	public String profitDetailList(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		System.err.println(paramMap);
		
		logger.info("+ Start " + className + ".profitDetailList");
		logger.info("   - paramMap : " + paramMap);
		
		int clickpagenum = Integer.parseInt( String.valueOf(paramMap.get("clickpagenum"))) ;   
		int pagesize = Integer.parseInt( String.valueOf(paramMap.get("pagesize"))) ;  
		int startnum = (clickpagenum - 1) * pagesize;
		
		paramMap.put("startnum", startnum);
		paramMap.put("pagesize", pagesize);
		
		List<ProfitModel> searchlist = profitService.profitDetailList(paramMap);
		
		System.out.println(searchlist.size());
		model.addAttribute("searchlist", searchlist);
		
		int searchlistcnt2 = profitService.searchlistcnt2(paramMap);
		
		model.addAttribute("searchlistcnt", searchlistcnt2);
		
		logger.info("+ End " + className + ".profitDetailList");
		
		
		return  "exesal/profitDetailList";	
		
		
		
	}
	
}

package kr.happyjob.study.admstd.controller;

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

import kr.happyjob.study.admstd.model.AdmstdStrMngModel;
import kr.happyjob.study.admstd.service.AdmstdStrMngService;

@Controller
@RequestMapping("/admstd/")
public class AdmstdStrMngController {
	
	@Autowired
	AdmstdStrMngService strMngService;
	// Set logger
	private final Logger logger = LogManager.getLogger(this.getClass());

	// Get class name for logger
	private final String className = this.getClass().toString();
			
	@RequestMapping("admstdStrMng.do")
	public String AdmstdStrMng() throws Exception {
		logger.info("+ Start " + className + ".initApproval");
		logger.info("+ End " + className + ".initApproval");
		return "admstd/admstdStrMng";
	}
	
	// 1. [SELECT] 리스트 전체 출력
	@RequestMapping("admstdStrList.do")
	public String admstdStrList(Model model, @RequestParam Map<String,Object> map) throws Exception {
		logger.info("Start " + className + ".admstdStrList");
		
		int currentPage = Integer.parseInt((String)map.get("currentPage"));	
		int pageSize = Integer.parseInt((String)map.get("pageSize"));	
		int pageIndex = (currentPage-1)*pageSize;	
		
		map.put("pageIndex", pageIndex);
		map.put("pageSize", pageSize);
		
		List<AdmstdStrMngModel> list = strMngService.admstdStrList(map);
		model.addAttribute("list", list);
		
		int totalCount = strMngService.admstdCnt();
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("totalCount", totalCount);

		logger.info("End " + className + ".admstdStrList");
		return "admstd/admstdStrMngList";
	}

//	// 2. [SELECT] 단 건 출력
//	public List<AdmstdStrMngModel> admstdStrOne() throws Exception {
//		logger.info("Start " + className + ".admstdStrOne");
//		List<AdmstdStrMngModel> list = strMngService.admstdStrOne();
//		logger.info("End " + className + ".admstdStrOne");
//		return list;
//	}
//
//	// 3. [SELECT] count 출력
//	public void admstdCnt() throws Exception {
//		logger.info("Start " + className + ".admstdCnt");
//		strMngService.admstdCnt();
//		logger.info("End " + className + ".admstdCnt");
//	}
//
//	// 4. [INSERT] 창고 등록
//	public void admstdAdd() throws Exception {
//		logger.info("Start " + className + ".admstdAdd");
//		strMngService.admstdAdd();
//		logger.info("End " + className + ".admstdAdd");
//	}
//
//	// 5. [UPDATE] 창고 수정
//	public void admstdUpdate() throws Exception {
//		logger.info("Start " + className + ".admstdUpdate");
//		strMngService.admstdUpdate();
//		logger.info("End " + className + ".admstdUpdate");
//	}
//
//	// 6. [DELETE] 창고 삭제
//	public void admstdDel() throws Exception {
//		logger.info("Start " + className + ".admstdDel");
//		strMngService.admstdDel();
//		logger.info("End " + className + ".admstdDel");
//	}
//
//	// 7. [SELECT] 로그인아이디 검색
//	public List<AdmstdStrMngModel> searchId() throws Exception {
//		logger.info("Start " + className + ".searchId");
//		List<AdmstdStrMngModel> list = strMngService.searchId();
//		logger.info("End " + className + ".searchId");
//		return list;
//	}
//
	// 8. [SELECT] 이름 검색	
	@RequestMapping("searchName.do")
	public String searchName(@RequestParam("name") String name) throws Exception {
		logger.info("Start " + className + ".searchName");
		List<AdmstdStrMngModel> list = strMngService.searchName(name);
		logger.info("End " + className + ".searchName");
		return "admstd/admstdStrMngList";
	}

}

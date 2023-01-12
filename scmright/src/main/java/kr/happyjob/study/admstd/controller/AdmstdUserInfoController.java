package kr.happyjob.study.admstd.controller;

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

import kr.happyjob.study.admstd.model.AdmstdUserInfoModel;
import kr.happyjob.study.admstd.service.AdmstdUserInfoService;

@Controller
@RequestMapping("/admstd/")
public class AdmstdUserInfoController {
	
	@Autowired
	AdmstdUserInfoService userInfoService;
	
	// Logger Set 해당 클래스의 loger를 가져옴
	// System.out.println과는 다르게 에러발생시 추적이 가능한 정보들을 확인할 수 있음
	private final Logger logger = LogManager.getLogger(this.getClass());

	// className
	private final String className = this.getClass().toString();
	
	// 단순네비게이션
	// admstdUserInfo.jsp 
	@RequestMapping("admstdUserInfo.do")
	public String admstdUserInfo() throws Exception {
		logger.info("Start " + className + ".initApproval");
		logger.info("End " + className + ".initApproval");
		return "admstd/admstdUserInfo";
	}
	
	// 유저리스트 출력 : listUsers
	@RequestMapping("listUsers.do")
	public String listUsers(Model model, 
				@RequestParam Map<String,Object> map, HttpServletRequest request,
							HttpServletResponse response, HttpSession session) throws Exception {
										// @RequestParam으로 function userList의 param을 가져옴
										// @RequestParam map : {searchKey=all, searchInput=, basicNavi=1, currentPage=1, pageSize=10}
		// Start logger
		logger.info("Start " + className + ".initApproval");
		
		// 페이징처리 - common.js - function getPaginationHtml 확인
		int currentPage = Integer.parseInt((String)map.get("currentPage"));	// 현재 페이지 번호
		System.out.println("currentPage : "+currentPage);
		int pageSize = Integer.parseInt((String)map.get("pageSize"));		// 페이지 사이즈
		System.out.println("pageSize : "+pageSize);
		int pageIndex = (currentPage-1)*pageSize;							// 페이지 시작하는 번호
		System.out.println("pageIndex : "+pageIndex);
		// map에 pageIndex, pageSize를 담음
		map.put("pageIndex", pageIndex);
		map.put("pageSize", pageSize);

		// 1. 회원 목록 뿌려주기
		// userInfoService.listUsers를 불러와 jsp에 전달하기 위해 model에 담는다.
		List<AdmstdUserInfoModel> list = userInfoService.listUsers(map);
		model.addAttribute("list", list);
		
		// 2. paging 처리를 위한 회원 수 counting
		// countUser() 불러와서 model에 담음
		// userInfoService.listUsers를 불러와 jsp에 전달하기 위해 model에 담는다.
		int totalCount = userInfoService.countUser();
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("currnetPage", currentPage);
		// End logger
		logger.info("End " + className + ".initApproval");
		
		// admstdUserInfoList.jsp 로 리턴하기
		return "admstd/admstdUserInfoList";
	}
	
	@RequestMapping("detailUser.do")
	@ResponseBody
	public Map<String, Object> detailUser(@RequestParam("loginID") String loginId) throws Exception {
		List<AdmstdUserInfoModel> list = userInfoService.detailUser(loginId);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);		
		return map;
	}
}

package kr.happyjob.study.exeacc.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.happyjob.study.exeacc.dao.RefundConfirmDao;
import kr.happyjob.study.exeacc.model.RefundConfirmModel;
import kr.happyjob.study.exeacc.service.RefundConfirmService;

@Controller
@RequestMapping("/exeacc/")
public class RefundConfirmController {

	private final Logger logger = LogManager.getLogger(this.getClass());
	private final String className = this.getClass().toString();

	@Resource(name="RefundConfirmServiceImpl")
	private RefundConfirmService refundConfirmService;
	
	
	// 0. 초기화면으로이동.
	@RequestMapping("refundConfirm.do")
	private String refundConfirm() {

		logger.info("+ Start " + className + ".initRefundConfirm");  ////className???? 

		return "exeacc/refundConfirm";
	}

	 //1. 임원 승인 전 반품 신청 목록  ajax통신 반품 관련 내역 리스트 조회 
	@RequestMapping("refundConfirmList.do")
	public String refundConfirmList(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		logger.info("+ Start " + className + ".refundConfirmList");
		
		int currentPage = Integer.parseInt((String)paramMap.get("currentPage")); // 현재페이지 
		int pageSize = Integer.parseInt((String)paramMap.get("pageSize"));
		int pageIndex = (currentPage -1)*pageSize;
		
		paramMap.put("pageIndex", pageIndex);
		paramMap.put("pageSize", pageSize);
		
		logger.info("   - paramMap : " + paramMap);
		
		//임원 승인 전 반품 목록 실질 조회
		List<RefundConfirmModel> refundConfirmList = refundConfirmService.selectBeforeApproveRefundList(paramMap);
		model.addAttribute("refundConfirmList", refundConfirmList);
		model.addAttribute("paramMap", paramMap);
		
		
		//반품 목록 총 갯수
		int totalCnt = refundConfirmService.countBeforeApprovePurchaseList(paramMap);
		model.addAttribute("totalCnt", totalCnt);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("currentPage", currentPage);
		
		logger.info("+ END " + className + ".selectRefundList");
		
		return "exeacc/refundConfirmList";
	}
	
	//임원이 최종적으로 승인 버튼 누른다. ->인서트, 업데이트 테이블2개 
	@RequestMapping("clickCeoRefundConfirm.do")
	public void clickCeoRefundConfirm(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
	logger.info("+ Start " + className + ".updateRefundWareNo");
			
		
	refundConfirmService.clickCeoRefundConfirm(paramMap);

	}		
	
}

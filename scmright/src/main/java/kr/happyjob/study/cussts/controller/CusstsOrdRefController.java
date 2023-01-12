package kr.happyjob.study.cussts.controller;

import java.time.LocalDate;
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
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.happyjob.study.cussts.model.CusstsOrderModel;
import kr.happyjob.study.cussts.service.CusstsOrdRefService;

@Controller
@RequestMapping("/cussts")
public class CusstsOrdRefController {

		// Set logger
		private final Logger logger = LogManager.getLogger(this.getClass());

		// Get class name for logger
		private final String className = this.getClass().toString();
		
		@Autowired
		CusstsOrdRefService cusstsOrdRefService;
		
		
		@GetMapping("/orderList.do")
		public String orderListInit(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
				HttpServletResponse response, HttpSession session) throws Exception{
			
			logger.info("+ Start " + className + ".orderList");
			logger.info("   - paramMap : " + paramMap);
			LocalDate now = LocalDate.now();
			  
			  model.addAttribute("now",now);
			
			
			return "cussts/order";
			
		}
		
		
		
		//파라미터로 넘긴 값 mapper에서 사용 
		//제품 목록 조회
		@PostMapping("/orderList.do")
		public String orderList(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
				HttpServletResponse response, HttpSession session) throws Exception{
			
			logger.info("+ Start " + className + ".orderList");
			logger.info("   - paramMap : " + paramMap);
			
			String loginID = (String)session.getAttribute("loginId");
			
			paramMap.put("loginID", loginID);
			
			int currentPage = Integer.parseInt((String)paramMap.get("currentPage"));	// 현재 페이지 번호
			int pageRow = Integer.parseInt((String)paramMap.get("pageRow"));			// 한 페이지에 보여지는 게시글 수 
			int pageStartN = (currentPage-1)*pageRow;												// 페이지 시작 row 번호
			// cp 2 (2-1)*5 = 5 
			
			paramMap.put("pageStartN", pageStartN);
			paramMap.put("pageRow", pageRow);
			
			List<CusstsOrderModel> orderList = cusstsOrdRefService.selectOrder(paramMap);
			int selectOrderCnt = cusstsOrdRefService.selectOrderCnt(paramMap);
			model.addAttribute("orderList", orderList);
			model.addAttribute("totalOrderCnt", selectOrderCnt);
			
			model.addAttribute("pageRow", pageRow);
			model.addAttribute("currentPageProductList",currentPage);
			
			logger.info(" End " + className + ".orderList");
			return "cussts/orderList";
			
		}
		
/*		@GetMapping("/orderDetail.do")
		public String orderDetailInit(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
				HttpServletResponse response, HttpSession session) throws Exception{
			
			logger.info("+ Start " + className + ".orderDetail");
			logger.info("   - paramMap : " + paramMap);
			
			return "cussts/order";
			
		}*/
		
		//주문 내역 상세 보기
		@PostMapping("/orderDetail.do")
		public String orderDetail(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
				HttpServletResponse response, HttpSession session) throws Exception{
			
			logger.info("+ Start " + className + ".orderDetail");
			logger.info("   - paramMap : " + paramMap);
			
			String loginID = (String)session.getAttribute("loginId");
			paramMap.put("loginID", loginID);

			
			CusstsOrderModel orderDetail = cusstsOrdRefService.selectOrderDetail(paramMap);
			model.addAttribute("orderDetail", orderDetail);
			
			logger.info(" End " + className + ".orderDetail");
			return "cussts/orderDetail";
		}
		
		//반품을 위한 반품 내역 상세보기 모달창
		@PostMapping("/refundDetail.do")
		@ResponseBody
		public Map<String,Object> refundDetail(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
				HttpServletResponse response, HttpSession session) throws Exception{
			
			logger.info("+ Start " + className + ".refundDetail");
			logger.info("   - paramMap : " + paramMap);
			
			String loginID = (String)session.getAttribute("loginId");
			paramMap.put("loginID", loginID);
			
			CusstsOrderModel refundDetail = cusstsOrdRefService.selectOrderDetail(paramMap);
		
			
			Map<String,Object> resultMap = new HashMap<>();
			resultMap.put("refundDetail",refundDetail);
			
			logger.info(" End " + className + ".refundDetail");
			return resultMap;
		}
		
		
		@PostMapping("/addRefund.do")
		@ResponseBody
		public Map<String,Object> addRefund(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
				HttpServletResponse response, HttpSession session) throws Exception{
			
			logger.info("+ Start " + className + ".addRefund");
			logger.info("   - paramMap : " + paramMap);
			
			String loginID = (String)session.getAttribute("loginId");
			paramMap.put("loginID", loginID);
			
			int refundResult = cusstsOrdRefService.insertRefund(paramMap);
			int updateCoSts = cusstsOrdRefService.updateCoSts(paramMap);
			
			
			Map<String,Object> resultMap = new HashMap<>();
			resultMap.put("refundResult", refundResult);
			resultMap.put("updateCoSts", updateCoSts);
			
			logger.info(" End " + className + ".addRefund");
			return resultMap;
		}
		
		
		
		
		
	
}

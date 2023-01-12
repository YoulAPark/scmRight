package kr.happyjob.study.admtrd.controller;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.happyjob.study.admtrd.model.AdmstdOrderDetailsVo;
import kr.happyjob.study.admtrd.model.AdmstdOrderVo;
import kr.happyjob.study.admtrd.service.AdmstdOrderDetailsService;

@Controller
@RequestMapping("admtrd/")
public class AdmstdOrderDetailsController {
	
	@Autowired
	private AdmstdOrderDetailsService admstdOrderDetailsService;
	
	// Set logger
	private final Logger logger = LogManager.getLogger(this.getClass());

	// Get class name for logger
	private final String className = this.getClass().toString();
	
	@RequestMapping("AdmstdOrderDetails.do")
	public String AdmstdOrderDetails(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) {
		
		logger.info("+ Start " + className + ".listComnGrpCod");
		logger.info("   - paramMap : " + paramMap);
		
		LocalDate nowTime = LocalDate.now();
		
		model.addAttribute("nowTime", nowTime);
		
		logger.info("+ End " + className + ".listComnGrpCod");
		
		return "admtrd/AdmstdOrderDetails";
	}
	
	//AdmstdOrderDetailsList JSP 진입
	@RequestMapping("AdmstdOrderDetailsList.do")
	public String AdmstdOrderDetailsList(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) {
		
		logger.info("+ Start " + className + ".listComnGrpCod");
		logger.info("   - paramMap : " + paramMap);
		
		int clickpagenum = Integer.parseInt( String.valueOf(paramMap.get("clickpagenum"))) ;   
		int pagesize = Integer.parseInt( String.valueOf(paramMap.get("pagesize"))) ;  
		int startnum = (clickpagenum - 1) * pagesize;
		
		paramMap.put("startnum", startnum);
		paramMap.put("pagesize", pagesize);
		
		List<AdmstdOrderDetailsVo> list = admstdOrderDetailsService.getOderList(paramMap);
		
		int searchlistcnt = admstdOrderDetailsService.searchlistcnt(paramMap);
		
		logger.info("   - list : " + list);
		
		model.addAttribute("list", list);
		model.addAttribute("searchlistcnt", searchlistcnt);
		
		logger.info("+ End " + className + ".listComnGrpCod");
		
		return "admtrd/AdmstdOrderDetailsList";
	}
	
	//배송지시서 진입
	@RequestMapping("shipping.do")
	@ResponseBody
	public Map<String, Object> AdmstdOrderDetailsSingle(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) {
		logger.info("+ Start " + className + ".listComnGrpCod");
		logger.info("   - paramMap : " + paramMap);
		
		AdmstdOrderDetailsVo result = admstdOrderDetailsService.getshipping(paramMap);
		
		Map<String, Object> returnmap = new HashMap<String, Object>();
		
		returnmap.put("result", result);
		
		logger.info("   - result : " + result);
		logger.info("   - returnmap : " + returnmap);
		
		logger.info("+ End " + className + ".listComnGrpCod");
		
		return returnmap;
	}
	
	//발주 지시서 진입
	@RequestMapping("order.do")
	@ResponseBody
	public Map<String, Object> Admstdorder(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) {
		logger.info("+ Start " + className + ".listComnGrpCod");
		logger.info("   - paramMap : " + paramMap);
		
		AdmstdOrderVo result = admstdOrderDetailsService.getOrder(paramMap);
		
		
		String loginId = (String) session.getAttribute("loginId").toString();
		
		Map<String, Object> returnmap = new HashMap<String, Object>();
		
		returnmap.put("result", result);
		returnmap.put("loginId", loginId);
		
		logger.info("   - loginId : " + loginId);
		logger.info("   - result : " + result);
		logger.info("   - returnmap : " + returnmap);
		
		logger.info("+ End " + className + ".listComnGrpCod");
		
		return returnmap;
	}
	
	//swhall 재고량
	@RequestMapping("storCnt.do")
	@ResponseBody
	public Map<String, Object> sstorCnt(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) {
		logger.info("+ Start " + className + ".listComnGrpCod");
		logger.info("   - paramMap : " + paramMap);
		
		int result = admstdOrderDetailsService.getwhallCnt(paramMap);
			
		Map<String, Object> returnmap = new HashMap<String, Object>();
		
		returnmap.put("result", result);
		
		logger.info("   - result : " + result);
		
		logger.info("+ End " + className + ".listComnGrpCod");
		
		return returnmap;
	}
	
	//배송담당자 가져오기
	@RequestMapping("getDelivery.do")
	@ResponseBody
	public Map<String, Object> getDelivery(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) {
		logger.info("+ Start " + className + ".listComnGrpCod");
		logger.info("   - paramMap : " + paramMap);
		
		String result = admstdOrderDetailsService.getDelivery(paramMap);
			
		Map<String, Object> returnmap = new HashMap<String, Object>();
		
		returnmap.put("result", result);
		
		logger.info("   - result : " + result);
		
		logger.info("+ End " + className + ".listComnGrpCod");
		
		return returnmap;
	}
	
	//배송지시서 insert
	@RequestMapping("shippingInsert.do")
	@ResponseBody
	public Map<String, Object> shippingInsert(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) {
		logger.info("+ Start " + className + ".listComnGrpCod");
		logger.info("   - paramMap : " + paramMap);
		
		String delSts = 	"waiting"; 													//배송상태
		String strNo_ = 	String.valueOf(paramMap.get("strNo")); 						//창고 번호
		String prodNo_ = 	String.valueOf(paramMap.get("prodNo")); 					//제품 번호
		String prodCnt_ = 	String.valueOf(paramMap.get("prodCnt")); 					//수주개수
		String strNo[] = 	strNo_.split(","); 											//창고 번호
		String prodNo[] = 	prodNo_.split(","); 										//제품 번호
		String prodCnt[] = 	prodCnt_.split(","); 										//수주개수
		int coNo = 			Integer.parseInt( String.valueOf(paramMap.get("coNo"))); 	//주문번호  
		//int length = 		Integer.parseInt( String.valueOf(paramMap.get("length"))); 	//insert 갯수
		int delDsts	= 		0; 															//배송완료여부
		int resultNo = 		0;
		int result = 0;
		//int delNo = 		1 + admstdOrderDetailsService.getdelNo();					//배송번호
		//String result = "false";
		
		Map<String, Object> returnmap = new HashMap<String, Object>();
		
		for(int i = 0; i < strNo.length; i++){
			
			//paramMap.put("delNo", delNo + i);
			paramMap.put("coNo", coNo);
			paramMap.put("strNo", strNo[i]);
			paramMap.put("prodNo", prodNo[i]);
			paramMap.put("prodCnt", prodCnt[i]);
			paramMap.put("delSts", delSts);
			paramMap.put("delDsts", delDsts);
			
			result = admstdOrderDetailsService.shippingInsert(paramMap);
			
			//if(result_ > -1) resultNo += 1;
			logger.info("   - strNo.length : " + strNo.length + " resultNo : " + resultNo);
			//if(strNo.length == resultNo) result = "true";
		}
		
		returnmap.put("result", result);
		
		//logger.info("   - result : " + result);
		
		logger.info("+ End " + className + ".listComnGrpCod");
		
		return returnmap;
	}
	
	//배송 수량 가져오기
	@RequestMapping("orderCnt.do")
	@ResponseBody
	public int orderCnt(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) {
		logger.info("+ Start " + className + ".listComnGrpCod");
		logger.info("   - paramMap : " + paramMap);
		
		int result = admstdOrderDetailsService.orderCnt(paramMap);
		
		logger.info("   - result : " + result);
		
		logger.info("+ End " + className + ".listComnGrpCod");
		
		return result;
	}
	
}

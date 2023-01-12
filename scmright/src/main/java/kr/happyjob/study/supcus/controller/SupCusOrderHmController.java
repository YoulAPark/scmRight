package kr.happyjob.study.supcus.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


import kr.happyjob.study.supcus.model.SupCusOrderHmDetailModel;
import kr.happyjob.study.supcus.model.SupCusOrderHmModel;
import kr.happyjob.study.supcus.service.SupCusOrderHmService;

@Controller
@RequestMapping("/supcus/")
public class SupCusOrderHmController {

	@Autowired
	SupCusOrderHmService supcusorderhmService;
	
	

	// Set logger
	private final Logger logger = LogManager.getLogger(this.getClass());

	
	@RequestMapping("/SupCusOrderHm.do")
	public String SupCusOrderHm(@RequestParam Map<String, Object> paramMap, Model model) {
		
	return "supcus/SupCusOrderHm";
	}
	
	@RequestMapping("/SupCusOrderHmList.do")
	public String test(@RequestParam Map<String, Object> paramMap, Model model) throws Exception {

		
		int clickpagenum = Integer.parseInt(String.valueOf(paramMap.get("clickpagenum")));
		int pageSize = Integer.parseInt(String.valueOf(paramMap.get("pageSize")));
		int startnum = (clickpagenum - 1) * pageSize;
		System.out.println("잠온다!!!!!!!!"+pageSize);
		paramMap.put("startnum", startnum);
		paramMap.put("pageSize", pageSize);
		
		
	
		
		List<SupCusOrderHmModel> list = supcusorderhmService.selectProductInfo(paramMap);

		model.addAttribute("list", list);
		int searchlistcnt = supcusorderhmService.searchlistcnt(paramMap);
		
		logger.info("리스트다다다다다" + list);
		
		model.addAttribute("searchlistcnt", searchlistcnt);
		 System.out.println("점심이다다다"+searchlistcnt);
		logger.info("   - paramMap : " + paramMap);
		
		

		
		
		
		return "supcus/SupCusOrderHmList";

	}
	
	
	@RequestMapping("/selectorderlist.do")
	@ResponseBody
	public Map<String,Object> selectorderlist(@RequestParam Map<String, Object> paramMap, Model model) throws Exception{
	
		
		logger.info("orderDepositProcessingSelect.do 컨트롤러 => 구매담당자_기업고객_주문내역 단건 조회");		

		Map<String, Object> resultMap = new HashMap<>();
				
		//구매번호 별 주문 내역 단건 조회 정보
		SupCusOrderHmDetailModel SupCusOrderHmDetailModel = supcusorderhmService.selectorderlist(paramMap);
		resultMap.put("SupCusOrderHmDetailModel", SupCusOrderHmDetailModel);
		
		model.addAttribute("SupCusOrderHmDetailModel",SupCusOrderHmDetailModel);
		
		System.out.println("확인!!!!!!!!!!!!!!!"+SupCusOrderHmDetailModel);
		
		
		return resultMap;
	}
	
	
	@RequestMapping("SupCusOrderHmDetailList.do")
	public String modalOrderDepositProcessingdtl(Model model, @RequestParam Map<String, Object> paramMap) throws Exception{
			
		
//		int currentPage=Integer.parseInt((String) paramMap.get("currentPage"));
//		int pageSize=Integer.parseInt((String) paramMap.get("pageSize"));
//		int pageIndex=(currentPage-1)*pageSize;
//		
//		paramMap.put("pageIndex", pageIndex);
//		paramMap.put("pageSize", pageSize);
		

/*		int clickpagenum = Integer.parseInt(String.valueOf(paramMap.get("clickpagenum")));
		int pagesize = Integer.parseInt(String.valueOf(paramMap.get("pagesize")));
		int startnum = (clickpagenum - 1) * pagesize;
*/
/*		paramMap.put("startnum", startnum);
		paramMap.put("pagesize", pagesize);*/
		logger.info("modalOrderDepositProcessingDtl.do => paramMap : "+paramMap);		
		
		//구매번호 별 주문 내역 단건 상세 조회 정보
		List<SupCusOrderHmDetailModel> list = supcusorderhmService.selectorderdetaillist(paramMap);
		model.addAttribute("list", list);		
		
		int searchlistcnt = supcusorderhmService.searchlistcnt(paramMap);
		model.addAttribute("searchlistcnt", searchlistcnt);
	/*	model.addAttribute("clickpagenum", clickpagenum);
*/		logger.info("확인합시다!!!!!!!!!!!!"+list);
		//구매번호 별 주문 내역 단건 상세 조회 페이징 정보
		/*int modalOrderDepositProcessingDtlTotal = orderDepositProcessingService.countOrderDepositProcessingDtlList(paramMap);
		model.addAttribute("modalOrderDepositProcessingDtlTotal", modalOrderDepositProcessingDtlTotal);		*/
//		model.addAttribute("pageSize", pageSize);
//		model.addAttribute("currentPageModalOrderDepositProcessingDtl", currentPage);
				
		return "/supcus/SupCusOrderHmDetailList";
	}
	
	
	@RequestMapping("confirmDeposit.do")
	@ResponseBody
	public Map<String,Object> confirmDeposit(Model model, @RequestParam Map<String, Object> paramMap){
		
		logger.info("confirmDeposit.do 컨트롤러 => 구매담당자_기업고객_주문번호 별 입금 확인 처리");
		logger.info("confirmDeposit.do => paramMap : "+paramMap);
		
		Map<String, Object> resultMap = new HashMap<>();
		
		String result="";
		
		//해당 주문번호의 입금 확인 처리
		if(supcusorderhmService.updeateinout(paramMap) > 0) {
			result="입금확인";
		}else{
			result="에러 발생";
		}		
		
		resultMap.put("result", result);
		
		return resultMap;
	
		
	
	}
	
	

	

}

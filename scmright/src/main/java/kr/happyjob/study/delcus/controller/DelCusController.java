package kr.happyjob.study.delcus.controller;

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

import kr.happyjob.study.delcus.model.DelCusModel;
import kr.happyjob.study.delcus.service.DelCusService;

@Controller
@RequestMapping("/delcus/")
public class DelCusController {
	
	@Autowired
	DelCusService delCusService;

	// Set logger
	private final Logger logger = LogManager.getLogger(this.getClass());

	// Get class name for logger
	private final String className = this.getClass().toString();

/* ##########################################[배송지시서]########################################## */	

	// 0. 배송지시서 단순 네비게이션
	@RequestMapping("delcusDirection.do")
	public String delcusDirection() throws Exception {
		logger.info("Start " + className + ".delcusDirection");
		logger.info("End " + className + ".delcusDirection");
		return "delcus/delcusDirection";
	}
	
	// 1. Delivery 리스트 조회
	@RequestMapping("delList.do")
	public String delList(@RequestParam Map<String, Object> map, Model model) throws Exception {
		logger.info("Start " + className + ".delList");
		
		int currentPage = Integer.parseInt((String)map.get("currentPage"));	
		int pageSize = Integer.parseInt((String)map.get("pageSize"));	
		int pageIndex = (currentPage-1)*pageSize;	
		
		map.put("pageIndex", pageIndex);
		map.put("pageSize", pageSize);
		
		List<DelCusModel> list = delCusService.delList(map);
		model.addAttribute("list", list);
		
		int totalCount = delCusService.countDel();
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("totalCount", totalCount);

		logger.info("End " + className + ".delList");
		return "delcus/delcusDirectionList";
	}
		
	// 2. Delivery 단 건 조회
	@RequestMapping("delDelList.do")
	@ResponseBody
	public List<DelCusModel> delSelectOne(Model model, @RequestParam("coNo") int coNo) throws Exception {
		
		logger.info("Start " + className + ".delSelectOne");
		
		List<DelCusModel> list = delCusService.delSelectOne(coNo);
		model.addAttribute("list", list);
		System.out.println("*** list : "+list);
		
		logger.info("End " + className + ".delSelectOne");

		return list;
	}
	
	// 3. Delivery 상태 변경
	@RequestMapping("deliverySts.do")
	@ResponseBody
	public List<DelCusModel> deliverySts(@RequestParam("delNo") int delNo) throws Exception{
		
		logger.info("Start " + className + ".deliverySts");
		
		delCusService.deliverySts(delNo);		
		List<DelCusModel> list = delCusService.delSelectOne(delNo);
		
		logger.info("Start " + className + ".deliverySts");
		
		return list;
	}

/* ##########################################[반품지시서]########################################## */
	
	// 0. 반품지시서 단순 네비게이션
		@RequestMapping("delcusReturn.do")
		public String delcusReturn() throws Exception {
			logger.info("Start " + className + ".delcusDirection");
			logger.info("End " + className + ".delcusDirection");
			return "delcus/delcusReturn";
		}
		
	// 1. Return 리스트 조회
		@RequestMapping("delReturnList.do")
		public String delReturnList(@RequestParam Map<String, Object> map, Model model) throws Exception {
			logger.info("Start " + className + ".delReturnList");
			
			System.out.println("** 파라미터 확인 : "+map);
			
			int currentPage = Integer.parseInt((String)map.get("currentPage"));	
			int pageSize = Integer.parseInt((String)map.get("pageSize"));	
			int pageIndex = (currentPage-1)*pageSize;	
			
			map.put("pageIndex", pageIndex);
			map.put("pageSize", pageSize);
			
			List<DelCusModel> list = delCusService.delReturnList(map);
			model.addAttribute("list", list);
			System.out.println("delReturnList : "+list);
			
			// ERROR - List<DelCusModel> totalCount = delCusService.delReturnCnt(map);
			int totalCount = 5;
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("totalCount", totalCount);
			System.out.println("totalCount : "+totalCount);

			logger.info("End " + className + ".delReturnList");
			return "delcus/delcusReturnList";
		}	
		
	// 2. Return 단 건 조회
		@RequestMapping("delReturnSelectOne.do")
		@ResponseBody
		public List<DelCusModel> delReturnSelectOne(Model model, @RequestParam Map<String, Object> map) throws Exception {
			
			logger.info("Start " + className + ".delReturnSelectOne");
			
			System.out.println(map);
			
			List<DelCusModel> list = delCusService.delReturnSelectOne(map);
			System.out.println("list : "+list);
			logger.info("End " + className + ".delReturnSelectOne");

			return list;
		}
		
	// 3. Delivery 상태 변경
		@RequestMapping("delReturnSts.do")
		@ResponseBody
		public int delReturnStrCnt(@RequestParam Map<String, Object> map) throws Exception{
			
			logger.info("Start " + className + ".deliverySts");

			System.out.println("map 확인 : "+map);
			System.out.println("map 확인 : "+map.get("prodNo"));
			
			Map<DelCusModel,Object> resultmap = new HashMap<DelCusModel,Object>();
			
			int prodNo = Integer.parseInt(String.valueOf(map.get("prodNo")));
			int strNo = Integer.parseInt(String.valueOf(map.get("strNo")));
			int retNo = Integer.parseInt(String.valueOf(map.get("retNo")));
			
			System.out.println("&&& :"+prodNo);
			System.out.println("&&& :"+strNo);
			System.out.println("&&& :"+retNo);
			
			int result = 0;
			
			// Return 창고 재고 수량 수정
			if(delCusService.delReturnStrCnt(map)>0) {
				result += 1;
			}
			// Return retSts/retEsts 수정
			if(delCusService.delReturnRetSts(map)>0) {
				result += 1;
			}
			
			logger.info("Start " + className + ".deliverySts");
			
			return result;
			
		}		
          
}

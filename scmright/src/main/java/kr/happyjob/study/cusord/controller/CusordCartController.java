package kr.happyjob.study.cusord.controller;

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

import kr.happyjob.study.cusord.model.CusordCartModel;
import kr.happyjob.study.cusord.service.CusordCartService;

@Controller
@RequestMapping("/cusord")
public class CusordCartController {
	
	// Set logger
	private final Logger logger = LogManager.getLogger(this.getClass());

	// Get class name for logger
	private final String className = this.getClass().toString();
	
	@Autowired
	CusordCartService cusordCartService;
	

	
	@GetMapping("/cartList.do")
	public String cartListInit(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception{
			
			logger.info("+ Start " + className + ".listCart");
			String userName = (String)session.getAttribute("userNm");
			model.addAttribute("userName",userName);
			return "/cusord/cart";
		
	}
	
	//장바구니 조회
	@PostMapping("/cartList.do")
	public String cartList(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception{
		
		logger.info("+ Start " + className + ".listCart");
		logger.info("   - paramMap : " + paramMap);
		
		//세션에 저장되어 있는 loginID 가져오고 parameter로 전달
		String loginID = (String)session.getAttribute("loginId");
		paramMap.put("loginID", loginID);
		
		
		/*장바구니에 담긴 제품 목록*/
		List<CusordCartModel> cartList = cusordCartService.selectCart(paramMap);
		int totalCartCnt = cusordCartService.selectCartCnt(paramMap);
		
		model.addAttribute("cartList",cartList);
		model.addAttribute("totalCartCnt",totalCartCnt);
		model.addAttribute("loginID",loginID);
		
		return "cusord/cartList";
		
	}
	
	//제품 장바구니에서 삭제
	@PostMapping("/removeProduct.do")
	@ResponseBody
	public Map<String,Object> removeProduct(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception{
		
		logger.info("+ Start " + className + ".removeProduct");
		logger.info("   - paramMap : " + paramMap);
		
		int deleteResult = cusordCartService.deleteProduct(paramMap);
		
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("deleteResult", deleteResult);
		logger.info("deleteResult 1나오나?" + deleteResult);
		
		logger.info("+ End " + className + ".removeProduct");
		
		return resultMap;
		
		
	}
	

}

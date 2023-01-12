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

import kr.happyjob.study.cusord.model.CusordProductModel;
import kr.happyjob.study.cusord.service.CusordProductService;

@Controller
@RequestMapping("/cusord")
public class CusordProductController {
	
	// Set logger
	private final Logger logger = LogManager.getLogger(this.getClass());

	// Get class name for logger
	private final String className = this.getClass().toString();
	
	@Autowired
	CusordProductService cusordProductService;
	
	
	/*@RequestParam("username") String name
	String name = request.getParameter("username")
	*/
	
	
	@GetMapping("/productList.do")
	public String productListInit(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception{
		
		logger.info("+ Start " + className + ".productList");
		logger.info("   - paramMap : " + paramMap);
		
		return "cusord/product";
		
	}
	
	
	
	//파라미터로 넘긴 값 mapper에서 사용 
	//제품 목록 조회
	@PostMapping("/productList.do")
	public String productList(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception{
		
		logger.info("+ Start " + className + ".productList");
		logger.info("   - paramMap : " + paramMap);
		
		int currentPage = Integer.parseInt((String)paramMap.get("currentPage"));	// 현재 페이지 번호
		int pageRow = Integer.parseInt((String)paramMap.get("pageRow"));			// 한 페이지에 보여지는 게시글 수 
		int pageStartN = (currentPage-1)*pageRow;												// 페이지 시작 row 번호
		// cp 2 (2-1)*5 = 5 
		logger.info("   - searchPn : " + (String)paramMap.get("searchPn"));
		
		paramMap.put("pageStartN", pageStartN);
		paramMap.put("pageRow", pageRow);
		
		List<CusordProductModel> productList = cusordProductService.selectProduct(paramMap);
		int totalProductCnt = cusordProductService.selectProductCnt(paramMap);
		model.addAttribute("productList", productList);
		model.addAttribute("totalProductCnt", totalProductCnt);
		
		model.addAttribute("pageRow", pageRow);
		model.addAttribute("currentPageProductList",currentPage);
		
		logger.info(" End " + className + ".productList");
		return "cusord/productList";
		
		
	}
	
	//제품 상세보기
	@RequestMapping("/productDetail.do")
	@ResponseBody
	public Map<String,Object> productDetail(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception	{
		
		logger.info("+ Start " + className + ".productDetail");
		logger.info("   - paramMap : " + paramMap);
		
		CusordProductModel detailProduct  =cusordProductService.selectProductDetail(paramMap);
		String resultMsg = "";
		
		if(detailProduct!=null ){
			resultMsg = "SUCCESS";
		}else{
			resultMsg = "제품 조회에 실패했습니다.";
		}
		
		Map<String,Object> resultMap = new HashMap<>();
		
		resultMap.put("detailProduct", detailProduct);
		resultMap.put("resultMsg", resultMsg);
		
		logger.info(" End " + className + ".productDetail");
		
		
		return resultMap;
	}
	
	
	//장바구니에 제품 추가
	@PostMapping("/addCart.do")
	@ResponseBody
	public Map<String,Object> addCart(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception{
		
		logger.info("+ Start " + className + ".addCart");
		logger.info("   - paramMap : " + paramMap);
		
		String loginID = (String)session.getAttribute("loginId");
	
		paramMap.put("loginID", loginID);
	
		
		int addCart = cusordProductService.insertCart(paramMap);
		
		
		Map<String,Object> resultMap = new HashMap<>();
		
		resultMap.put("addCart", addCart);
		logger.info(" End " + className + ".addCart");
		
		return resultMap;
		//return "redirect:cusord/product";
		//return "cusord/product";
		
	}
	
	//한 사용자의 장바구니에 같은 제품 있나 확인
	@PostMapping("/checkCart.do")
	@ResponseBody
	public Map<String,Object> checkCart(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception{
			
		
		logger.info("+ Start " + className + ".checkCart");
		logger.info("   - paramMap : " + paramMap);
		
		//세션에 저장되어 있는 loginID 가져오기
		String loginID = (String)session.getAttribute("loginId");
		
		//생각해보니 parameter로 장바구니에 담을 상품 prodNo이 들어온다. 
		//↓String.valueOf는 어떤 값이든 문자열로 바꿔줌,  (String)은 숫자가 오는 경우 exception 발생
		//int  prodNo = Integer.parseInt(String.valueOf(paramMap.get("prodNo")));
		//paramMap.put("prodNo", prodNo);
		
		paramMap.put("loginID", loginID);
	
		
		/*장바구니에 같은 상품이 담겨있나 조회*/
		int sameProduct = cusordProductService.selectSameProduct(paramMap);
		
		Map<String,Object> resultMap = new HashMap<>();
		resultMap.put("sameProduct", sameProduct);
		
		logger.info(" End " + className + ".checkCart");
		
		return resultMap;
	}
	
	
	@PostMapping("/order.do")
	@ResponseBody
	public Map<String,Object> order(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception{
		
		logger.info("+ Start " + className + ".order");
		logger.info("   - paramMap : " + paramMap);
		
		String loginID = (String)session.getAttribute("loginId");
		
		paramMap.put("loginID", loginID);
	
		
		
		int orderResult = cusordProductService.insertOrder(paramMap);
		
		
		Map<String,Object> resultMap = new HashMap<>();
		resultMap.put("orderResult", orderResult);
	
		
		logger.info(" End " + className + ".order");
		
		return resultMap;
		
	}

	
	

}

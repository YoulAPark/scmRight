package cusord;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.happyjob.study.cusord.dao.CusordProductDao;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/applicationContext.xml")
//@Log4j
public class CusordProductMapperTest {
	
	
		private final Logger logger = LogManager.getLogger(this.getClass());
		
		@Autowired
		private CusordProductDao dao;
		
		
		@Test
		public void selectProduct(){
			System.out.println("dddd");
			//logger.info("ggg");
			//Map<String,Object> param =  new HashMap<>();
		/*	param.put("searchCnt", "keyboard");
			param.put("searchMf", "로지텍");
			param.put("searchValue", "화이트");*/
			
			//dao.selectProduct(param).forEach(product->logger.info(product));
			
			
		}
	

}

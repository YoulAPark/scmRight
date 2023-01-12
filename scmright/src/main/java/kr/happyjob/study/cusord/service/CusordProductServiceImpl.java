package kr.happyjob.study.cusord.service;

import java.util.List;
import java.util.Map;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.happyjob.study.cusord.dao.CusordProductDao;
import kr.happyjob.study.cusord.model.CusordProductModel;

@Service
public class CusordProductServiceImpl implements CusordProductService{
	
		// Set logger
		private final Logger logger = LogManager.getLogger(this.getClass());
		
		// Get class name for logger
		private final String className = this.getClass().toString();
	
		@Autowired
		CusordProductDao cusordProductDao;
	
	
		@Override
		public List<CusordProductModel> selectProduct(Map<String, Object> param) throws Exception {
		
		return cusordProductDao.selectProduct(param);
		}


		@Override
		public int selectProductCnt(Map<String, Object> param) throws Exception {
			return cusordProductDao.selectProductCnt(param);
		}


		@Override
		public CusordProductModel selectProductDetail(Map<String, Object> param) throws Exception {
			return cusordProductDao.selectProductDetail(param);
		}

	
		@Override
		public int selectSameProduct(Map<String, Object> param) throws Exception {
			// TODO Auto-generated method stub
			return cusordProductDao.selectSameProduct(param);
		}

		
		
		@Override
		public int insertCart(Map<String, Object> param) throws Exception {
			return cusordProductDao.insertCart(param);
		}


		@Override
		public int insertOrder(Map<String, Object> param) {
			return cusordProductDao.insertOrder(param);
		}





}

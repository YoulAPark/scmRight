package kr.happyjob.study.cusord.service;

import java.util.List;
import java.util.Map;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.happyjob.study.cusord.dao.CusordCartDao;
import kr.happyjob.study.cusord.model.CusordCartModel;

@Service
public class CusordCartServiceImpl implements CusordCartService {
	
	// Set logger
	private final Logger logger = LogManager.getLogger(this.getClass());
	
	// Get class name for logger
	private final String className = this.getClass().toString();
	
	@Autowired
	CusordCartDao cusordCartDao;

	@Override
	public List<CusordCartModel> selectCart(Map<String, Object> param) throws Exception {
		return cusordCartDao.selectCart(param);
	}


	@Override
	public int selectCartCnt(Map<String, Object> param) throws Exception {
		return cusordCartDao.selectCartCnt(param);
	}


	@Override
	public int deleteProduct(Map<String, Object> param) throws Exception {
		return cusordCartDao.deleteProduct(param);
	}
}

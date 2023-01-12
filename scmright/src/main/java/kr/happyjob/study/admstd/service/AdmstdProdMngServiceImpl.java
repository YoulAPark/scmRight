package kr.happyjob.study.admstd.service;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.happyjob.study.admstd.dao.AdmstdProdMngDao;

@Service
public class AdmstdProdMngServiceImpl implements AdmstdProdMngService {

	// Set logger
	private final Logger logger = LogManager.getLogger(this.getClass());
	   
	// Get class name for logger
	private final String className = this.getClass().toString();
	   
//	@Autowired
//	AdmstdProdMngDao admstdProdMngDao;
}

package kr.happyjob.study.admstd.service;

import java.util.List;
import java.util.Map;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.happyjob.study.admstd.dao.AdmstdStrMngDao;
import kr.happyjob.study.admstd.model.AdmstdStrMngModel;

@Service
public class AdmstdStrMngServiceImpl implements AdmstdStrMngService {
	   
	@Autowired
	AdmstdStrMngDao strMngDao;
		
	// Set logger
	private final Logger logger = LogManager.getLogger(this.getClass());
	   
	// Get class name for logger
	private final String className = this.getClass().toString();
	
	// 1. [SELECT] 리스트 전체 출력
	public List<AdmstdStrMngModel> admstdStrList(Map<String,Object> map) throws Exception{
		logger.info("Start " + className + ".admstdStrList");
		List<AdmstdStrMngModel> list=strMngDao.admstdStrList(map);
		logger.info("End " + className + ".admstdStrList");
		return list;
	}
	
	// 2. [SELECT] 단 건 출력
	public List<AdmstdStrMngModel> admstdStrOne() throws Exception {
		logger.info("Start " + className + ".admstdStrOne");
		List<AdmstdStrMngModel> list=strMngDao.admstdStrOne();
		logger.info("End " + className + ".admstdStrOne");
		return list;
	}
	
	// 3. [SELECT] count 출력
	public int admstdCnt() throws Exception{
		logger.info("Start " + className + ".admstdCnt");
		logger.info("End " + className + ".admstdCnt");
		return strMngDao.admstdCnt();
	}
	
	// 4. [INSERT] 창고 등록
	public void admstdAdd() throws Exception{
		logger.info("Start " + className + ".admstdAdd");
		strMngDao.admstdAdd();
		logger.info("End " + className + ".admstdAdd");
	}
	
	// 5. [UPDATE] 창고 수정
	public void admstdUpdate() throws Exception{
		logger.info("Start " + className + ".admstdUpdate");
		strMngDao.admstdUpdate();
		logger.info("End " + className + ".admstdUpdate");
	}
	
	// 6. [DELETE] 창고 삭제
	public void admstdDel() throws Exception{
		logger.info("Start " + className + ".admstdDel");
		strMngDao.admstdDel();
		logger.info("End " + className + ".admstdDel");
	}
	
	// 7. [SELECT] 로그인아이디 검색
	public List<AdmstdStrMngModel> searchId() throws Exception{
		logger.info("Start " + className + ".searchId");
		List<AdmstdStrMngModel> list=strMngDao.searchId();
		logger.info("End " + className + ".searchId");
		return list;
	}
	
	// 8. [SELECT] 이름 검색
	public List<AdmstdStrMngModel> searchName() throws Exception{
		logger.info("Start " + className + ".searchName");
		List<AdmstdStrMngModel> list=strMngDao.searchName();
		logger.info("End " + className + ".searchName");
		return list;
	}

}

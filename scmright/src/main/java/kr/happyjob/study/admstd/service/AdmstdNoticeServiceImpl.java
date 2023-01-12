package kr.happyjob.study.admstd.service;

import java.util.List;
import java.util.Map;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.happyjob.study.admstd.dao.AdmstdNoticeDao;
import kr.happyjob.study.admstd.model.AdmstdNoticeModel;

@Service
public class AdmstdNoticeServiceImpl implements AdmstdNoticeService {

	// Set logger
	private final Logger logger = LogManager.getLogger(this.getClass());
	   
	// Get class name for logger
	private final String className = this.getClass().toString();
	   
	@Autowired
	AdmstdNoticeDao admstdNoticeDao;
	
	// 1. Notice 리스트  조회 
	public List<AdmstdNoticeModel> listNotice(Map<String, Object> map) throws Exception {
		List<AdmstdNoticeModel> list = admstdNoticeDao.listNotice(map);
		return list;
	}
	
	// 2. Notice 단 건 조회
	public List<AdmstdNoticeModel> selectOneNotice(int ntcNo) throws Exception {
		List<AdmstdNoticeModel> list = admstdNoticeDao.selectOneNotice(ntcNo);
		return list;
	}
	
	// 3. [INSERT] Notice
	public void insertNotice(AdmstdNoticeModel noticeVO) throws Exception {
		admstdNoticeDao.insertNotice(noticeVO);
	}
		
	// 4. [UPDATE] Notice
	public void updateNotice(AdmstdNoticeModel noticeVO) throws Exception {
		admstdNoticeDao.updateNotice(noticeVO);
	}
	// 5. [DELETE] Notice
	public void delNotice(int ntcNo) throws Exception {
		admstdNoticeDao.delNotice(ntcNo);
	}
		
	/* 6. [UPDATE] count
	public void countNotice(AdmstdNoticeModel noticeVO) throws Exception; */
}

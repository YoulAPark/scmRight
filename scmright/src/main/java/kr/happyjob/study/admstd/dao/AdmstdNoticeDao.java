package kr.happyjob.study.admstd.dao;

import java.util.List;
import java.util.Map;

import kr.happyjob.study.admstd.model.AdmstdNoticeModel;

public interface AdmstdNoticeDao {
	
	// 1. Notice 리스트  조회 
	public List<AdmstdNoticeModel> listNotice(Map<String, Object> map) throws Exception;
	
	// 2. Notice 단 건 조회
	public List<AdmstdNoticeModel> selectOneNotice(int ntcNo) throws Exception;

	// 3. [INSERT] Notice
	public void insertNotice(AdmstdNoticeModel noticeVO) throws Exception;
	
	// 4. [UPDATE] Notice
	public void updateNotice(AdmstdNoticeModel noticeVO) throws Exception;
	
	// 5. [DELETE] Notice
	public void delNotice(int ntcNo) throws Exception;
	
	// 6. [UPDATE] count
	public void countNotice(AdmstdNoticeModel noticeVO) throws Exception;
}

package kr.happyjob.study.admstd.service;

import java.util.List;
import java.util.Map;

import kr.happyjob.study.admstd.model.AdmstdStrMngModel;

public interface AdmstdStrMngService {
	
	// 1. [SELECT] 리스트 전체 출력
	public List<AdmstdStrMngModel> admstdStrList(Map<String,Object> map) throws Exception;

	// 2. [SELECT] 단 건 출력
	public List<AdmstdStrMngModel> admstdStrOne(String loginID) throws Exception;

	// 3. [SELECT] count 출력
	public int admstdCnt() throws Exception;

	// 4. [INSERT] 창고 등록
	public void admstdAdd() throws Exception;

	// 5. [UPDATE] 창고 수정
	public void admstdUpdate() throws Exception;

	// 6. [DELETE] 창고 삭제
	public void admstdDel() throws Exception;

	// 7. [SELECT] 로그인아이디 검색
	public List<AdmstdStrMngModel> searchId() throws Exception;

	// 8. [SELECT] 이름 검색
	public List<AdmstdStrMngModel> searchName(String name) throws Exception;
	
}

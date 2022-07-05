package com.service.model;

import java.util.ArrayList;
import java.util.List;

import com.onlyone.model.MemberDTO;

public interface ServiceDAO {
	
	//max값
	public int getMaxServiceNum();
	
	public int getStep(int service_group);
	
	public int getIndent(int service_group);

	//전체 게시물의 수를 찾아오는 메소드
	public int getListCount();
	
	public void viewCount(int num);
	
	//공지사항
	public int getNoticeListCount();
	
	public List<ServiceNoticeDTO> getServiceNoticeList(PageServDTO dto);
	
	public int insertNotice(ServiceNoticeDTO dto);
	
	public ServiceNoticeDTO getNoticeContent(int num);

	public int update_notice(ServiceNoticeDTO dto);
	
	public int deleteNotice(int num);
	
	public void updateNoticeSequence(int num);
	
	public int searchNoticeCount(String field, String keyword);
	
	public List<ServiceNoticeDTO> searchNoticeList(PageServDTO pdto);
	
	
	//1:1 게시판
	public List<ServiceDTO> getOneServiceList(PageServDTO dto);

	public ServiceDTO getServiceDTO(int num);
	
	public int adminOneQuestionListCount();
	
	public ServiceDTO getAdminOneQuestionContent(int num);
	
	public void oneQviewCount(int num);
	
	public List<ServiceFileDTO> getUserFileToAdmin(int num);
	
	public ServiceFileDTO getOneUserFileToAdmin(int num);
	
	public int addOneQuestionReply(ServiceDTO dto);
	
	//자주 찾는 질문
	public List<ServiceQuestionDTO> getServiceQuestionDTO(PageServDTO dto);
	
	public int getQuestionListCount();		//전체 게시물의 수를 찾아오는 메소드
	
	public int insertQuestion(ServiceQuestionDTO dto);
	
	public ServiceQuestionDTO questionContent(int num);
	
	public int update_question(ServiceQuestionDTO dto);
	
	public int searchQuestionCount(String field, String keyword);
	
	public List<ServiceQuestionDTO> searchQuestionList(PageServDTO dto);
	
	public int deleteQuestion(int num);
	
	public void updateSequence(int num);

	
	//회원 공지사항
	public int userNoticeListCount();

	public List<ServiceNoticeDTO> userServiceNoticeList(PageServDTO dto);
	
	//회원 자주 찾는 질문
	public int userQuestionListCount();
	
	public List<ServiceQuestionDTO> userServiceQuestionDTO(PageServDTO dto);

	//회원 1:1 게시판
	public int writeOneQuestion(ServiceDTO dto);
	
	public List<ServiceDTO> getOneQuestionList(PageServDTO dto);
	
	public List<ServiceCategoryDTO> getCategoryList();
	
	
	public int getUserQuListCount(String id);
	

	
	//파일추가 
	public int addFile(ServiceFileDTO dto);
	
	public int getServiceNumValue();

	public int writeOneQuestionFile(ServiceDTO serviceDTO, ArrayList<ServiceFileDTO> fileList);

	public void updateOneQuetionOrgingSi(int num);

	public int deleteOneQuestion(int num);

	public int searchOneQuestionACount(String field, PageServDTO pDto);

	public int searchOneQuestionAALLCount(String field, PageServDTO pDto);

	public List<ServiceDTO> getOneQuestionSearchList(String field, PageServDTO pDto);

	public List<ServiceDTO> getOneQuestionSearchAllList(String field, PageServDTO pDto);

	


	



	
}

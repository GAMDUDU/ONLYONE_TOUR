package com.service.model;

import java.util.List;

public interface ServiceDAO {
	
	//전체 게시물의 수를 찾아오는 메소드
	public int getListCount();
	
	//1:1 게시판
	public List<ServiceDTO> getServiceList(PageServDTO dto);

	public ServiceDTO getServiceDTO(int num);
	
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
}

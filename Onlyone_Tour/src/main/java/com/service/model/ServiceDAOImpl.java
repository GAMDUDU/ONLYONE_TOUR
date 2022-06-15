package com.service.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ServiceDAOImpl implements ServiceDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//전체게시글수
	@Override
	public int getListCount() {
		
		return 0;
	}
	
//1:1 문의
	@Override
	public List<ServiceDTO> getServiceList(PageServDTO dto) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ServiceDTO getServiceDTO(int num) {
		// TODO Auto-generated method stub
		return null;
	}
	
	
//자주찾는 질문
	//전체 게시물의 리스트를 가져오는 쿼리문
	@Override
	public List<ServiceQuestionDTO> getServiceQuestionDTO(PageServDTO dto) {
		
		return this.sqlSession.selectList("questionList", dto);
		
	}
	
	//전체 게시물의 갯수를 찾아오는 쿼리문
	@Override
	public int getQuestionListCount() {
		
		return this.sqlSession.selectOne("questionCount");
	}
	
	//글쓰기
	@Override
	public int insertQuestion(ServiceQuestionDTO dto) {
		
		return this.sqlSession.insert("insertQuestion", dto);
				
	}

	@Override
	public ServiceQuestionDTO questionContent(int num) {
		
		return this.sqlSession.selectOne("questionContent", num);
	}

	@Override
	public int update_question(ServiceQuestionDTO dto) {
		
		return this.sqlSession.update("questionUpdate", dto);
	}

	@Override
	public int searchQuestionCount(String field, String keyword) {
		
		return this.sqlSession.selectOne(field, keyword);
	}

	@Override
	public List<ServiceQuestionDTO> searchQuestionList(PageServDTO dto) {
		
		return this.sqlSession.selectList(dto.getField()+"1", dto);
	}

	@Override
	public int deleteQuestion(int num) {
		
		return this.sqlSession.delete("questionDelete", num);
		
	}

	@Override
	public void updateSequence(int num) {

		this.sqlSession.update("sequence", num);
		
	}


	
}

package com.service.model;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.onlyone.model.MemberDTO;

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
	public List<ServiceDTO> getOneServiceList(PageServDTO dto) {
		// TODO Auto-generated method stub
		return this.sqlSession.selectList("getServiceList", dto);
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

//공지사항
	@Override
	public int getNoticeListCount() {
		
		return this.sqlSession.selectOne("noticeCount");
	}

	@Override
	public List<ServiceNoticeDTO> getServiceNoticeList(PageServDTO dto) {

		return this.sqlSession.selectList("noticeList", dto);
	}

	@Override
	public int insertNotice(ServiceNoticeDTO dto) {
		
		return this.sqlSession.insert("insertNotice", dto);
	}

	@Override
	public ServiceNoticeDTO getNoticeContent(int num) {
		
		return this.sqlSession.selectOne("noticeContent", num);
		
	}

	@Override
	public int update_notice(ServiceNoticeDTO dto) {
		
		return this.sqlSession.update("updateNotice", dto);
	}

	@Override
	public int deleteNotice(int num) {
		
		return this.sqlSession.delete("deleteNotice", num);
	}

	@Override
	public void updateNoticeSequence(int num) {
		
		this.sqlSession.update("noticeSeq", num);
		
	}

	@Override
	public int searchNoticeCount(String field, String keyword) {
		
		return this.sqlSession.selectOne(field, keyword);
	}

	@Override
	public List<ServiceNoticeDTO> searchNoticeList(PageServDTO pdto) {
		
		return this.sqlSession.selectList(pdto.getField() + "1", pdto);
	}

//회원 공지사항
	@Override
	public int userNoticeListCount() {
		
		return this.sqlSession.selectOne("userNoticeCount");
	}

	@Override
	public List<ServiceNoticeDTO> userServiceNoticeList(PageServDTO dto) {
		
		return this.sqlSession.selectList("userNoticeList", dto);
	}

	@Override
	public void viewCount(int num) {
		
		this.sqlSession.update("viewCount", num);
		
	}

//회원 자주 찾는 질문
	@Override
	public int userQuestionListCount() {
		
		return this.sqlSession.selectOne("userQuestionCount");
	}

	@Override
	public List<ServiceQuestionDTO> userServiceQuestionDTO(PageServDTO dto) {
		
		return this.sqlSession.selectList("userQuestionList", dto);
	}
	
	//문의유형 리스트 
	@Override
	public List<ServiceCategoryDTO> getCategoryList() {
		
		return this.sqlSession.selectList("qCategoryList");
	}

	@Override
	public int addFile(ServiceFileDTO dto) {
		
		return this.sqlSession.insert("fileUpload", dto);
	}

	@Override
	public int writeOneQuestion(ServiceDTO dto) {
		// TODO Auto-generated method stub
		return this.sqlSession.insert("insertOneQuestion", dto);
	}

	@Override
	public int getServiceNumValue() {
		// TODO Auto-generated method stub
		return this.sqlSession.selectOne("getServNumValue");
	}

	//1:1 게시판 아이디로 질문리스트 조회
	@Override
	public List<ServiceDTO> getOneQuestionList(PageServDTO dto) {
		// TODO Auto-generated method stub
		return this.sqlSession.selectList("getOneQuestionList", dto);
	}
	
	
	//관리자 1:1 게시판
	@Override
	public int adminOneQuestionListCount() {
		
		return this.sqlSession.selectOne("adminOneQuestionListCount");
	}

	@Override
	public ServiceDTO getAdminOneQuestionContent(int num) {
		// TODO Auto-generated method stub
		return this.sqlSession.selectOne("getAdminOneQuestionContent", num);
	}

	@Override
	public void oneQviewCount(int num) {
		this.sqlSession.insert("oneQviewCount", num);
		
	}

	@Override
	public List<ServiceFileDTO> getUserFileToAdmin(int num) {
		// TODO Auto-generated method stub
		return this.sqlSession.selectList("getFileToAdmin", num);
	}

	@Override
	public int writeOneQuestionFile(ServiceDTO serviceDTO, ArrayList<ServiceFileDTO> fileList) {

		return 0;
	}

	@Override
	public ServiceFileDTO getOneUserFileToAdmin(int num) {
		// TODO Auto-generated method stub
		return this.sqlSession.selectOne("getOneFile", num);
	}

	@Override
	public int addOneQuestionReply(ServiceDTO dto) {
		// TODO Auto-generated method stub
		return this.sqlSession.insert("insertReply", dto);
	}

	@Override
	public int getMaxServiceNum() {
		// TODO Auto-generated method stub
		return this.sqlSession.selectOne("maxServNum");
	}

	@Override
	public int getStep(int service_group) {
		// TODO Auto-generated method stub
		return this.sqlSession.selectOne("step", service_group);
	}

	
	@Override
	public int getIndent(int service_group) {
		// TODO Auto-generated method stub
		return this.sqlSession.selectOne("indent", service_group);
	}

	@Override
	public void updateOneQuetionOrgingSi(int num) {

		this.sqlSession.update("updateOnQuOrignCheck", num);
	}

	@Override
	public int deleteOneQuestion(int num) {
		// TODO Auto-generated method stub
		return this.sqlSession.delete("deleteOneQuestion", num);
	}

	@Override
	public int getUserQuListCount(String id) {
		// TODO Auto-generated method stub
		return this.sqlSession.selectOne("getUserQuListCount", id);
	}
	
	
	
	
	
	
	
}

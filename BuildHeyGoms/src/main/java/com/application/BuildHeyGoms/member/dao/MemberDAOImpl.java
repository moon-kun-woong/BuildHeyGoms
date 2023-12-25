package com.application.BuildHeyGoms.member.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.application.BuildHeyGoms.member.dto.MemberDTO;
import com.application.BuildHeyGoms.myPage.dto.ClassDTO;


@Repository
@Transactional
public class MemberDAOImpl implements MemberDAO {

	@Autowired
	private SqlSession sqlSession;
	
	
	@Override
	public void insertMember(MemberDTO memberDTO) throws Exception {
		sqlSession.insert("member.insertMember" , memberDTO);
	}


	@Override
	public MemberDTO selectOneloginMember(String memberId) throws Exception {
		return sqlSession.selectOne("member.selectOneloginMember" , memberId);

	}


	@Override
	public Object selectOneDuplicatedMemberCheck(String memberId) {
		return sqlSession.selectOne("member.selectOneDuplicatedMemberCheck" , memberId);

	}


	@Override
	public List<MemberDTO> selectListMember() throws Exception {
		return sqlSession.selectList("member.selectListMember");
	}


	@Override
	public List<String> selectClassIdMemberSchedules(String memberId) throws Exception {
		return sqlSession.selectList("member.selectClassIdMemberSchedules", memberId);
	}


	@Override
	public List<ClassDTO> findTrainerClassesByDate(String selectedDate) throws Exception {
		return sqlSession.selectList("member.selectClassFindByDate" , selectedDate);
	}
	

}

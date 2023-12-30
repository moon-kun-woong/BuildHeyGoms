package com.application.BuildHeyGoms.member.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.application.BuildHeyGoms.member.dto.ClassMemberDTO;
import com.application.BuildHeyGoms.member.dto.JoinRequestDTO;
import com.application.BuildHeyGoms.member.dto.MemberDTO;
import com.application.BuildHeyGoms.myPage.dto.ClassDTO;
import com.application.BuildHeyGoms.trainer.dto.TrainerDTO;


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


	@Override
	public void insertClassMember(ClassMemberDTO classMemberDTO) throws Exception {
		sqlSession.insert("member.insertClassMember", classMemberDTO);
	}


	@Override
	public ClassDTO selectOneClassByDate(String selectedDate, String memberId) throws Exception {
	    Map<String, Object> params = new HashMap<>();
	    params.put("selectedDate", selectedDate);
	    params.put("memberId", memberId);
	    return sqlSession.selectOne("member.selectOneClassByDate", params);
	}


	@Override
	public void deleteOneClassMember(String classId) throws Exception {
		sqlSession.delete("member.deleteClassMember", classId);
	}


	@Override
	public List<ClassDTO> selectMyClasses(String memberId) throws Exception {
		return sqlSession.selectList("member.selectMyClasses", memberId);
	}


//	@Override
//	public void searchTrainerIdByMemberId(TrainerDTO trainerDTO) {
//		sqlSession.selectOne("member.searchTrainerIdByMemberId", trainerDTO);
//	}
//
//
//	@Override
//	public void insertJoinRequest(JoinRequestDTO joinRequestDTO) throws Exception {
//		sqlSession.insert("member.insertJoinRequest");
//	}






	

}

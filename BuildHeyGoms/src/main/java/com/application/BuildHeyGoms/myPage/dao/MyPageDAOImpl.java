package com.application.BuildHeyGoms.myPage.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.application.BuildHeyGoms.member.dto.MemberDTO;
import com.application.BuildHeyGoms.trainer.dto.TrainerDTO;

@Repository
public class MyPageDAOImpl implements MyPageDAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public MemberDTO selectOneMyInfoMember(String memberId) throws Exception {
		return sqlSession.selectOne("myPage.selectOneMyInfoMember" , memberId);
	}

	@Override
	public void updateMyInfo(MemberDTO memberDTO) throws Exception {
		sqlSession.update("myPage.updateMyInfo" , memberDTO);
	}

	@Override
	public void deleteMember(String memberId) throws Exception {
		sqlSession.delete("myPage.deleteMember" , memberId);
	}

	
	
	@Override
	public TrainerDTO selectOneMyInfoTrainer(String trainerId) throws Exception {
		return sqlSession.selectOne("myPage.selectOneMyInfoTrainer" , trainerId);
	}

	@Override
	public void updateMyInfoTrainer(TrainerDTO trainerDTO) throws Exception {
		sqlSession.update("myPage.updateMyInfoTrainer" , trainerDTO);
	}

	@Override
	public void deleteTrainer(String trainerId) throws Exception {
		sqlSession.delete("myPage.deleteTrainer" , trainerId);
	}


	
}

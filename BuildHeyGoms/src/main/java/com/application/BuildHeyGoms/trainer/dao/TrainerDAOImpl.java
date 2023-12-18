package com.application.BuildHeyGoms.trainer.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.application.BuildHeyGoms.trainer.dto.TrainerDTO;


@Repository
@Transactional
public class TrainerDAOImpl implements TrainerDAO {

	@Autowired
	private SqlSession sqlSession;
	
	
	@Override
	public void insertTrainer(TrainerDTO trainerDTO) throws Exception {
		sqlSession.insert("trainer.insertTrainer" , trainerDTO);
	}


	@Override
	public TrainerDTO selectOneloginTrainer(String trainerId) throws Exception {
		return sqlSession.selectOne("trainer.selectOneloginTrainer" , trainerId);

	}


	@Override
	public Object selectOneDuplicatedTrainerCheck(String trainerId) {
		return sqlSession.selectOne("trainer.selectOneDuplicatedTrainerCheck" , trainerId);

	}


	@Override
	public List<TrainerDTO> selectListTrainer() throws Exception {
		return sqlSession.selectList("trainer.selectListTrainer");
	}
	

}

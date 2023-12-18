package com.application.BuildHeyGoms.myPage.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class MyPageDAOImpl implements MyPageDAO {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<Map<String,Object>> selectListMyOrder(String memberId) throws Exception {
		return sqlSession.selectList("myPage.selectListMyOrder" , memberId);
	}

	@Override
	public Map<String,Object> selectOneMyOrder(Map<String,Object> orderDetailMap) throws Exception {
		return sqlSession.selectOne("myPage.selectOneMyOrder" , orderDetailMap);
	}


	@Override
	public String getEmailById(String memberEmail) throws Exception {
		return sqlSession.selectOne("myPage.getEmailById", memberEmail);
	}


	
}

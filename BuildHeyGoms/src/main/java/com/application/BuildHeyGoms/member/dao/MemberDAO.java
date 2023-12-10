package com.application.BuildHeyGoms.member.dao;

import java.util.List;
import java.util.Map;

import com.application.BuildHeyGoms.member.dto.MemberDTO;

public interface MemberDAO {

	public void insertMember(MemberDTO memberDTO) throws Exception;

	public MemberDTO selectOneloginMember(String memberId) throws Exception;

	public Object selectOneDuplicatedMemberCheck(String memberId) throws Exception;

	public List<MemberDTO> selectListMember() throws Exception;



}

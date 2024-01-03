package com.application.BuildHeyGoms.trainer.dao;

import java.util.List;
import java.util.Map;

import com.application.BuildHeyGoms.member.dto.MemberDTO;
import com.application.BuildHeyGoms.myPage.dto.ClassDTO;
import com.application.BuildHeyGoms.trainer.dto.TrainerDTO;

public interface TrainerDAO {

	public void insertTrainer(TrainerDTO trainerDTO) throws Exception;

	public TrainerDTO selectOneloginTrainer(String trainerId) throws Exception;

	public Object selectOneDuplicatedTrainerCheck(String trainerId) throws Exception;

	public List<TrainerDTO> selectListTrainer() throws Exception;

	public void insertClass(ClassDTO classDTO, String selectedDate)throws Exception;

	public void insertClass(ClassDTO classDTO)throws Exception;

	public List<String> selectClassIdSchedules(String trainerId)throws Exception;

	public ClassDTO selectClassScheduleDetail(String selectedDate , String trainerId)throws Exception;

	public int updateClassInfo(ClassDTO classDTO)throws Exception;

	public void deleteClass(String classId)throws Exception;

	public List<MemberDTO> getMyClassMembers(String trainerId)throws Exception;


}

package com.application.BuildHeyGoms.trainer.service;

import java.util.List;

import com.application.BuildHeyGoms.member.dto.MemberDTO;
import com.application.BuildHeyGoms.myPage.dto.ClassDTO;
import com.application.BuildHeyGoms.trainer.dto.TrainerDTO;


public interface TrainerService {

	public void addTrainer(TrainerDTO trainerDTO) throws Exception;
	public String checkOverlappedId(String trainerId) throws Exception;
	public TrainerDTO loginTrainer(TrainerDTO trainerDTO)throws Exception;
	public List<TrainerDTO> getTrainerList() throws Exception;
	public void addClass(ClassDTO classDTO) throws Exception;
	public List<String> getClassSchedules(String trainerId) throws Exception;
	public ClassDTO getClassScheduleDetail(String selectedDate,String trainerId) throws Exception;
	public boolean modifyClassInfo(ClassDTO classDTO)throws Exception;
	public void deleteClass(String classId)throws Exception;
	public List<MemberDTO> getMyClassMembers(String trainerId)throws Exception;

	
}

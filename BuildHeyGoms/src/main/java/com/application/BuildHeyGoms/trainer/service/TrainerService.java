package com.application.BuildHeyGoms.trainer.service;

import java.util.List;

import com.application.BuildHeyGoms.myPage.dto.ClassDTO;
import com.application.BuildHeyGoms.trainer.dto.TrainerDTO;


public interface TrainerService {

	public void addTrainer(TrainerDTO trainerDTO) throws Exception;
	public String checkOverlappedId(String trainerId) throws Exception;
	public TrainerDTO loginTrainer(TrainerDTO trainerDTO)throws Exception;
	public List<TrainerDTO> getTrainerList() throws Exception;
	public void addClass(ClassDTO classDTO);
	public List<String> getClassSchedules(String trainerId);
	public ClassDTO getClassScheduleDetail(String selectedDate,String trainerId);
	public boolean modifyClassInfo(ClassDTO classDTO)throws Exception;

}

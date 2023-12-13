package com.application.BuildHeyGoms.trainer.service;

import java.util.List;

import com.application.BuildHeyGoms.trainer.dto.TrainerDTO;


public interface TrainerService {

	public void addTrainer(TrainerDTO trainerDTO) throws Exception;
	public String checkOverlappedId(String trainerId) throws Exception;
	public TrainerDTO loginTrainer(TrainerDTO trainerDTO)throws Exception;
	List<TrainerDTO> getTrainerList() throws Exception;

}

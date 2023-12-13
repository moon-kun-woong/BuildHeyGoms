package com.application.BuildHeyGoms.trainer.dao;

import java.util.List;
import java.util.Map;

import com.application.BuildHeyGoms.trainer.dto.TrainerDTO;


public interface TrainerDAO {

	public void insertTrainer(TrainerDTO trainerDTO) throws Exception;

	public TrainerDTO selectOneloginTrainer(String TrainerId) throws Exception;

	public Object selectOneDuplicatedTrainerCheck(String TrainerId) throws Exception;

	public List<TrainerDTO> selectListTrainer() throws Exception;



}

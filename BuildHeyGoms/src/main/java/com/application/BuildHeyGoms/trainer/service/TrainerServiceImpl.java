package com.application.BuildHeyGoms.trainer.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.application.BuildHeyGoms.trainer.dao.TrainerDAO;
import com.application.BuildHeyGoms.trainer.dto.TrainerDTO;


@Service
public class TrainerServiceImpl implements TrainerService{

	@Autowired
	private TrainerDAO trainerDAO;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	private String FILE_REPO_PATH = "C:\\BuildHeyGoms_file_repo\\";
	
	private static Logger logger = LoggerFactory.getLogger(TrainerServiceImpl.class);
	
	@Override
	public void addTrainer(TrainerDTO trainerDTO) throws Exception{
		trainerDTO.setPasswd(bCryptPasswordEncoder.encode(trainerDTO.getPasswd())); 
		trainerDAO.insertTrainer(trainerDTO);
	}

	
	
	
	
	@Override
	public String checkOverlappedId(String TrainerId) throws Exception{
		
		String isOverLapped = "Y";
		
		if (trainerDAO.selectOneDuplicatedTrainerCheck(TrainerId) == null) {
			return "N";
		}
		
		return isOverLapped;
		
	}

	@Override
	public TrainerDTO loginTrainer(TrainerDTO trainerDTO) throws Exception {
		
		TrainerDTO dbTrainerDTO = trainerDAO.selectOneloginTrainer(trainerDTO.getTrainerId());
		
		if (dbTrainerDTO != null) {
			if (bCryptPasswordEncoder.matches(trainerDTO.getPasswd(), dbTrainerDTO.getPasswd())) {
				return trainerDTO;
			} 
		}
		
		return null;
	}
	
	@Override
	public List<TrainerDTO> getTrainerList() throws Exception {
		return trainerDAO.selectListTrainer();
	}


}

package com.application.BuildHeyGoms.trainer.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.application.BuildHeyGoms.member.dto.MemberDTO;
import com.application.BuildHeyGoms.myPage.dto.ClassDTO;
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
	public String checkOverlappedId(String trainerId) throws Exception{
		
		String isOverLapped = "Y";
		
		if (trainerDAO.selectOneDuplicatedTrainerCheck(trainerId) == null) {
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

	@Override
	public void addClass(ClassDTO classDTO)throws Exception {
		trainerDAO.insertClass(classDTO);
	}

	@Override
	public List<String> getClassSchedules(String trainerId)throws Exception {
		return trainerDAO.selectClassIdSchedules(trainerId);
	}
	
	@Override
	public ClassDTO getClassScheduleDetail(String selectedDate, String trainerId) throws Exception {
		return trainerDAO.selectClassScheduleDetail(selectedDate, trainerId);
	}

	@Override
	public boolean modifyClassInfo(ClassDTO classDTO)throws Exception {
		
        int rowsAffected = trainerDAO.updateClassInfo(classDTO);

        if (rowsAffected > 0) {
            return true;
        } else {
            return false;
        }
	}


	@Override
	@Transactional
	public void deleteClass(String classId) throws Exception {
		trainerDAO.deleteClass(classId);
	}


	@Override
	public List<MemberDTO> getMyClassMembers(String trainerId) throws Exception {
		return trainerDAO.getMyClassMembers(trainerId);
	}



}

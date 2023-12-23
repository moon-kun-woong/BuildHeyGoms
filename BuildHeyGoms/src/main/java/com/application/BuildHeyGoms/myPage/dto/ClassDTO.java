package com.application.BuildHeyGoms.myPage.dto;

import java.util.Date;

import org.springframework.stereotype.Component;

@Component
public class ClassDTO {

	private String classId;
	private String classNm;
	private String trainerId;
	private String selectedDate;
	private Date createClassDt;
	private String classLocation;
	private String classContent;
	private String activeAccountYN;
	
	public String getClassId() {
		return classId;
	}
	public void setClassId(String classId) {
		this.classId = classId;
	}
	public String getClassNm() {
		return classNm;
	}
	public void setClassNm(String classNm) {
		this.classNm = classNm;
	}
	public String getTrainerId() {
		return trainerId;
	}
	public void setTrainerId(String trainerId) {
		this.trainerId = trainerId;
	}
	public String getSelectedDate() {
		return selectedDate;
	}
	public void setSelectedDate(String selectedDate) {
		this.selectedDate = selectedDate;
	}
	public Date getCreateClassDt() {
		return createClassDt;
	}
	public void setCreateClassDt(Date createClassDt) {
		this.createClassDt = createClassDt;
	}
	public String getClassLocation() {
		return classLocation;
	}
	public void setClassLocation(String classLocation) {
		this.classLocation = classLocation;
	}
	public String getClassContent() {
		return classContent;
	}
	public void setClassContent(String classContent) {
		this.classContent = classContent;
	}
	public String getActiveAccountYN() {
		return activeAccountYN;
	}
	public void setActiveAccountYN(String activeAccountYN) {
		this.activeAccountYN = activeAccountYN;
	}
	
	@Override
	public String toString() {
		return "ClassDTO [classId=" + classId + ", classNm=" + classNm + ", trainerId=" + trainerId + ", selectedDate="
				+ selectedDate + ", createClassDt=" + createClassDt + ", classLocation=" + classLocation
				+ ", classContent=" + classContent + ", activeAccountYN=" + activeAccountYN + "]";
	}
	
	

	
}

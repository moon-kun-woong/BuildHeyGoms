package com.application.BuildHeyGoms.trainer.dto;

import java.util.Date;

import org.springframework.stereotype.Component;

@Component
public class TrainerDTO {

		private String trainerId;
		private String passwd;
		private String trainerNm;
		private String sex;
		private String birthDt;
		private String hp;
		private String email;
		private String address;
		private String businessLocation;
		private String connectedMember;
		private String careerBook;
		private Date joinDt;
		private String introduction;
		private String activeAccountYN;
		
		
		public String getTrainerId() {
			return trainerId;
		}
		public void setTrainerId(String trainerId) {
			this.trainerId = trainerId;
		}
		public String getPasswd() {
			return passwd;
		}
		public void setPasswd(String passwd) {
			this.passwd = passwd;
		}
		public String getTrainerNm() {
			return trainerNm;
		}
		public void setTrainerNm(String trainerNm) {
			this.trainerNm = trainerNm;
		}
		public String getSex() {
			return sex;
		}
		public void setSex(String sex) {
			this.sex = sex;
		}
		public String getBirthDt() {
			return birthDt;
		}
		public void setBirthDt(String birthDt) {
			this.birthDt = birthDt;
		}
		public String getHp() {
			return hp;
		}
		public void setHp(String hp) {
			this.hp = hp;
		}
		public String getEmail() {
			return email;
		}
		public void setEmail(String email) {
			this.email = email;
		}
		public String getAddress() {
			return address;
		}
		public void setAddress(String address) {
			this.address = address;
		}
		public String getBusinessLocation() {
			return businessLocation;
		}
		public void setBusinessLocation(String businessLocation) {
			this.businessLocation = businessLocation;
		}
		public String getConnectedMember() {
			return connectedMember;
		}
		public void setConnectedMember(String connectedMember) {
			this.connectedMember = connectedMember;
		}
		public String getCareerBook() {
			return careerBook;
		}
		public void setCareerBook(String careerBook) {
			this.careerBook = careerBook;
		}
		public Date getJoinDt() {
			return joinDt;
		}
		public void setJoinDt(Date joinDt) {
			this.joinDt = joinDt;
		}
		public String getIntroduction() {
			return introduction;
		}
		public void setIntroduction(String introduction) {
			this.introduction = introduction;
		}
		public String getActiveAccountYN() {
			return activeAccountYN;
		}
		public void setActiveAccountYN(String activeAccountYN) {
			this.activeAccountYN = activeAccountYN;
		}
		@Override
		public String toString() {
			return "TrainerDTO [trainerId=" + trainerId + ", passwd=" + passwd + ", trainerNm=" + trainerNm + ", sex="
					+ sex + ", birthDt=" + birthDt + ", hp=" + hp + ", email=" + email + ", address=" + address
					+ ", businessLocation=" + businessLocation + ", connectedMember=" + connectedMember
					+ ", careerBook=" + careerBook + ", joinDt=" + joinDt + ", introduction=" + introduction
					+ ", activeAccountYN=" + activeAccountYN + "]";
		}


		
		
		
		
		
		
		
}

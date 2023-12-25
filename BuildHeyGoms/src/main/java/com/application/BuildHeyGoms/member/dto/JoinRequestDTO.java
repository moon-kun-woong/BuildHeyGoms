package com.application.BuildHeyGoms.member.dto;

import java.util.Date;

import org.springframework.stereotype.Component;

@Component
public class JoinRequestDTO {

		private String joinRequestId;
		private String memberId;
		private String trainerId;
		private String selectedDate;
		private String selectedDateClassMember;
		private String introdution;
		
		
		public String getJoinRequestId() {
			return joinRequestId;
		}
		public void setJoinRequestId(String joinRequestId) {
			this.joinRequestId = joinRequestId;
		}
		public String getMemberId() {
			return memberId;
		}
		public void setMemberId(String memberId) {
			this.memberId = memberId;
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
		public String getSelectedDateClassMember() {
			return selectedDateClassMember;
		}
		public void setSelectedDateClassMember(String selectedDateClassMember) {
			this.selectedDateClassMember = selectedDateClassMember;
		}
		public String getIntrodution() {
			return introdution;
		}
		public void setIntrodution(String introdution) {
			this.introdution = introdution;
		}
		
		@Override
		public String toString() {
			return "joinRequest [joinRequestId=" + joinRequestId + ", memberId=" + memberId + ", trainerId=" + trainerId
					+ ", selectedDate=" + selectedDate + ", selectedDateClassMember=" + selectedDateClassMember
					+ ", introdution=" + introdution + "]";
		}
		
		

		
		
}

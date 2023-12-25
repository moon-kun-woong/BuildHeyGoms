package com.application.BuildHeyGoms.member.dto;

import java.util.Date;

import org.springframework.stereotype.Component;

@Component
public class ClassMemberDTO {

		private String classMemberId;
		private String classId;
		private String memberId;
		private String selectedDateClassMember;
		private Date   joinClassDt;
		private String question;
		
		
		public String getClassMemberId() {
			return classMemberId;
		}
		public void setClassMemberId(String classMemberId) {
			this.classMemberId = classMemberId;
		}
		public String getClassId() {
			return classId;
		}
		public void setClassId(String classId) {
			this.classId = classId;
		}
		public String getMemberId() {
			return memberId;
		}
		public void setMemberId(String memberId) {
			this.memberId = memberId;
		}
		public String getSelectedDateClassMember() {
			return selectedDateClassMember;
		}
		public void setSelectedDateClassMember(String selectedDateClassMember) {
			this.selectedDateClassMember = selectedDateClassMember;
		}
		public Date getJoinClassDt() {
			return joinClassDt;
		}
		public void setJoinClassDt(Date joinClassDt) {
			this.joinClassDt = joinClassDt;
		}
		public String getQuestion() {
			return question;
		}
		public void setQuestion(String question) {
			this.question = question;
		}
		
		@Override
		public String toString() {
			return "ClassMemberDTO [classMemberId=" + classMemberId + ", classId=" + classId + ", memberId=" + memberId
					+ ", selectedDateClassMember=" + selectedDateClassMember + ", joinClassDt=" + joinClassDt
					+ ", question=" + question + "]";
		}
		
		
		
}

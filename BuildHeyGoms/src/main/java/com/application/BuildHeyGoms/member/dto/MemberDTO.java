package com.application.BuildHeyGoms.member.dto;

import java.util.Date;

import org.springframework.stereotype.Component;

@Component
public class MemberDTO {

		private String memberId;
		private String passwd;
		private String memberNm;
		private String sex;
		private String birthDt;
		private String hp;
		private String email;
		private String address;
		private String exercise;
		private Date joinDt;
		private String introduction;
		private String activeAccountYN;
		public String getMemberId() {
			return memberId;
		}
		public void setMemberId(String memberId) {
			this.memberId = memberId;
		}
		public String getPasswd() {
			return passwd;
		}
		public void setPasswd(String passwd) {
			this.passwd = passwd;
		}
		public String getMemberNm() {
			return memberNm;
		}
		public void setMemberNm(String memberNm) {
			this.memberNm = memberNm;
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
		public String getExercise() {
			return exercise;
		}
		public void setExercise(String exercise) {
			this.exercise = exercise;
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
			return "MemberDTO [memberId=" + memberId + ", passwd=" + passwd + ", memberNm=" + memberNm + ", sex=" + sex
					+ ", birthDt=" + birthDt + ", hp=" + hp + ", email=" + email + ", address=" + address
					+ ", exercise=" + exercise + ", joinDt=" + joinDt + ", introduction=" + introduction
					+ ", activeAccountYN=" + activeAccountYN + "]";
		}
		
	

		
}

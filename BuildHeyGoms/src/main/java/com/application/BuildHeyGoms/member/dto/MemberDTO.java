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
		private String smsstsYn;
		private String email;
		private String emailstsYn;
		private String zipcode;
		private String roadAddress;
		private String jibunAddress;
		private String namujiAddress;
		private String exercise;
		private Date   joinDt;
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
		public String getSmsstsYn() {
			return smsstsYn;
		}
		public void setSmsstsYn(String smsstsYn) {
			this.smsstsYn = smsstsYn;
		}
		public String getEmail() {
			return email;
		}
		public void setEmail(String email) {
			this.email = email;
		}
		public String getEmailstsYn() {
			return emailstsYn;
		}
		public void setEmailstsYn(String emailstsYn) {
			this.emailstsYn = emailstsYn;
		}
		public String getZipcode() {
			return zipcode;
		}
		public void setZipcode(String zipcode) {
			this.zipcode = zipcode;
		}
		public String getRoadAddress() {
			return roadAddress;
		}
		public void setRoadAddress(String roadAddress) {
			this.roadAddress = roadAddress;
		}
		public String getJibunAddress() {
			return jibunAddress;
		}
		public void setJibunAddress(String jibunAddress) {
			this.jibunAddress = jibunAddress;
		}
		public String getNamujiAddress() {
			return namujiAddress;
		}
		public void setNamujiAddress(String namujiAddress) {
			this.namujiAddress = namujiAddress;
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
					+ ", birthDt=" + birthDt + ", hp=" + hp + ", smsstsYn=" + smsstsYn + ", email=" + email
					+ ", emailstsYn=" + emailstsYn + ", zipcode=" + zipcode + ", roadAddress=" + roadAddress
					+ ", jibunAddress=" + jibunAddress + ", namujiAddress=" + namujiAddress + ", exercise=" + exercise
					+ ", joinDt=" + joinDt + ", introduction=" + introduction + ", activeAccountYN=" + activeAccountYN
					+ "]";
		}
		
		
		

		
	

		
}

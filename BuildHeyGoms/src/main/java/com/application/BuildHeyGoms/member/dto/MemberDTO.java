package com.application.BuildHeyGoms.member.dto;

import java.util.Date;

import org.springframework.stereotype.Component;

@Component
public class MemberDTO {

		private String memberId;
		private String passwd;
		private String profile;
		private String memberName;
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
		private Date joinDt;
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
		public String getProfile() {
			return profile;
		}
		public void setProfile(String profile) {
			this.profile = profile;
		}
		public String getMemberNm() {
			return memberName;
		}
		public void setMemberNm(String memberNm) {
			this.memberName = memberNm;
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
		public Date getJoinDt() {
			return joinDt;
		}
		public void setJoinDt(Date joinDt) {
			this.joinDt = joinDt;
		}
		public String getActiveAccountYN() {
			return activeAccountYN;
		}
		public void setActiveAccountYN(String activeAccountYN) {
			this.activeAccountYN = activeAccountYN;
		}
		
		@Override
		public String toString() {
			return "MemberDTO [memberId=" + memberId + ", passwd=" + passwd + ", profile=" + profile + ", memberName="
					+ memberName + ", sex=" + sex + ", birthDt=" + birthDt + ", hp=" + hp + ", smsstsYn=" + smsstsYn
					+ ", email=" + email + ", emailstsYn=" + emailstsYn + ", zipcode=" + zipcode + ", roadAddress="
					+ roadAddress + ", jibunAddress=" + jibunAddress + ", namujiAddress=" + namujiAddress + ", joinDt="
					+ joinDt + ", activeAccountYN=" + activeAccountYN + "]";
		}

		
}

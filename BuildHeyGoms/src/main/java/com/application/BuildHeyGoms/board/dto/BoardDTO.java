package com.application.BuildHeyGoms.board.dto;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class BoardDTO {
	private long boardId;
	private String passwd;
	private String writer;
	private String subject;
	private String content;
	private long readCnt;
	private Date enrollDt;
	private Date modifyDt;
	public long getBoardId() {
		return boardId;
	}
	public void setBoardId(long boardId) {
		this.boardId = boardId;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public long getReadCnt() {
		return readCnt;
	}
	public void setReadCnt(long readCnt) {
		this.readCnt = readCnt;
	}
	public Date getEnrollDt() {
		return enrollDt;
	}
	public void setEnrollDt(Date enrollDt) {
		this.enrollDt = enrollDt;
	}
	public Date getModifyDt() {
		return modifyDt;
	}
	public void setModifyDt(Date modifyDt) {
		this.modifyDt = modifyDt;
	}
	
	@Override
	public String toString() {
		return "BoardDTO [boardId=" + boardId + ", passwd=" + passwd + ", writer=" + writer + ", subject=" + subject
				+ ", content=" + content + ", readCnt=" + readCnt + ", enrollDt=" + enrollDt + ", modifyDt=" + modifyDt
				+ "]";
	}
}

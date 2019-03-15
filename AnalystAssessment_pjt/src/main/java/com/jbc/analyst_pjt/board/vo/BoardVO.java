package com.jbc.analyst_pjt.board.vo;

import java.util.Date;
import java.util.List;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlElementWrapper;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
@XmlAccessorType(XmlAccessType.FIELD)
public class BoardVO {
	@XmlElement
	private int b_idx;
	@XmlElement
	private String m_userId;
	@XmlElement
	private String m_userPw;
	@XmlElement
	private String b_title;
	@XmlElement
	private String b_content;
	@XmlElement
	private Date   b_date;
	@XmlElement
	private int    b_hit;
	
	// 멤버 추가 : 댓글의 개수
	@XmlElement
	private int commentCount;
	// 멤버 추가 : 댓글의 목록
	@XmlElementWrapper(name="comment_list")
	private List<CommentVO> commentList ;
	
	public int getCommentCount() {
		return commentCount;
	}
	public void setCommentCount(int commentCount) {
		this.commentCount = commentCount;
	}
	public List<CommentVO> getCommentList() {
		return commentList;
	}
	public void setCommentList(List<CommentVO> commentList) {
		this.commentList = commentList;
	}
	public int getB_idx() {
		return b_idx;
	}
	public void setB_idx(int b_idx) {
		this.b_idx = b_idx;
	}
	public String getM_userId() {
		return m_userId;
	}
	public void setM_userId(String m_userId) {
		this.m_userId = m_userId;
	}
	public String getM_userPw() {
		return m_userPw;
	}
	public void setM_userPw(String m_userPw) {
		this.m_userPw = m_userPw;
	}
	public String getB_title() {
		return b_title;
	}
	public void setB_title(String b_title) {
		this.b_title = b_title;
	}
	public String getB_content() {
		return b_content;
	}
	public void setB_content(String b_content) {
		this.b_content = b_content;
	}
	public Date getB_date() {
		return b_date;
	}
	public void setB_date(Date b_date) {
		this.b_date = b_date;
	}
	public int getB_hit() {
		return b_hit;
	}
	public void setB_hit(int b_hit) {
		this.b_hit = b_hit;
	}
	
	@Override
	public String toString() {
		return "BoardVO [b_idx=" + b_idx + ", m_userId=" + m_userId + ", m_userPw=" + m_userPw + ", b_title=" + b_title
				+ ", b_content=" + b_content + ", b_date=" + b_date + ", b_hit=" + b_hit + ", commentCount="
				+ commentCount + ", commentList=" + commentList + "]";
	}
}
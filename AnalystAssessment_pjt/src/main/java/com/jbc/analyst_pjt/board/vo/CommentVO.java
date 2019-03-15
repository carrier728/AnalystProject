package com.jbc.analyst_pjt.board.vo;

import java.util.Date;

public class CommentVO {
	private int c_idx;
	private int c_ref;
	private String m_userId;
	private String m_userPw;
	private String c_content;
	private Date   c_date;
	private int c_group;
	private int c_step;
	private int c_indent;
	
	public int getC_idx() {
		return c_idx;
	}
	public void setC_idx(int c_idx) {
		this.c_idx = c_idx;
	}
	public int getC_ref() {
		return c_ref;
	}
	public void setC_ref(int c_ref) {
		this.c_ref = c_ref;
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
	public String getC_content() {
		return c_content;
	}
	public void setC_content(String c_content) {
		this.c_content = c_content;
	}
	public Date getC_date() {
		return c_date;
	}
	public void setC_date(Date c_date) {
		this.c_date = c_date;
	}
	public int getC_group() {
		return c_group;
	}
	public void setC_group(int c_group) {
		this.c_group = c_group;
	}
	public int getC_step() {
		return c_step;
	}
	public void setC_step(int c_step) {
		this.c_step = c_step;
	}
	public int getC_indent() {
		return c_indent;
	}
	public void setC_indent(int c_indent) {
		this.c_indent = c_indent;
	}
	
	@Override
	public String toString() {
		return "CommentVO [c_idx=" + c_idx + ", c_ref=" + c_ref + ", m_userId=" + m_userId + ", m_userPw=" + m_userPw
				+ ", c_content=" + c_content + ", c_date=" + c_date + ", c_group=" + c_group + ", c_step=" + c_step
				+ ", c_indent=" + c_indent + "]";
	}
	
	
}

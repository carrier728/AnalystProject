package com.jbc.analyst_pjt.report.vo;

import java.util.Date;

import javax.xml.bind.annotation.XmlRootElement;

import lombok.Data;

@Data
@XmlRootElement
public class ReportVO {
	
	private int reportNo;
	private String itemName;
	private Date reportDate;
	private String industryName;
	private String analystName;
	private String investOpinion;
	private int targetPrice;
	private int currentPrice;
	private int after1MPrice;
	private int after3MPrice;
	private int after6MPrice;
	private int after1YPrice;
	private int dw;
}

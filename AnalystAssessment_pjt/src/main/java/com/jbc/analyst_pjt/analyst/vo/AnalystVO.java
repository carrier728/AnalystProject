package com.jbc.analyst_pjt.analyst.vo;

import javax.xml.bind.annotation.XmlRootElement;

import lombok.Data;

@Data
@XmlRootElement
public class AnalystVO {
	
	private int analystCode;
	private String analystName;
	private String firmName;
	private String industryName;
}

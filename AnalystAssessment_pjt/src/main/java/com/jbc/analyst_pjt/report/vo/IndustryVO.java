package com.jbc.analyst_pjt.report.vo;

import javax.xml.bind.annotation.XmlRootElement;

import lombok.Data;

@Data
@XmlRootElement
public class IndustryVO {
	private int industryIdx;
	private String industryName;
}

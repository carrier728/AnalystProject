package com.jbc.analyst_pjt.report.vo;

import javax.xml.bind.annotation.XmlRootElement;

import lombok.Data;

@Data
@XmlRootElement
public class CountVO {
	
	private int count1M;
	private int count3M;
	private int count6M;
	private int count1Y;
}

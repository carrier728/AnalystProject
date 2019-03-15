package com.jbc.analyst_pjt.report.vo;

import javax.xml.bind.annotation.XmlRootElement;

import lombok.Data;

@Data
@XmlRootElement
public class ChangeRateVO {
	private double changeRate1M;
	private double changeRate3M;
	private double changeRate6M;
	private double changeRate1Y;
}

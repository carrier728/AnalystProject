package com.jbc.analyst_pjt.assess.service;

import java.text.DecimalFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jbc.analyst_pjt.assess.dao.AssessDAO;
import com.jbc.analyst_pjt.report.vo.ChangeRateVO;
import com.jbc.analyst_pjt.report.vo.CountVO;
import com.jbc.analyst_pjt.report.vo.ReportVO;

@Service
public class AssessService {
	
	@Autowired
	private AssessDAO assessDAO;
	
	// 애널리스트별 전체 보고서 개수 구하기
	public int countReport(String analystName) {
		return assessDAO.countReport(analystName);
	}
	
	// BUY 보고서 한꺼번에 가져오기
	public Map<String, String> countBuyReport(String analystName) {
		
		// 기간별 보고서 개수
		CountVO countVO = assessDAO.countBuyReport(analystName);
		double count1M = countVO.getCount1M();
		double count3M = countVO.getCount3M();
		double count6M = countVO.getCount6M();
		double count1Y = countVO.getCount1Y();
		
		// 기간별 적중 보고서 개수
		CountVO hitCountVO = assessDAO.countHitBuyReport(analystName);
		double hitCount1M = hitCountVO.getCount1M();
		double hitCount3M = hitCountVO.getCount3M();
		double hitCount6M = hitCountVO.getCount6M();
		double hitCount1Y = hitCountVO.getCount1Y();

		DecimalFormat df = new DecimalFormat("#.##");
		Map<String, String> buyResult = new HashMap<String, String>();
		if(count1M==0) {
			String buyResult1M = "-1";
			buyResult.put("buyResult1M", buyResult1M);
		} else {
			String buyResult1M = df.format((Math.round((hitCount1M/count1M)*100)/100.0)* 100); 
			buyResult.put("buyResult1M", buyResult1M);
		}
		if(count3M==0) {
			String buyResult3M = "-1";
			buyResult.put("buyResult3M", buyResult3M);
		} else {
			String buyResult3M = df.format((Math.round((hitCount3M/count3M)*100)/100.0)* 100); 
			buyResult.put("buyResult3M", buyResult3M);
		}
		if(count6M==0) {
			String buyResult6M = "-1";
			buyResult.put("buyResult6M", buyResult6M);
		} else {
			String buyResult6M = df.format((Math.round((hitCount6M/count6M)*100)/100.0)* 100); 
			buyResult.put("buyResult6M", buyResult6M);
		}
		if(count1Y==0) {
			String buyResult1Y = "-1";
			buyResult.put("buyResult1Y", buyResult1Y);
		} else {
			String buyResult1Y = df.format((Math.round((hitCount1Y/count1Y)*100)/100.0)* 100); 
			buyResult.put("buyResult1Y", buyResult1Y);
		}
		return buyResult;
	}
	
	// SELL 보고서 한꺼번에 가져오기
	public Map<String, String> countSellReport(String analystName) {
		
		// 기간별 보고서 개수
		CountVO countVO2 = assessDAO.countSellReport(analystName);
		double count1M = countVO2.getCount1M();
		double count3M = countVO2.getCount3M();
		double count6M = countVO2.getCount6M();
		double count1Y = countVO2.getCount1Y();
		
		// 기간별 적중 보고서 개수
		CountVO hitCountVO2 = assessDAO.countHitSellReport(analystName);
		double hitCount1M = hitCountVO2.getCount1M();
		double hitCount3M = hitCountVO2.getCount3M();
		double hitCount6M = hitCountVO2.getCount6M();
		double hitCount1Y = hitCountVO2.getCount1Y();
		
		DecimalFormat df = new DecimalFormat("#.##");
		Map<String, String> sellResult = new HashMap<String, String>();
		if(count1M==0) {
			String sellResult1M = "-1";
			sellResult.put("sellResult1M", sellResult1M);
		} else {
			String sellResult1M = df.format((Math.round((hitCount1M/count1M)*100)/100.0)* 100); 
			sellResult.put("sellResult1M", sellResult1M);
		}
		if(count3M==0) {
			String sellResult3M = "-1";
			sellResult.put("sellResult3M", sellResult3M);
		} else {
			String sellResult3M = df.format((Math.round((hitCount3M/count3M)*100)/100.0)* 100); 
			sellResult.put("sellResult3M", sellResult3M);
		}
		if(count6M==0) {
			String sellResult6M = "-1";
			sellResult.put("sellResult6M", sellResult6M);
		} else {
			String sellResult6M = df.format((Math.round((hitCount6M/count6M)*100)/100.0)* 100); 
			sellResult.put("sellResult6M", sellResult6M);
		}
		if(count1Y==0) {
			String sellResult1Y = "-1";
			sellResult.put("sellResult1Y", sellResult1Y);
		} else {
			String sellResult1Y = df.format((Math.round((hitCount1Y/count1Y)*100)/100.0)* 100); 
			sellResult.put("sellResult1Y", sellResult1Y);
		}
		return sellResult;
	}
	
	// 전체 적중률 계산하기
	public Map<String, String> countAllReport(String analystName){
		
		// 기간별 보고서 개수
		CountVO countVO = assessDAO.countBuyReport(analystName);
		double countBuy1M = countVO.getCount1M();
		double countBuy3M = countVO.getCount3M();
		double countBuy6M = countVO.getCount6M();
		double countBuy1Y = countVO.getCount1Y();
		
		CountVO countVO2 = assessDAO.countSellReport(analystName);
		double countSell1M = countVO2.getCount1M();
		double countSell3M = countVO2.getCount3M();
		double countSell6M = countVO2.getCount6M();
		double countSell1Y = countVO2.getCount1Y();
		
		// 기간별 적중 보고서 개수
		CountVO hitCountVO = assessDAO.countHitBuyReport(analystName);
		double hitCountBuy1M = hitCountVO.getCount1M();
		double hitCountBuy3M = hitCountVO.getCount3M();
		double hitCountBuy6M = hitCountVO.getCount6M();
		double hitCountBuy1Y = hitCountVO.getCount1Y();
		
		CountVO hitCountVO2 = assessDAO.countHitSellReport(analystName);
		double hitCountSell1M = hitCountVO2.getCount1M();
		double hitCountSell3M = hitCountVO2.getCount3M();
		double hitCountSell6M = hitCountVO2.getCount6M();
		double hitCountSell1Y = hitCountVO2.getCount1Y();
		
		// 기간별 전체 보고서 적중률 계산
		DecimalFormat df = new DecimalFormat("#.##");
		Map<String, String> totalResult = new HashMap<String, String>();
		if((countBuy1M+countSell1M)==0) {
			String totalResult1M = "-1";
			totalResult.put("totalResult1M", totalResult1M);
		} else {
			String totalResult1M = df.format((Math.round(((hitCountBuy1M+hitCountSell1M)/(countBuy1M+countSell1M))*100)/100.0)* 100); 
			totalResult.put("totalResult1M", totalResult1M);
		}
		if((countBuy3M+countSell3M)==0) {
			String totalResult3M = "-1";
			totalResult.put("totalResult3M", totalResult3M);
		} else {
			String totalResult3M = df.format((Math.round(((hitCountBuy3M+hitCountSell3M)/(countBuy3M+countSell3M))*100)/100.0)* 100); 
			totalResult.put("totalResult3M", totalResult3M);
		}
		if((countBuy6M+countSell6M)==0) {
			String totalResult6M = "-1";
			totalResult.put("totalResult6M", totalResult6M);
		} else {
			String totalResult6M = df.format((Math.round(((hitCountBuy6M+hitCountSell6M)/(countBuy6M+countSell6M))*100)/100.0)* 100); 
			totalResult.put("totalResult6M", totalResult6M);
		}
		if((countBuy1Y+countSell1Y)==0) {
			String totalResult1Y = "-1";
			totalResult.put("totalResult1Y", totalResult1Y);
		} else {
			String totalResult1Y = df.format((Math.round(((hitCountBuy1Y+hitCountSell1Y)/(countBuy1Y+countSell1Y))*100)/100.0)* 100); 
			totalResult.put("totalResult1Y", totalResult1Y);
		}
		return totalResult;
	}
	
	
	// 최근 보고서 5개 구하기
	public List<ReportVO> recentReport(String analystName) {
		return assessDAO.recentReport(analystName);
	}
	
	// BUY 보고서 평균 상승률 구하기
	public Map<String, String> changeBuyRate(String analystName){
		ChangeRateVO crVO = assessDAO.changeBuyRate(analystName);
		double changeBuyRate1M = crVO.getChangeRate1M();
		double changeBuyRate3M = crVO.getChangeRate3M();
		double changeBuyRate6M = crVO.getChangeRate6M();
		double changeBuyRate1Y = crVO.getChangeRate1Y();
		
		DecimalFormat df = new DecimalFormat("#.##");
		Map<String, String> totalRateResult = new HashMap<String, String>();
		if(changeBuyRate1M==0.0d) {
			String changeRate1M = "-1";
			totalRateResult.put("changeRate1M", changeRate1M);
		} else {
			String changeRate1M = df.format((Math.round(changeBuyRate1M*100)/100.0)*100); 
			totalRateResult.put("changeRate1M", changeRate1M);
		}		
		if(changeBuyRate3M==0.0d) {
			String changeRate3M = "-1";
			totalRateResult.put("changeRate3M", changeRate3M);
		} else {
			String changeRate3M = df.format((Math.round(changeBuyRate3M*100)/100.0)*100); 
			totalRateResult.put("changeRate3M", changeRate3M);
		}		
		if(changeBuyRate6M==0.0d) {
			String changeRate6M = "-1";
			totalRateResult.put("changeRate6M", changeRate6M);
		} else {
			String changeRate6M = df.format((Math.round(changeBuyRate6M*100)/100.0)*100); 
			totalRateResult.put("changeRate6M", changeRate6M);
		}		
		if(changeBuyRate1Y==0.0d) {
			String changeRate1Y = "-1";
			totalRateResult.put("changeRate1Y", changeRate1Y);
		} else {
			String changeRate1Y = df.format((Math.round(changeBuyRate1Y*100)/100.0)*100); 
			totalRateResult.put("changeRate1Y", changeRate1Y);
		}		
		return totalRateResult;
	}
	
	// SELL 보고서 평균 상승률 구하기
	public Map<String, String> changeSellRate(String analystName){
		ChangeRateVO crVO = assessDAO.changeSellRate(analystName);
		double changeSellRate1M = crVO.getChangeRate1M();
		double changeSellRate3M = crVO.getChangeRate3M();
		double changeSellRate6M = crVO.getChangeRate6M();
		double changeSellRate1Y = crVO.getChangeRate1Y();
		
		DecimalFormat df = new DecimalFormat("#.##");
		Map<String, String> totalRateResult2 = new HashMap<String, String>();
		if(changeSellRate1M==0.0d) {
			String sellRate1M = "-1";
			totalRateResult2.put("sellRate1M", sellRate1M);
		} else {
			String sellRate1M = df.format((Math.round(changeSellRate1M*100)/100.0)*100); 
			totalRateResult2.put("sellRate1M", sellRate1M);
		}		
		if(changeSellRate3M==0.0d) {
			String sellRate3M = "-1";
			totalRateResult2.put("sellRate3M", sellRate3M);
		} else {
			String sellRate3M = df.format((Math.round(changeSellRate3M*100)/100.0)*100); 
			totalRateResult2.put("sellRate3M", sellRate3M);
		}		
		if(changeSellRate6M==0.0d) {
			String sellRate6M = "-1";
			totalRateResult2.put("sellRate6M", sellRate6M);
		} else {
			String sellRate6M = df.format((Math.round(changeSellRate6M*100)/100.0)*100); 
			totalRateResult2.put("sellRate6M", sellRate6M);
		}
		if(changeSellRate1Y==0.0d) {
			String sellRate1Y = "-1";
			totalRateResult2.put("sellRate1Y", sellRate1Y);
		} else {
			String sellRate1Y = df.format((Math.round(changeSellRate1Y*100)/100.0)*100); 
			totalRateResult2.put("sellRate1Y", sellRate1Y);
		}
		return totalRateResult2;
	}
	
	// BUY 목표가 달성률 구하기
	public Map<String, String> targetRate(String analystName){
		
		// 기간별 보고서 개수
		CountVO countVO = assessDAO.countBuyReport(analystName);
		double count1M = countVO.getCount1M();
		double count3M = countVO.getCount3M();
		double count6M = countVO.getCount6M();
		double count1Y = countVO.getCount1Y();
		
		CountVO targetCountVO = assessDAO.targetRate(analystName);
		double targetCount1M = targetCountVO.getCount1M();
		double targetCount3M = targetCountVO.getCount3M();
		double targetCount6M = targetCountVO.getCount6M();
		double targetCount1Y = targetCountVO.getCount1Y();
		
		DecimalFormat df = new DecimalFormat("#.##");
		Map<String, String> targetBuyResult = new HashMap<String, String>();
		if(count1M==0) {
			String targetBuy1M = "-1";
			targetBuyResult.put("targetBuy1M", targetBuy1M);
		} else {
			String targetBuy1M = df.format((Math.round((targetCount1M/count1M)*100)/100.0)* 100); 
			targetBuyResult.put("targetBuy1M", targetBuy1M);
		}
		if(count3M==0) {
			String targetBuy3M = "-1";
			targetBuyResult.put("targetBuy3M", targetBuy3M);
		} else {
			String targetBuy3M = df.format((Math.round((targetCount3M/count3M)*100)/100.0)* 100); 
			targetBuyResult.put("targetBuy3M", targetBuy3M);
		}
		if(count6M==0) {
			String targetBuy6M = "-1";
			targetBuyResult.put("targetBuy6M", targetBuy6M);
		} else {
			String targetBuy6M = df.format((Math.round((targetCount6M/count6M)*100)/100.0)* 100); 
			targetBuyResult.put("targetBuy6M", targetBuy6M);
		}
		if(count1Y==0) {
			String targetBuy1Y = "-1";
			targetBuyResult.put("targetBuy1Y", targetBuy1Y);
		} else {
			String targetBuy1Y = df.format((Math.round((targetCount1Y/count1Y)*100)/100.0)* 100); 
			targetBuyResult.put("targetBuy1Y", targetBuy1Y);
		}
		return targetBuyResult;
	}
}
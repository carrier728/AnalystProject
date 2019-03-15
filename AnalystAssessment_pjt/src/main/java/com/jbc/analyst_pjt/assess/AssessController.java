package com.jbc.analyst_pjt.assess;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

import com.jbc.analyst_pjt.analyst.service.AnalystService;
import com.jbc.analyst_pjt.analyst.vo.AnalystVO;
import com.jbc.analyst_pjt.assess.service.AssessService;
import com.jbc.analyst_pjt.board.vo.Paging;
import com.jbc.analyst_pjt.report.vo.ReportVO;

@Controller
public class AssessController {
	
	@Autowired
	private AnalystService analystService;
	
	@Autowired
	private AssessService assessService;
	
	private static final Logger logger = LoggerFactory.getLogger(AssessController.class);
	
	// 리스트
	@RequestMapping(value="/assess_list")
	public String selectList(
			@RequestParam(required = false) Integer p,
			@RequestParam(required = false) Integer s,
			@RequestParam(required = false) Integer b,
			Model model,
			HttpServletRequest request
			) {
		// 컨트롤러에서 포스트 전송값 받기
		Map<String, ?> map = RequestContextUtils.getInputFlashMap(request);
		if(map!=null) {
			@SuppressWarnings("unchecked")
			Map<String, Object> m = (Map<String, Object>) map.get("map");
			p = (Integer) m.get("p");
			b = (Integer) m.get("b");
			s = (Integer) map.get("s");
			// 넘어온 파라미터값을 확인
			logger.debug("-----------------------------------------------");
			logger.debug(map.toString());
			logger.debug(m.toString());
			logger.debug(p + ", " + s + ", " + b);
			logger.debug("-----------------------------------------------");
		}
		// 기본값
		int currentPage = 1;
		int pageSize = 10;
		int blockSize = 10;
		// 값이 넘어왔을 경우에만 값 변경
		if(p != null)
			currentPage = p;
		if(s != null)
			pageSize = s;
		if(b != null)
			blockSize = b;
		Paging<AnalystVO> paging = analystService.selectList(currentPage, pageSize, blockSize);
		model.addAttribute("paging",paging);
		return "assess/assess_list";
	}
	
	@RequestMapping(value="/assess_view")
	public String assess_view(
			@RequestParam(required = false) Integer p,
			@RequestParam(required = false) Integer s,
			@RequestParam(required = false) Integer b,
			@RequestParam(required = false) Integer analystCode,
			@RequestParam(required = false) String analystName,
			Model model,
			HttpServletRequest request,
			HttpServletResponse response,
			RedirectAttributes redirectAttributes	
			) {
		// 기본값
		int index = 0;
		int currentPage = 1;
		int pageSize = 10;
		int blockSize = 10;
		// 값이 넘어왔을 경우에만 값 변경
		if (analystCode != null) index = analystCode;
		if (p != null) currentPage = p;
		if (s != null) pageSize = s;
		if (b != null) blockSize = b;
		// ----------------------------------------------------------------------------
		
		AnalystVO vo = analystService.view(index); // 글 가져오기
		if(vo == null) { // 해당 글번호가 없다면 리스트로 보낸다.
			// POST 전송
			Map<String, Object> map2 = new HashMap<String, Object>();
			map2.put("p", currentPage);
			map2.put("b", blockSize);
			redirectAttributes.addFlashAttribute("map", map2);
			redirectAttributes.addFlashAttribute("s", pageSize);
			return "redirect:/a_list";
		}
		// 글이 있다면 내용보기로 간다. 글이 저장된 객채를 가지고 간다.
		model.addAttribute("vo2", vo);
		// EL로 줄바꿈 처리를 하기 위하여 두개값을 모델에 저장한다.
		model.addAttribute("br", "<br/>");
		model.addAttribute("newLine", "\n");
		// 페이지 이동에 대비하여 저장
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("blockSize", blockSize);
		model.addAttribute("p", currentPage);
		model.addAttribute("s", pageSize);
		model.addAttribute("b", blockSize);		
		
		// 전체 보고서 개수 가져오기
		int reportCount = assessService.countReport(analystName);
		model.addAttribute("reportCount", reportCount);
		
		// BUY 보고서 적중률 가져오기
		Map<String, String> map3 = assessService.countBuyReport(analystName);
		
		String buyResult1M = map3.get("buyResult1M");
		String buyResult3M = map3.get("buyResult3M");
		String buyResult6M = map3.get("buyResult6M");
		String buyResult1Y = map3.get("buyResult1Y");
		
		model.addAttribute("buyResult1M", buyResult1M);
		model.addAttribute("buyResult3M", buyResult3M);
		model.addAttribute("buyResult6M", buyResult6M);
		model.addAttribute("buyResult1Y", buyResult1Y);
		
		// SELL 보고서 적중률 가져오기
		Map<String, String> map4 = assessService.countSellReport(analystName);
		String sellResult1M = map4.get("sellResult1M");
		String sellResult3M = map4.get("sellResult3M");
		String sellResult6M = map4.get("sellResult6M");
		String sellResult1Y = map4.get("sellResult1Y");
		
		model.addAttribute("sellResult1M", sellResult1M);
		model.addAttribute("sellResult3M", sellResult3M);
		model.addAttribute("sellResult6M", sellResult6M);
		model.addAttribute("sellResult1Y", sellResult1Y);
		
		// 전체 보고서 적중률 가져오기
		Map<String, String> map5 = assessService.countAllReport(analystName);
		String totalResult1M = map5.get("totalResult1M");
		String totalResult3M = map5.get("totalResult3M");
		String totalResult6M = map5.get("totalResult6M");
		String totalResult1Y = map5.get("totalResult1Y");
	
		model.addAttribute("totalResult1M", totalResult1M);
		model.addAttribute("totalResult3M", totalResult3M);
		model.addAttribute("totalResult6M", totalResult6M);
		model.addAttribute("totalResult1Y", totalResult1Y);
		
		// 최근 보고서 5개 가져오기
		List<ReportVO> recentReport = assessService.recentReport(analystName);
		model.addAttribute("recentReport", recentReport);
		
		// BUY 보고서 평균 상승률 값 보내기
		Map<String, String> map6 = assessService.changeBuyRate(analystName);
		String changeRate1M = map6.get("changeRate1M");
		String changeRate3M = map6.get("changeRate3M");
		String changeRate6M = map6.get("changeRate6M");
		String changeRate1Y = map6.get("changeRate1Y");
		
		model.addAttribute("changeRate1M",changeRate1M);
		model.addAttribute("changeRate3M",changeRate3M);
		model.addAttribute("changeRate6M",changeRate6M);
		model.addAttribute("changeRate1Y",changeRate1Y);
		
		// BUY 보고서 평균 상승률 값 보내기
		Map<String, String> map7 = assessService.changeSellRate(analystName);
		String sellRate1M = map7.get("sellRate1M");
		String sellRate3M = map7.get("sellRate3M");
		String sellRate6M = map7.get("sellRate6M");
		String sellRate1Y = map7.get("sellRate1Y");
		
		model.addAttribute("sellRate1M",sellRate1M);
		model.addAttribute("sellRate3M",sellRate3M);
		model.addAttribute("sellRate6M",sellRate6M);
		model.addAttribute("sellRate1Y",sellRate1Y);
		
		// BUY 적중률 가져오기
		Map<String, String> map8 = assessService.targetRate(analystName);
		String targetBuy1M = map8.get("targetBuy1M");
		String targetBuy3M = map8.get("targetBuy3M");
		String targetBuy6M = map8.get("targetBuy6M");
		String targetBuy1Y = map8.get("targetBuy1Y");
		
		model.addAttribute("targetBuy1M", targetBuy1M);
		model.addAttribute("targetBuy3M", targetBuy3M);
		model.addAttribute("targetBuy6M", targetBuy6M);
		model.addAttribute("targetBuy1Y", targetBuy1Y);
				
		return "assess/assess_view";
	}
}

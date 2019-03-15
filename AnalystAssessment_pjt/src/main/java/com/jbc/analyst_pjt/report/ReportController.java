package com.jbc.analyst_pjt.report;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

import com.jbc.analyst_pjt.board.vo.Paging;
import com.jbc.analyst_pjt.report.service.ReportService;
import com.jbc.analyst_pjt.report.vo.IndustryVO;
import com.jbc.analyst_pjt.report.vo.ReportVO;

@Controller
public class ReportController {

	@Autowired
	private ReportService reportService;

	private static final Logger logger = LoggerFactory.getLogger(ReportController.class);

	// 리스트
	@RequestMapping(value="/r_list")
	public String selectList(
			@RequestParam(required=false) Integer p,
			@RequestParam(required=false) Integer s,
			@RequestParam(required=false) Integer b,
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
			s = (Integer) m.get("s");
			// 넘어온 파라미터값을 확인
			logger.debug("-----------------------------------------------------------");
			logger.debug(map.toString());
			logger.debug(m.toString());
			logger.debug(p+", "+s+", "+b);
			logger.debug("-----------------------------------------------------------");
		}
		//기본값
		int currentPage = 1;
		int pageSize = 10;
		int blockSize = 10;
		
		// 값이 넘어왔을 경우에만 변경
		if (p != null)
			currentPage = p;
		if (s != null)
			pageSize = s;
		if (b != null)
			blockSize = b;
		Paging<ReportVO> paging = reportService.selectList(currentPage, pageSize, blockSize);
		model.addAttribute("paging", paging);
		return "report/r_list";
	}
	
	// 보고서 저장 폼
	@RequestMapping(value="/r_register", method=RequestMethod.POST)
	public String register(Model model) {
		List<IndustryVO> industryList = reportService.industryList();
		model.addAttribute("industryList", industryList);
		return "report/r_register";
	}
	
	// 보고서 정보 저장하기
	@RequestMapping(value="/r_registerOk", method=RequestMethod.POST)
	public String registerOk(@ModelAttribute("reportVO") final ReportVO reportVO) {
		if(reportVO!=null) {
			reportService.insert(reportVO);
		}
		return "redirect:/r_list";
	}
	
	//======================================================
	// 보고서 정보 보기
	@RequestMapping(value="/r_view")
	public String view(
	@RequestParam(required=false) Integer p,		
	@RequestParam(required=false) Integer s,		
	@RequestParam(required=false) Integer b,		
	@RequestParam(required=false) Integer reportNo,		
	Model model,
	HttpServletRequest request,
	HttpServletRequest response,
	RedirectAttributes redirectAttributes
	) {
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
		System.out.println("ReportController > r_view > reportNo : " + reportNo );
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
		
		// 컨트롤러에서 포스트 전송값 받기
		Map<String, ?>map = RequestContextUtils.getInputFlashMap(request);
		logger.debug("----------------------------------------------------------");
		logger.debug("["+map+"]");
		logger.debug("----------------------------------------------------------");
		if(map!=null) {
			@SuppressWarnings("unchecked")
			Map<String,Object> m2 = (Map<String,Object>) map.get("map");
			p = (Integer) m2.get("p");
			b = (Integer) m2.get("b");
			s = (Integer) m2.get("s");
			reportNo = (Integer) m2.get("reportNo");
		}
		// 기본값
		int reportNumber = 0;
		int currentPage = 1;
		int pageSize = 10;
		int blockSize = 10;
		// 값이 넘어왔을 경우에만 변경
		if (reportNo != null) reportNumber = reportNo;
		if (p != null) currentPage = p;
		if (s != null) pageSize = s;
		if (b != null) blockSize = b;
	// =========================================================	
		
		ReportVO vo = reportService.view(reportNumber);
		if(vo == null) { // 글번호가 없다면 리스트로 보내구~
			// POST 전송
			Map<String, Object> map2 = new HashMap<String, Object>();
			map2.put("p", currentPage);
			map2.put("b", blockSize);
			redirectAttributes.addFlashAttribute("map", map2);
			redirectAttributes.addFlashAttribute("s", pageSize);
			return "redirect:/r_list";
		}
		// 글이 있다면 내용보기로 간다. 글이 저장된 객채를 가지고 간다.
		model.addAttribute("vo", vo);
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
		return "report/r_view";
	}
	// 수정
	@RequestMapping(value="/r_update", method=RequestMethod.POST)
	public String update(
			@RequestParam(required = false) Integer p,
			@RequestParam(required = false) Integer s,
			@RequestParam(required = false) Integer b,
			@RequestParam(required = false) Integer reportNo,
			Model model,
			RedirectAttributes redirectAttributes
			) {
		ReportVO vo = reportService.selectByReportNo(reportNo);
		if(vo==null) {
			// POST 전송
			Map<String, Object> map2 = new HashMap<String, Object>();
			map2.put("p", p);
			map2.put("b", b);
			redirectAttributes.addFlashAttribute("map", map2);
			redirectAttributes.addFlashAttribute("s", s);
			return "redirect:/r_update";
		}
		List<IndustryVO> industryList = reportService.industryList();
		model.addAttribute("industryList", industryList);		
		model.addAttribute("vo", vo);
		model.addAttribute("p", p);
		model.addAttribute("s", s);
		model.addAttribute("b", b);
		return "report/r_update";
	}
	
	// 업데이트 체크
	@RequestMapping(value="/r_updateOk", method=RequestMethod.POST)
	public String updateOk(
			@RequestParam(required = false) Integer p, 
			@RequestParam(required = false) Integer s,
			@RequestParam(required = false) Integer b, 
			@RequestParam(required = false) Integer reportNo, 
			@ModelAttribute ReportVO vo,
			Model model,
			RedirectAttributes redirectAttributes
			) {
		reportService.updateOk(vo);
		// POST 전송
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("p", p);
		map.put("b", b);
		map.put("s", s);
		map.put("reportNo", vo.getReportNo());
		redirectAttributes.addFlashAttribute("map", map);
		return "redirect:/r_view";
	}
	@RequestMapping(value="/r_deleteOk")
	public String r_deleteOk(
			@RequestParam(required = false) Integer p, 
			@RequestParam(required = false) Integer s,
			@RequestParam(required = false) Integer b, 
			@RequestParam(required = false) Integer reportNo, 
			@ModelAttribute ReportVO vo,
			Model model,
			RedirectAttributes redirectAttributes
			) {
		reportService.deleteOk(vo);
		// POST 전송
		Map<String, Object> map2 = new HashMap<String, Object>();
		map2.put("p", p);
		map2.put("b", b);
		redirectAttributes.addFlashAttribute("map", map2);
		redirectAttributes.addFlashAttribute("s", s);
		return "redirect:/r_list";
	}	

	// 주가 입력으로 넘어가게 해준다.
	@RequestMapping(value="/sp_list")
	public String sp_list(
			@RequestParam(required=false) Integer p,
			@RequestParam(required=false) Integer s,
			@RequestParam(required=false) Integer b,
			Model model,
			HttpServletRequest request
			) {
		
		// 컨트롤러에서 포스트 전송값 받기
		Map<String, ?>map = RequestContextUtils.getInputFlashMap(request);
		if(map!=null) {
			@SuppressWarnings("unchecked")
			Map<String, Object> m = (Map<String, Object>) map.get("map");
			p=(Integer)m.get("p");
			p=(Integer)m.get("b");
			p=(Integer)map.get("s");
			logger.debug("-----------------------------------------------");
			logger.debug(map.toString());
			logger.debug(m.toString());
			logger.debug(p + ", " + s + ", " + b);
			logger.debug("-----------------------------------------------");
		}
		int currentPage = 1;
		int pageSize = 10;
		int blockSize = 10;
		if(p!=null)
			currentPage=p;
		if(s!=null)
			pageSize = s;
		if(b!=null)
			blockSize = b;
		Paging<ReportVO> paging=reportService.selectList(currentPage, pageSize, blockSize);
		model.addAttribute("paging", paging);
		return "report/sp_list";
	}
	
	// 주가 수정
	@RequestMapping(value="/sp_update")
	public String sp_update(
			@RequestParam(required = false) Integer p,
			@RequestParam(required = false) Integer s,
			@RequestParam(required = false) Integer b,
			@RequestParam(required = false) Integer reportNo,
			Model model,
			RedirectAttributes redirectAttributes
			) {
		System.out.println("vo" + reportNo);
		ReportVO vo = reportService.selectByReportNo(reportNo);
		if(vo==null) {
			// POST 전송
			Map<String, Object> map2 = new HashMap<String, Object>();
			map2.put("p", p);
			map2.put("b", b);
			redirectAttributes.addFlashAttribute("map", map2);
			redirectAttributes.addFlashAttribute("s", s);
			return "redirect:/sp_list";
		}
		model.addAttribute("vo", vo);
		model.addAttribute("p", p);
		model.addAttribute("s", s);
		model.addAttribute("b", b);
		return "report/sp_update";
	}
	
	@RequestMapping(value="/sp_updateOk")
	public String updateOk(
			@RequestParam(required = false) Integer p,
			@RequestParam(required = false) Integer s,
			@RequestParam(required = false) Integer b,
			@ModelAttribute ReportVO vo,
			Model model,
			RedirectAttributes redirectAttributes
			) {
		//POST 전송
		System.out.println("=====================");
		System.out.println("vo:"+vo);
		System.out.println("=====================");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("p", p);
		map.put("b", b);
		map.put("s", s);
		map.put("analystCode", vo.getReportNo());
		redirectAttributes.addFlashAttribute("map", map);
		reportService.priceUpdate(vo);
		return "redirect:/sp_list";		
	}
	
	// 주가 입력 알림 리스트
	@RequestMapping(value="/alertPrice_list")
	public String alertPrice_list(
			@RequestParam(required=false) Integer p,
			@RequestParam(required=false) Integer s,
			@RequestParam(required=false) Integer b,
			Model model,
			HttpServletRequest request
			) {
		
		// 컨트롤러에서 포스트 전송값 받기
		Map<String, ?>map = RequestContextUtils.getInputFlashMap(request);
		if(map!=null) {
			@SuppressWarnings("unchecked")
			Map<String, Object> m = (Map<String, Object>) map.get("map");
			p=(Integer)m.get("p");
			p=(Integer)m.get("b");
			p=(Integer)map.get("s");
			logger.debug("-----------------------------------------------");
			logger.debug(map.toString());
			logger.debug(m.toString());
			logger.debug(p + ", " + s + ", " + b);
			logger.debug("-----------------------------------------------");
		}
		int currentPage = 1;
		int pageSize = 10;
		int blockSize = 10;
		if(p!=null)
			currentPage=p;
		if(s!=null)
			pageSize = s;
		if(b!=null)
			blockSize = b;
		Paging<ReportVO> paging=reportService.selectList(currentPage, pageSize, blockSize);
		model.addAttribute("paging", paging);
		return "alertPrice/alertPrice_list";
	}
	
	// 애널리스트 이름 저장 개수 :  가입폼에서 Ajax로 호출
	@RequestMapping(value="/analystNameCount", produces = { "text/html;charset=utf-8" })
	@ResponseBody
	public String getAnalystNameCount(@RequestParam String analystName) {
		return reportService.getAnalystNameCount(analystName)+"";
	}
}
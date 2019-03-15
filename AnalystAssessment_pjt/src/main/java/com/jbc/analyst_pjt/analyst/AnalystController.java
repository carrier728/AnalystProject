package com.jbc.analyst_pjt.analyst;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

import com.jbc.analyst_pjt.analyst.service.AnalystService;
import com.jbc.analyst_pjt.analyst.vo.AnalystVO;
import com.jbc.analyst_pjt.board.vo.Paging;
import com.jbc.analyst_pjt.common.ParamVO;

@Controller
public class AnalystController {
	
	@Autowired
	private AnalystService analystService;
	
	private static final Logger logger = LoggerFactory.getLogger(AnalystController.class);
	
	// 리스트
	@RequestMapping(value="/a_list")
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
		return "analyst/a_list";
	}
	
	// 애널리스트 등록 폼
	@RequestMapping(value="/register")
	public String register() {

		return "analyst/register";
	}
	
	// 애널리스트 정보 저장하기
	@RequestMapping(value="/registerOk")
	public String registerOk(@ModelAttribute("analystVO") final AnalystVO analystVO) {
		if(analystVO!=null) {
			analystService.insert(analystVO);
		}
		return "redirect:/a_list";
	}
	
	// ========================================================
	// 애널리스트 정보 보기
	@RequestMapping(value="/a_view")
	public String view(
	@RequestParam(required = false) Integer p,
	@RequestParam(required = false) Integer s,
	@RequestParam(required = false) Integer b,
	@RequestParam(required = false) Integer analystCode,
	@RequestParam(required = false) Integer m,
	Model model,
	HttpServletRequest request,
	HttpServletResponse response,
	RedirectAttributes redirectAttributes // 컨트롤러에서 POST전송하기
	) {
		// 컨트롤러에서 포스트 전송값 받기
		Map<String, ?> map = RequestContextUtils.getInputFlashMap(request);
		logger.debug("-----------------------------------------------");
		logger.debug("[" + map + "]");
		logger.debug("-----------------------------------------------");
		if(map != null) {
			@SuppressWarnings("unchecked")
			Map<String, Object> m2 = (Map<String, Object>) map.get("map");
			p = (Integer) m2.get("p");
			b = (Integer) m2.get("b");
			s = (Integer) m2.get("s");
			analystCode = (Integer) m2.get("analystCode");
			m = (Integer) m2.get("m");
		}
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

		return "analyst/a_view";
	}
	
	// 수정
	@RequestMapping(value="/a_update")
	public String update(
			@RequestParam(required = false) Integer p, 
			@RequestParam(required = false) Integer s,
			@RequestParam(required = false) Integer b, 
			@RequestParam(required = false) Integer analystCode, 
			@RequestParam(required = false) Integer m, 
			Model model,
			RedirectAttributes redirectAttributes
			) {
		AnalystVO vo = analystService.selectByAnalystCode(analystCode);
		if(vo==null) {
			// POST 전송
			Map<String, Object> map2 = new HashMap<String, Object>();
			map2.put("p", p);
			map2.put("b", b);
			redirectAttributes.addFlashAttribute("map", map2);
			redirectAttributes.addFlashAttribute("s", s);
			return "redirect:/a_list";
		}
		model.addAttribute("vo", vo);
		model.addAttribute("p", p);
		model.addAttribute("s", s);
		model.addAttribute("b", b);
		model.addAttribute("m", m);
		return "analyst/a_update";
	}
	@RequestMapping(value="/a_delete")
	public String delete(
			@ModelAttribute ParamVO paramvo,
			@RequestParam(required = false) Integer analystCode, 
			Model model,
			RedirectAttributes redirectAttributes
			) {
		AnalystVO vo = analystService.selectByAnalystCode(analystCode);
		if(vo!=null) {
			model.addAttribute("vo", vo);
			model.addAttribute("paramvo", paramvo);
			return "analyst/a_delete";
		}
		// POST 전송
		Map<String, Object> map2 = new HashMap<String, Object>();
		map2.put("p", paramvo.getP());
		map2.put("b", paramvo.getB());
		redirectAttributes.addFlashAttribute("s", paramvo.getS());
		redirectAttributes.addFlashAttribute("map", map2);
		return "redirect:/a_list";
	}
	// 업데이트 체크
	@RequestMapping(value="/a_updateOk")
	public String updateOk(
			@RequestParam(required = false) Integer p, 
			@RequestParam(required = false) Integer s,
			@RequestParam(required = false) Integer b, 
			@RequestParam(required = false) Integer m, 
			@ModelAttribute AnalystVO vo,
			Model model,
			RedirectAttributes redirectAttributes
			) {
		analystService.updateOk(vo);
		// POST 전송
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("p", p);
		map.put("b", b);
		map.put("s", s);
		map.put("analystCode", vo.getAnalystCode());
		map.put("m", 0);
		redirectAttributes.addFlashAttribute("map", map);
		return "redirect:/a_list";
	}
	@RequestMapping(value="/a_deleteOk")
	public String deleteOk(
			@RequestParam(required = false) Integer p, 
			@RequestParam(required = false) Integer s,
			@RequestParam(required = false) Integer b, 
			@RequestParam(required = false) Integer analystCode, 
			@RequestParam(required = false) Integer m, 
			@ModelAttribute AnalystVO vo,
			Model model,
			RedirectAttributes redirectAttributes
			) {
		analystService.deleteOk(vo);
		// POST 전송
		Map<String, Object> map2 = new HashMap<String, Object>();
		map2.put("p", p);
		map2.put("b", b);
		redirectAttributes.addFlashAttribute("map", map2);
		redirectAttributes.addFlashAttribute("s", s);
		return "redirect:/a_list";
	}	
	
	// 애널리스트 순위
	@RequestMapping(value="/a_rank")
	public String analystRank() {
		
		return "analyst/a_rank";
	}
}

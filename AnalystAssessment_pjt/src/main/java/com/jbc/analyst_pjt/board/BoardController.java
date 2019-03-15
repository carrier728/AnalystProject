package com.jbc.analyst_pjt.board;


import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

import com.jbc.analyst_pjt.board.service.BoardService;
import com.jbc.analyst_pjt.board.vo.BoardVO;
import com.jbc.analyst_pjt.board.vo.CommentVO;
import com.jbc.analyst_pjt.board.vo.Paging;

@Controller
public class BoardController {
	@Autowired
	private BoardService boardService;

	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

	// 리스트
	@RequestMapping(value = "/list")
	public String selectList(
			@RequestParam(required = false) Integer p, 
			@RequestParam(required = false) Integer s,
			@RequestParam(required = false) Integer b, 
			Model model, 
			HttpServletRequest request
		) {
		// 컨트롤러에서 포스트 전송값 받기
		Map<String, ?> map = RequestContextUtils.getInputFlashMap(request);
		if (map != null) {
			@SuppressWarnings("unchecked")
			Map<String, Object> m = (Map<String, Object>) map.get("map");
			p = (Integer) m.get("p");
			b = (Integer) m.get("b");
			s = (Integer) map.get("s");
			// 넘어온 파라메터값을 확인해 보자
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
		if (p != null)
			currentPage = p;
		if (s != null)
			pageSize = s;
		if (b != null)
			blockSize = b;
		Paging<BoardVO> paging = boardService.selectList(currentPage, pageSize, blockSize);
		model.addAttribute("paging", paging);
		return "board/list";
	}

	// 쓰기 폼 시작
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String writePost(@RequestParam(required = false) Integer p, @RequestParam(required = false) Integer s,
			@RequestParam(required = false) Integer b, Model model) {
		model.addAttribute("p", p);
		model.addAttribute("b", b);
		model.addAttribute("s", s);
		return "board/write";
	}

	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String writeGet() {
		return "redirect:/list";
	}

	// 쓰기 폼 종료
	// 저장하기 시작
	@RequestMapping(value = "/writeOk", method = RequestMethod.POST)
	public String writePostOk(
			@RequestParam(required = false) Integer p, 
			@RequestParam(required = false) Integer s,
			@RequestParam(required = false) Integer b, 
			@ModelAttribute BoardVO vo2, 
			Model model,
			RedirectAttributes redirectAttributes // 컨트롤러에서 POST전송하기
	) {
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@");
		System.out.println("BoardController > writePostOk > BoardVO vo : " + vo2);
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@");
		// 저장
		boardService.writeOk(vo2);
		// POST 전송
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("p", 1);
		map.put("b", b);
		redirectAttributes.addFlashAttribute("map", map);
		redirectAttributes.addFlashAttribute("s", s);
		return "redirect:/list";
	}

	@RequestMapping(value = "/writeOk", method = RequestMethod.GET)
	public String writeGetOk() {
		return "redirect:/list";
	}

	// 저장하기 종료
	// =========================================================================
	// 내용보기
	@RequestMapping(value = "/view")
	public String view(@RequestParam(required = false) Integer p, 
			@RequestParam(required = false) Integer s,
			@RequestParam(required = false) Integer b, 
			@RequestParam(required = false) Integer b_idx,
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
		if (map != null) {
			@SuppressWarnings("unchecked")
			Map<String, Object> m2 = (Map<String, Object>) map.get("map");
			p = (Integer) m2.get("p");
			b = (Integer) m2.get("b");
			s = (Integer) m2.get("s");
			b_idx = (Integer) m2.get("b_idx");
			m = (Integer) m2.get("m");
		}
		// 기본값
		int index = 0;
		int mode = 0;
		int currentPage = 1;
		int pageSize = 10;
		int blockSize = 10;
		// 값이 넘어왔을 경우에만 값 변경
		if (b_idx != null) index = b_idx;
		if (m != null) mode = m;
		if (p != null) currentPage = p;
		if (s != null) pageSize = s;
		if (b != null) blockSize = b;
		// ----------------------------------------------------------------------------
		// 쿠키에 해당게시판 글번호가 저장되어있는지 확인을 한다.
		Cookie[] cookies = request.getCookies();
		boolean isRead = false;
		if (cookies != null && cookies.length > 0) {
			for (Cookie cookie : cookies) {
				if (("free" + b_idx).equals(cookie.getName())) {
					isRead = true;
					break;
				}
			}
		}
		if (isRead) {
			// 저장되어 있으면 이미 글을 본적이 있다 --- 조회수 증가시키지 않는다
			mode = 0;
		} else {
			// 저장되어있지 않으면 조회수를 증가시키고 글번호를 쿠키로 저장해준다.
			mode = 1;
			Cookie cookie = new Cookie("free" + index, "free" + index);
			cookie.setMaxAge(60 * 60 * 24); // 1일동안 저장
			response.addCookie(cookie);
		}
		// ----------------------------------------------------------------------------
		BoardVO vo = boardService.view(index, mode); // 글가져오기

		if (vo == null) { // 해당 글번호가 없다면 리스트로 보낸다.
			// POST 전송
			Map<String, Object> map2 = new HashMap<String, Object>();
			map2.put("p", currentPage);
			map2.put("b", blockSize);
			redirectAttributes.addFlashAttribute("map", map2);
			redirectAttributes.addFlashAttribute("s", pageSize);
			return "redirect:/list";
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

		return "board/view";
	}
	// =========================================================================
	// 댓글 저장
	@RequestMapping(value = "/commentInsertOk")
	public String commentPostOk(
			@RequestParam(required = false) Integer p, 
			@RequestParam(required = false) Integer s,
			@RequestParam(required = false) Integer b, 
			@ModelAttribute CommentVO vo2, 
			Model model,
			RedirectAttributes redirectAttributes // 컨트롤러에서 POST전송하기
	) {
		// 저장
		boardService.commentInsertOk(vo2);
		// POST 전송
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("p", p);
		map.put("b", b);
		map.put("s", s);
		map.put("b_idx", vo2.getC_ref()); // 불안하다 이 부분
		map.put("m", 0);
		redirectAttributes.addFlashAttribute("map", map);
		return "redirect:/view";
	}
	// =========================================================================
	// 댓글 수정
	@RequestMapping(value = "/commentUpdateOk")
	public String commentUpdateOk(
			@RequestParam(required = false) Integer p, 
			@RequestParam(required = false) Integer s,
			@RequestParam(required = false) Integer b, 
			@ModelAttribute CommentVO vo2, 
			Model model,
			RedirectAttributes redirectAttributes // 컨트롤러에서 POST전송하기
			) {
		// 수정
		boardService.commentUpdateOk(vo2);
		// POST 전송
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("p", p);
		map.put("b", b);
		map.put("s", s);
		map.put("b_idx", vo2.getC_ref());
		map.put("m", 0);
		redirectAttributes.addFlashAttribute("map", map);
		return "redirect:/view";
	}
	// =========================================================================
	// 댓글 삭제
	@RequestMapping(value = "/commentDeleteOk")
	public String commentDeleteOk(
			@RequestParam(required = false) Integer p, 
			@RequestParam(required = false) Integer s,
			@RequestParam(required = false) Integer b, 
			@RequestParam(required = false) Integer c_idx,
			Model model,
			RedirectAttributes redirectAttributes 
			// 컨트롤러에서 POST전송하기 : GET을 컨트롤러에 별도로 만들면 GET으로 간다. 
			) {
		// 삭제
		System.out.println("@@@@@@@@@@@@@@@@@@@");
		System.out.println("BoardController > commentDeleteOk > c_idx : " + c_idx);
		System.out.println("@@@@@@@@@@@@@@@@@@@");
		CommentVO vo2 = boardService.selectByCommentIdx(c_idx);
		System.out.println("@@@@@@@@@@@@@@@@@@@");
		System.out.println("BoardController > commentDeleteOk > vo2 : " + vo2);
		System.out.println("@@@@@@@@@@@@@@@@@@@");
		boardService.commentDeleteOk(vo2);
		// POST 전송
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("p", p);
		map.put("b", b);
		map.put("s", s);
		map.put("b_idx", vo2.getC_ref());
		map.put("m", 0);
		redirectAttributes.addFlashAttribute("map", map);
		return "redirect:/view";
	}
	
	@RequestMapping(value="/update")
	public String update(
			@RequestParam(required = false) Integer p, 
			@RequestParam(required = false) Integer s,
			@RequestParam(required = false) Integer b, 
			@RequestParam(required = false) Integer b_idx, 
			@RequestParam(required = false) Integer m, 
			Model model,
			RedirectAttributes redirectAttributes
			) {
		BoardVO vo2 = boardService.selectByIdx(b_idx);
		if(vo2==null) {
			// POST 전송
			Map<String, Object> map2 = new HashMap<String, Object>();
			map2.put("p", p);
			map2.put("b", b);
			redirectAttributes.addFlashAttribute("map", map2);
			redirectAttributes.addFlashAttribute("s", s);
			return "redirect:/list";
		}
		model.addAttribute("vo2", vo2);
		model.addAttribute("p", p);
		model.addAttribute("s", s);
		model.addAttribute("b", b);
		model.addAttribute("m", m);
		return "board/update";
	}

	/*
	 * @RequestMapping(value="/delete") public String delete(
	 * 
	 * @RequestParam(required = false) Integer p,
	 * 
	 * @RequestParam(required = false) Integer s,
	 * 
	 * @RequestParam(required = false) Integer b,
	 * 
	 * @RequestParam(required = false) Integer b_idx,
	 * 
	 * @RequestParam(required = false) Integer m, Model model, RedirectAttributes
	 * redirectAttributes ) { BoardVO vo = boardService.selectByIdx(b_idx);
	 * if(vo==null) { // POST 전송 Map<String, Object> map2 = new HashMap<String,
	 * Object>(); map2.put("p", p); map2.put("b", b);
	 * redirectAttributes.addFlashAttribute("map", map2);
	 * redirectAttributes.addFlashAttribute("s", s); return "redirect:/list"; }
	 * model.addAttribute("vo", vo); model.addAttribute("p", p);
	 * model.addAttribute("s", s); model.addAttribute("b", b);
	 * model.addAttribute("m", m); return "delete"; }
	 */
	@RequestMapping(value="/updateOk")
	public String updateOk(
			@RequestParam(required = false) Integer p, 
			@RequestParam(required = false) Integer s,
			@RequestParam(required = false) Integer b, 
			@RequestParam(required = false) Integer m, 
			@RequestParam(required = false) Integer b_idx, 
			@ModelAttribute BoardVO vo2,
			Model model,
			RedirectAttributes redirectAttributes
			) {
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
		System.out.println("BoardController > updateOk > vo2 : " + vo2);
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
		boardService.updateOk(vo2);
		// POST 전송
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("p", p);
		map.put("b", b);
		map.put("s", s);
		map.put("m", 0);
		map.put("b_idx", vo2.getB_idx());
		redirectAttributes.addFlashAttribute("map", map);
		return "redirect:/view";
	}
	@RequestMapping(value="/deleteOk")
	public String deleteOk(
			@RequestParam(required = false) Integer p, 
			@RequestParam(required = false) Integer s,
			@RequestParam(required = false) Integer b, 
			@RequestParam(required = false) Integer b_idx, 
			@RequestParam(required = false) Integer m, 
			Model model,
			RedirectAttributes redirectAttributes
			) {
		BoardVO vo2 = boardService.selectByIdx(b_idx);
		boardService.deleteOk(vo2);
		// POST 전송
		Map<String, Object> map2 = new HashMap<String, Object>();
		map2.put("p", p);
		map2.put("b", b);
		redirectAttributes.addFlashAttribute("map", map2);
		redirectAttributes.addFlashAttribute("s", s);
		return "redirect:/list";
	}
}

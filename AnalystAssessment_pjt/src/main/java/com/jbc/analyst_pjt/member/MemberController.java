package com.jbc.analyst_pjt.member;

import java.util.Map;
import java.util.Random;

import javax.mail.Message;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.support.RequestContextUtils;

import com.jbc.analyst_pjt.board.vo.Paging;
import com.jbc.analyst_pjt.member.service.MemberService;
import com.jbc.analyst_pjt.member.vo.MemberVO;

@Controller
public class MemberController {

	@Autowired
	private MemberService memberService;
	
	@Autowired
	private JavaMailSenderImpl mailSender;	
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	// 회원 가입 폼
	@RequestMapping(value = "/signIn")
	public String signIn(HttpServletRequest request, Model model) {
		String referer = "";
		if (request.getParameter("referer") == null)
			referer = request.getHeader("referer");
		else
			referer = request.getParameter("referer");

		if (referer == null || referer.trim().length() == 0)
			referer = request.getContextPath() + "/";
		model.addAttribute("prevUrl", referer);
		return "member/signIn";
	}
	
	// 회원 정보 저장하기
	@RequestMapping(value = "/signInOk")
	public String signInOk(@ModelAttribute("memberVO") final MemberVO memberVO, HttpSession session) {
		if (memberVO != null) {
			memberService.insert(memberVO); // 회원가입 저장
			// 회원가입 인증키 값 > 이메일 발송
			session.setAttribute("uid", memberVO.getM_userId());
		}
		return "redirect:/logIn";
	}
	
	// 이메일 인증
	@RequestMapping(value="/verifyEmail")
	public String verifyEmail(
			HttpSession session
			)	{
		final MemberVO memberVO = (MemberVO) session.getAttribute("svo");
		if(memberVO != null) {
			MimeMessagePreparator preparator = new MimeMessagePreparator() {
				@Override
				public void prepare(MimeMessage mimeMessage) throws Exception {
					mimeMessage.setFrom("zenith9108@naver.com");
					mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(memberVO.getM_email()));
					mimeMessage.setSubject(memberVO.getM_userName() + "님 회원가입을 축하드립니다.");
					String m_joinKey = "";
					for(int i=0; i < 10; i++) {
						m_joinKey += (char)('a' + new Random().nextInt(26)); // 영문자로 10글자 생성
					}
					memberService.updateKey(memberVO.getM_email(), m_joinKey); // 키를 디비에 저장
					StringBuffer sb = new StringBuffer();
					final MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "UTF-8"); // true : html 사용 가능하게
					sb.append(memberVO.getM_userName() + "님 회원가입을 축하드립니다.<br>");
					sb.append("링크를 클릭하여 이메일 인증을 하셔야 AnalystAssessment 이용이 가능합니다.<br>"
							+ "링크를 클릭하시고 곧바로 로그인을 하시면 됩니다.");
					helper.setText(
							sb.append("<a href='http://localhost:8181/analyst_pjt/confirmEmail?m_joinKey=").append(m_joinKey)
							.append("&m_email=").append(memberVO.getM_email()).append("&m_userId=")
							.append(memberVO.getM_userId()).append("'target='_blank'>이메일 인증 확인 </a>").toString(),
							true);
				}
			};
			mailSender.send(preparator);
		}
		return "redirect:/verifyEmail2";
	}
	@RequestMapping(value="/verifyEmail2")
	public String VerifyEmail2() {
		return "member/verifyEmail2";
	}
	
    // 이메일 인증 확인
    @RequestMapping(value = "/confirmEmail", method=RequestMethod.GET)
    public String confirm(@RequestParam String m_joinKey, @RequestParam String m_email, 
    		@RequestParam String m_userId, Model model, HttpSession session) {
            String confirm = memberService.getKey(m_email);
            if (confirm != null && confirm.equals(m_joinKey)) {
                    memberService.updateLevel(m_userId, 1);
                    memberService.updateKey(m_email, "");
            }
            return "redirect:/";
    }
	
	// 로그인 폼
	@RequestMapping(value = "/logIn")
	public String logIn(HttpServletRequest request, Model model) {
		String referer = "";
		if (request.getParameter("referer") == null)
			referer = request.getHeader("referer");
		else
			referer = request.getParameter("referer");

		if (referer == null || referer.trim().length() == 0)
			referer = request.getContextPath() + "/";

		model.addAttribute("prevUrl", referer);
		model.addAttribute("result", request.getParameter("result"));
		return "member/logIn";
	}

	// 로그인 확인
	@RequestMapping(value = "/loginOk")
	public String loginOk(MemberVO memberVO, @RequestParam String m_userId, @RequestParam String m_userPw,
			@RequestParam String url, HttpSession session, Model model) {

		int result = memberService.passwordCheck(m_userId, m_userPw);
		// 1 : 아이디 존재하지 않는다.
		// 2 : 아이디는 있는데 비번이 틀리다.
		// 3 : 아이디 비번 모두 일치
		if (result == 3) {
			MemberVO vo = memberService.selectById(m_userId);
			session.setAttribute("svo", vo);
			return "redirect:/";
		} else {
			return "redirect:/logIn?result=" + result;
		}
	}

	// 로그아웃
	@RequestMapping(value = "/logOut")
	public String logOut(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}

	// 아이디의 저장 개수 : 가입폼에서 Ajax로 호출할 것이다.
	@RequestMapping(value = "/userIdCount", produces = { "text/html;charset=utf-8" })
	@ResponseBody
	public String userIdCount(@RequestParam String m_userId) {
		return memberService.getUserIdCount(m_userId) + "";
	}
	
	// 이메일 저장 개수 : 가입폼에서 Ajax로 호출할 것이다.
	@RequestMapping(value = "/emailCount", produces = { "text/html;charset=utf-8" })
	@ResponseBody
	public String emailCount(@RequestParam String m_email) {
		return memberService.getEmailCount(m_email) + "";
	}	
	

	// 회원정보 수정
	@RequestMapping(value = "/updateMember")
	public String update(HttpServletRequest request, Model model, HttpSession session) {
		
		MemberVO vo = (MemberVO)session.getAttribute("svo");
		
		model.addAttribute("m_userName", vo.getM_userName());
		model.addAttribute("m_userPw", vo.getM_userPw());
		model.addAttribute("m_email", vo.getM_email());
		
		System.out.println("MemberController.java > update메소드 > vo :" + vo);

		String referer = "";
		if (request.getParameter("referer") == null)
			referer = request.getHeader("referer");
		else
			referer = request.getParameter("referer");

		if (referer == null || referer.trim().length() == 0)
			referer = request.getContextPath() + "/";
		model.addAttribute("prevUrl", referer);
		
		return "member/updateMember";
	}

	// 수정 체크
	@RequestMapping(value = "updateMemberOk")
	public String updateMemberOk(
			@ModelAttribute MemberVO vo,
			HttpSession session
			) {
		memberService.updateOk(vo);
		String id = vo.getM_userId();
		MemberVO vo2 = memberService.selectById(id);
		session.setAttribute("svo", vo2);
		return "redirect:/";
	}
	
	// 비밀번호 변경
	@RequestMapping(value="updatePw")
	public String updatePw(
			HttpServletRequest request, Model model, HttpSession session
			) {
		String referer = "";
		if (request.getParameter("referer") == null)
			referer = request.getHeader("referer");
		else
			referer = request.getParameter("referer");

		if (referer == null || referer.trim().length() == 0)
			referer = request.getContextPath() + "/";
		model.addAttribute("prevUrl", referer);
		return "member/updatePw";
	}
	
	// 비밀번호 재설정
	@RequestMapping(value="updatePw2")
	public String updatePw2(
			HttpServletRequest request, Model model,
			@RequestParam (required=false) String m_userId,
			@RequestParam (required=false) String m_pwKey
			) {
//		MemberVO mem = memberService.selectById(m_userId);
		if(m_pwKey!=null) {
			model.addAttribute("m_userId", m_userId);
			model.addAttribute("m_pwKey", m_pwKey);
		}
		memberService.insertPwKey(m_userId, "");
		return "member/updatePw2";
	}
	
	// 비밀번호 변경 체크
	@RequestMapping(value="updatePwOk")
	public String updatePwOk(
			@ModelAttribute MemberVO vo,
			HttpSession session
			) {
		memberService.updatePw(vo);
		System.out.println("MemberControllerVO > updatePwOk메소드> vo : " + vo);
		MemberVO memberVO = memberService.selectById(vo.getM_userId());
		session.setAttribute("svo", memberVO);
		return "redirect:/";
	}
	// 비밀번호 재설정 완료
	@RequestMapping(value="updatePwOk2")
	public String updatePwOk2(
			@ModelAttribute MemberVO vo,
			HttpSession session
			) {
		System.out.println("MemberControllerVO > updatePwOk2메소드> vo : " + vo);
		memberService.updatePw(vo);
		String m_userId = vo.getM_userId();
		memberService.insertPwKey2(m_userId);
		return "redirect:/";
	}
	
	// 아이디 찾기
	@RequestMapping(value="findId")
	public String findId() {
		return "member/findId";
	}
	
	// 아이디 찾기 체크
	@RequestMapping(value="findIdOk")
	public String findIdOk(
			@RequestParam String m_email, Model model
			) {
		if(m_email!=null) {
			MemberVO member = memberService.findId(m_email);
			model.addAttribute("member", member);
		}
		return "member/findIdView";
	}
	
	// 비번 찾기
	@RequestMapping(value="findPw")
	public String findPw() {
		return "member/findPw";
	}
	
	// 비번 찾기 체크
	@RequestMapping(value="findPwOk")
	public String findPwOk(
			@RequestParam String m_userId,
			final Model model
			) {
		final MemberVO member = memberService.selectById(m_userId);
        if(member != null) {
                int getlev = member.getM_lev();
                if(getlev>=0) {
                        MimeMessagePreparator preparator = new MimeMessagePreparator() {
                                @Override
                                public void prepare(MimeMessage mimeMessage) throws Exception {
                                		String getname = member.getM_userName();
                                		String m_email = member.getM_email();
                                        mimeMessage.setFrom("zenith9108@naver.com");
                                        mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(m_email));
                                        mimeMessage.setSubject("비밀번호 재설정");
                                        String m_pwKey = "";
                                        Random rnd =new Random();
                                        StringBuffer sb = new StringBuffer();
                                        for(int i=0;i<20;i++)
                                            // rnd.nextBoolean() 는 랜덤으로 true, false 를 리턴. true일 시 랜덤 한 소문자를, false 일 시 랜덤 한 숫자를 StringBuffer 에 append 한다.
                                        	m_pwKey += ((char)((int)(rnd.nextInt(26))+97));
                                        
                                        memberService.insertPwKey(m_email, m_pwKey);
                                        model.addAttribute("m_pwKey",m_pwKey);
                                        final MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "UTF-8"); // true (html태그 사용 가능하게)      // "UTF-8"(UTF-8로 인코딩)
                                        sb.append(getname + "님 링크를 클릭하여 비밀번호를 재설정해주세요!<br>");
                                        helper.setText(
                                                        sb.append("<a href='http://localhost:8181/analyst_pjt/updatePw2?m_userId=").append(member.getM_userId())
                                                                .append("&m_pwKey=").append(m_pwKey)
                                                                .append("' target='_blank'>비밀번호 재설정</a><br>")
                                                                .append("만약 비밀번호 재설정 요청을 하지 않으셨다면 고객센터에 문의 바랍니다. "
                                                                		+ "(고객센터 번호: 02)000-0000 <br> 비밀번호를 변경하고 싶지 않다면 메일을 무시 하시면 됩니다.<br> ").toString(),
                                                        true);
                                        
                                }
                        };
                        mailSender.send(preparator);
                        return "member/verifyEmail3";
                }else {
                        return "redirect:/pwMessage";
                }
        }
		return "redirect:/pwMessage";
	}
	
	// 멤버 전체 조회
	@RequestMapping(value="memberList")
	public String viewMemberList(
			@RequestParam(required = false) Integer p,
			@RequestParam(required = false) Integer s,
			@RequestParam(required = false) Integer b,
			Model model,
			HttpServletRequest request
			) {
		// 컨트롤러에서 포스트 전송값 받기
		Map<String, ?> map = RequestContextUtils.getInputFlashMap(request);
		if(map != null) {
			@SuppressWarnings("unchecked")
			Map<String, Object> m = (Map<String, Object>) map.get("map");
			p = (Integer) m.get("p");
			b = (Integer) m.get("b");
			s = (Integer) m.get("s");
			// 파라미터값 확인
			logger.debug("-----------------------------------------------");
			logger.debug(map.toString());
			logger.debug(m.toString());
			logger.debug(p + ", " + s + ", " + b);
			logger.debug("-----------------------------------------------");
		}
		// 초기값
		int currentPage=1;
		int pageSize = 10;
		int blockSize = 10;
		// 값이 넘어오면 초기값 변경
		if(p != null)
			currentPage = p;
		if(s != null)
			pageSize = s;
		if(b != null)
			blockSize = b;
		Paging<MemberVO> paging = memberService.selectMemberAll(currentPage, pageSize, blockSize);
		model.addAttribute("paging", paging);
		return "member/memberList";
	}
	
	@RequestMapping(value="memberOut")
	public String memberOut() {
		return "member/memberOut";
	}
	
	@RequestMapping(value="memberOutOk")
	public String memberOutOk(
			HttpSession session
			) {
		MemberVO idvo = (MemberVO) session.getAttribute("svo");
		String m_userId = idvo.getM_userId();
		System.out.println("MemberController > memberOutOk > idvo,getM_userId(); : " + m_userId);
		memberService.memberOut(m_userId);
		MemberVO vo = memberService.selectById(m_userId);
		session.setAttribute("svo", vo);
		
		return "redirect:/";
	}
	
	// 관리자 > 멤버등급 변경
	@RequestMapping(value="levUpdate")
	public String levUpdate(
			Model model, 
			@RequestParam (required=false) String m_userId) {
		MemberVO vo = memberService.selectById(m_userId);
		model.addAttribute("vo2", vo);
		return "member/levUpdate";
	}
	
	// 관리자 > 멤버등급 변경 진행
	@RequestMapping(value="levUpdateOk")
	public String levUpdateOk(
			@RequestParam (required=false) String m_userId, 
			@RequestParam (required=false) int m_lev) {
		System.out.println("MemberController > levUpdateOk > m_userId : " + m_userId);
		System.out.println("MemberController > levUpdateOk > m_lev : " + m_lev);
		memberService.updateLevel(m_userId, m_lev);
		return "redirect:/memberList";
	}
}

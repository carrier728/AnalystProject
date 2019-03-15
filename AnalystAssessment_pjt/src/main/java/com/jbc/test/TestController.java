package com.jbc.test;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jbc.test.service.TestService;
import com.jbc.test.vo.TestVO;

@Controller
public class TestController {

	@Autowired
	private TestService testService;
	
	// xml/json 테스트
	@RequestMapping(value="/testVO")
	public @ResponseBody TestVO viewData() {
		return new TestVO();
	}
	// 텍스트 출력
	@RequestMapping(value="/text", produces={"text/html;charset=utf-8"})
	@ResponseBody
	public String text(){
		return "qwerty 한글 1234 ~!@#$";
	}
	
	// ibatis, mybatis 테스트
	@RequestMapping(value="/dbTest/{n1}/{n2}")
	public String dbTest(@PathVariable int n1, @PathVariable int n2, Model model) {
		Map<String, String> map = testService.test(n1, n2);
		model.addAttribute("n1", n1);
		model.addAttribute("n2", n2);
		model.addAttribute("test", map);
		return "test";
	}
}

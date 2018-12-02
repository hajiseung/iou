package com.prj.iou.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class leftFrame {

	@RequestMapping("/leftFrame")
	public String gaaaa() {
		return "leftFrame";
		
	}
}

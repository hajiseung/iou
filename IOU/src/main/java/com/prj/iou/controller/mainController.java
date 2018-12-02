package com.prj.iou.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.prj.iou.service.urlService;
import com.prj.iou.vo.urlVo;

@Controller
public class mainController {
	@Autowired
	private urlService service;
	

	@RequestMapping(value = "/")
	public ModelAndView getUrl() {
		ModelAndView modelAndView = new ModelAndView();
		List<urlVo> result = service.getTitle();
		modelAndView.addObject("list", result);
		modelAndView.setViewName("Main");
		return modelAndView;
	}

}

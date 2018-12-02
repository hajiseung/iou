package com.prj.iou.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.prj.iou.service.urlService;
import com.prj.iou.vo.urlVo;

@Controller
public class urlController {
	@Autowired
	private urlService service;

	@RequestMapping(value = "/insertUrl", method = RequestMethod.POST)
	@ResponseBody
	public urlVo saveUrl(urlVo vo) {
		int result = service.inertUrl(vo);
		if (result > 0) {
			urlVo last = service.getLastTitle(vo);
			System.out.println(last);
			return last;
		} else {
			return null;
		}
	}

	@RequestMapping(value = "/deleteUrl", method = RequestMethod.GET)
	public ModelAndView deleteUrl(urlVo vo) {
		System.out.println(vo);
		ModelAndView modelAndView = new ModelAndView();
		int result = service.deleteUrl(vo);
		System.out.println(result);
		if (result > 0) {
			modelAndView.setViewName("redirect:/");
		}
		return modelAndView;
	}
}

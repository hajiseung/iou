package com.prj.iou.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.prj.iou.urlinterface.urlInterface;
import com.prj.iou.vo.urlVo;

@Service
public class urlService {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	private urlInterface urlif;

//	DB에 값 저장
	public int inertUrl(urlVo vo) {
		urlif = sqlSessionTemplate.getMapper(urlInterface.class);
		if (!vo.getUrl().contains("http://")) {
			vo.setUrl("http://" + vo.getUrl());
		}

		int result = urlif.insertUrl(vo);
		return result;
	}

//	DB 저장 값 호출
	public List<urlVo> getTitle() {
		urlif = sqlSessionTemplate.getMapper(urlInterface.class);
		List<urlVo> result = urlif.getTitle();
		System.out.println(result);
		return result;

	}

//	마지막 저장한 값 호출
	public urlVo getLastTitle(urlVo vo) {
		urlif = sqlSessionTemplate.getMapper(urlInterface.class);
		urlVo result = urlif.getLastTitle(vo);
		return result;

	}

//	DB 에서 값 삭제
	public int deleteUrl(urlVo vo) {
		urlif = sqlSessionTemplate.getMapper(urlInterface.class);
		int result = urlif.deleteUrl(vo);
		return result;
	}
}

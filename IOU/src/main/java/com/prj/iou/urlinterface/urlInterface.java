package com.prj.iou.urlinterface;

import java.util.List;

import com.prj.iou.vo.urlVo;

public interface urlInterface {
	public int insertUrl(urlVo vo);
	public List<urlVo> getTitle();
	public urlVo getLastTitle(urlVo vo);
	public int deleteUrl(urlVo vo);
}

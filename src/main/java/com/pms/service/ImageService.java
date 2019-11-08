package com.pms.service;

import java.util.List;

import com.github.pagehelper.PageInfo;
import com.pms.entity.Image;

public interface ImageService {

	// 添加图片信息
	Integer add(Image image);

	// 删除图片信息
	Integer del(Integer id);

	// 修改图片信息
	Integer update(Image image);

	// 根据id查询图片信息
	Image load(Integer id);

	// 查询全部图片信息
	List<Image> list();

	// 分页查询全部图片信息
	PageInfo<Image> find(Integer pageNum);

}
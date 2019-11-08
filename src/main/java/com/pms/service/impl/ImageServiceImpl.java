package com.pms.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.pms.dao.ImageDao;
import com.pms.entity.Image;
import com.pms.service.ImageService;

@Service("imageService")
public class ImageServiceImpl implements ImageService {

	@Autowired
	private ImageDao imageDao;

	@Override
	public Integer add(Image image) {
		return imageDao.add(image);
	}

	@Override
	public Integer del(Integer id) {
		return imageDao.del(id);
	}

	@Override
	public Integer update(Image image) {
		return imageDao.update(image);
	}

	@Override
	public Image load(Integer id) {
		return imageDao.load(id);
	}

	@Override
	public List<Image> list() {
		return imageDao.list();
	}

	@Override
	public PageInfo<Image> find(Integer pageNum) {
		if (pageNum == null || pageNum < 1) {
			pageNum = 1;// 页码，从1开始
		}
		Integer pageSize = 5;// 每页显示数据
		PageHelper.startPage(pageNum, pageSize);// 指定开始分页
		List<Image> list = imageDao.list();
		PageInfo<Image> page = new PageInfo<Image>(list);
		return page;
	}

}

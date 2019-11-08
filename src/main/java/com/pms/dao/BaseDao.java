package com.pms.dao;

import java.util.List;

public interface BaseDao<E> {

	// 添加信息
	Integer add(E entity);

	// 删除信息
	Integer del(Integer id);

	// 修改信息
	Integer update(E entity);

	// 根据id查询信息
	E load(Integer id);

	// 查询全部信息
	List<E> list();

}
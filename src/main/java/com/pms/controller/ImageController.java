package com.pms.controller;

import com.github.pagehelper.PageInfo;
import com.pms.entity.Image;
import com.pms.service.ImageService;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
@RequestMapping("image")
public class ImageController {

	@Autowired
	private ImageService imageService;

	boolean flag = false;
	int i = 0;

	@GetMapping("list/{pageNum}")
	public String find(Model model, @PathVariable Integer pageNum) {
		if (pageNum > 0) {
			PageInfo<Image> page = imageService.find(pageNum);
			model.addAttribute("page", page);
		}
		return "image/list";
	}

	@PostMapping("doadd")
	@ResponseBody
	public boolean doadd(MultipartFile myfile, Image image) {
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
			// 得到当前时间，如：20190823155059718
			String nowdate = sdf.format(new Date());
			// 设置上传路径
			String path = "D:\\work space\\upload\\images";
			// 得到上传的文件以.开始的后缀名
			String lastIndexOf = myfile.getOriginalFilename().substring(myfile.getOriginalFilename().lastIndexOf("."));
			// 得到新文件名，如：20190823155619838.jpg
			String newFileName = nowdate + lastIndexOf;
			// 得到文件的全路径，如：D:\\work space\\upload\\images\\20190823155619838.jpg
			path += "\\" + newFileName;
			// 拷贝输入流到文件夹中
			FileUtils.copyInputStreamToFile(myfile.getInputStream(), new File(path));
			// 把路径存到数据库中
			String img_url = "\\upload\\images\\" + newFileName;
			image.setImg_url(img_url);
			if (image != null) {
				i = imageService.add(image);
			}
			if (i > 0) {
				flag = true;
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return flag;
	}

	@RequestMapping("del/{id}")
	@ResponseBody
	public boolean del(@PathVariable int id) {
		if (id > 0) {
			String path = "D:\\work space";
			// 从数据库中得到文件的地址
			String url = imageService.load(id).getImg_url();
			// 得到文件的完整路径
			File file = new File(path + url);
			// 删除文件
			file.delete();
			i = imageService.del(id);
		}
		if (i > 0) {
			flag = true;
		}
		return flag;
	}

	@PostMapping("doupdate")
	@ResponseBody
	public boolean doupdate(MultipartFile myfile, Image image) {
		try {
			String delPath = "D:\\work space";
			// 从数据库中得到旧文件的地址
			String url = imageService.load(image.getImg_id()).getImg_url();
			// 得到旧文件的完整路径
			File file = new File(delPath + url);
			// 删除旧文件
			file.delete();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
			// 得到当前时间，如：20190823155059718
			String nowdate = sdf.format(new Date());
			// 设置上传路径
			String path = "D:\\work space\\upload\\images";
			// 得到上传的文件以.开始的后缀名
			String lastIndexOf = myfile.getOriginalFilename().substring(myfile.getOriginalFilename().lastIndexOf("."));
			// 得到新文件名，如：20190823155619838.jpg
			String newFileName = nowdate + lastIndexOf;
			// 得到文件的全路径，如：D:\work space\\upload\\20190823155619838.jpg
			path += "\\" + newFileName;
			// 拷贝输入流到文件夹中
			FileUtils.copyInputStreamToFile(myfile.getInputStream(), new File(path));
			// 把路径存到数据库中
			String img_url = "\\upload\\images\\" + newFileName;
			image.setImg_url(img_url);
			if (image != null) {
				i = imageService.update(image);
			}
			if (i > 0) {
				flag = true;
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return flag;
	}

	@PostMapping("show/{id}")
	@ResponseBody
	public Image show(@PathVariable int id) {
		Image image = null;
		if (id > 0) {
			image = imageService.load(id);
		}
		return image;
	}

}
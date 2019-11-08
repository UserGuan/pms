package com.pms.entity;

/**
 * 
 * @ClassName: Image
 * @Description: 图片实体
 * @date: 2019年8月20日 下午7:13:21
 * @param:
 */
public class Image {

	private int img_id;
	private int item_id;
	private String img_name;
	private String img_url;
	private int img_type; // 类型

	public Image() {
		super();
	}

	public int getImg_id() {
		return img_id;
	}

	public void setImg_id(int img_id) {
		this.img_id = img_id;
	}

	public int getItem_id() {
		return item_id;
	}

	public void setItem_id(int item_id) {
		this.item_id = item_id;
	}

	public String getImg_name() {
		return img_name;
	}

	public void setImg_name(String img_name) {
		this.img_name = img_name;
	}

	public String getImg_url() {
		return img_url;
	}

	public void setImg_url(String img_url) {
		this.img_url = img_url;
	}

	public int getImg_type() {
		return img_type;
	}

	public void setImg_type(int img_type) {
		this.img_type = img_type;
	}

	@Override
	public String toString() {
		return "Image [img_id=" + img_id + ", item_id=" + item_id + ", img_name=" + img_name + ", img_url=" + img_url
				+ ", img_type=" + img_type + "]";
	}

}
package com.techelevator.model;
import java.util.Date;

public class Badge {
	
	private Integer badgeId;
	private String category;
	private String name;
	private String description;
	private String imgUrl;

	
	public Integer getBadgeId() {
		return badgeId;
	}
	public void setBadgeId(Integer badgeId) {
		this.badgeId = badgeId;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getImgUrl() {
		return imgUrl;
	}
	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}
	

}

package com.techelevator.model;

public class Destination {
	
	private Integer destinationId;
	private String categoryId;
	private String category;
	private String name;
	private String description;
	private String latitude;
	private String longitude;
	private String city;
	private String state;
	private String zip_code;
	private String imgUrl;
	private String openFrom;
	private String openTo;
	private String openOnWeekends;
	
	public String getImgUrl() { return imgUrl; }
	public void setImgUrl(String imgUrl) { this.imgUrl = imgUrl; }
	
	public String getOpenFrom() { return openFrom; }
	public void setOpenFrom(String openFrom) { this.openFrom = openFrom; }
	
	public String getOpenTo() { return openTo; }
	public void setOpenTo(String openTo) { this.openTo = openTo; }
	
	public String getOpenOnWeekends() { return openOnWeekends; }
	public void setOpenOnWeekends(String openOnWeekends) { this.openOnWeekends = openOnWeekends; }

	public Integer getDestinationId() { return destinationId; }
	public void setDestinationId(Integer destination_id) { 	this.destinationId = destination_id; }
	
	public String getDescription()  {return description; }
	public void setDescription(String description) { this.description = description; }
	
	public String getLatitude() { return latitude; }
	public void setLatitude(String latitude) { this.latitude = latitude; }
	
	public String getLongitude() { return longitude; }
	public void setLongitude(String longitude) { this.longitude = longitude; }
	
	public String getCity() { return city; }
	public void setCity(String city) { this.city = city; }
	
	public String getState() { return state; }
	public void setState(String state) { this.state = state; }
	
	public String getZip_code() { return zip_code; }
	public 	void setZip_code(String zip_code) { this.zip_code = zip_code; }

	public String getName() { return name; }
	public void setName(String name) { this.name = name; }
	
	public String getCategoryId() { return categoryId; }
	public void setCategoryId(String category) { this.categoryId = category; }
	
	public String getCategory() { return category; }
	public void setCategory(String category) { this.category = category; }

}

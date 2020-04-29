package com.techelevator.model;

public class Destination {
	
	private Long destinationId;
	private Long categoryId;
	private String category;
	private String name;
	private String description;
	private String latitude;
	private String longitude;
	private String city;
	private String state;
	private String zip_code;
	private String imgUrl;
	private String iconUrl;
	private String openFrom;
	private String openTo;
	private String openOnWeekends;
	private String wiki;
	private String twitterHandle;
	
	public String getWiki() {
		return wiki;
	}

	public void setWiki(String wiki) {
		this.wiki = wiki;
	}

	public String getIconUrl() {
		return iconUrl;
	}

	public void setIconUrl(String iconUrl) {
		this.iconUrl = iconUrl;
	}
	
	public String getImgUrl() {
		return imgUrl;
	}

	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}

	public String getOpenFrom() {
		return openFrom;
	}

	public void setOpenFrom(String openFrom) {
		this.openFrom = openFrom;
	}

	public String getOpenTo() {
		return openTo;
	}

	public void setOpenTo(String openTo) {
		this.openTo = openTo;
	}

	public String getOpenOnWeekends() {
		return openOnWeekends;
	}

	public void setOpenOnWeekends(String openOnWeekends) {
		this.openOnWeekends = openOnWeekends;
	}

	public Long getDestinationId() {
		return destinationId;
	}

	public void setDestinationId(Long destination_id) {
		this.destinationId = destination_id;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getLatitude() {
		return latitude;
	}

	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}

	public String getLongitude() {
		return longitude;
	}

	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getZip_code() {
		return zip_code;
	}

	public void setZip_code(String zip_code) {
		this.zip_code = zip_code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Long getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(Long category) {
		this.categoryId = category;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}
	
	public String getTwitterHandle() {
        return twitterHandle;
    }

    public void setTwitterHandle(String twitterHandle) {
        this.twitterHandle = twitterHandle;
    }

}

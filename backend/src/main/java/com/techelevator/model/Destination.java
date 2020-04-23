package com.techelevator.model;

public class Destination {
	
	private Integer destinationId;
	private String categoryId;
	private String category;
	private String name;
	private String description;
	private String x_coordinate;
	private String y_coordinate;
	private String city;
	private String state;
	private String zip_code;
	
	public Integer getDestinationId() { return destinationId; }
	public void setDestinationId(Integer destination_id) { 	this.destinationId = destination_id; }
	
	public String getDescription()  {return description; }
	public void setDescription(String description) { this.description = description; }
	
	public String getX_coordinate() { return x_coordinate; }
	public void setX_coordinate(String x_coordinate) { this.x_coordinate = x_coordinate; }
	
	public String getY_coordinate() { return y_coordinate; }
	public void setY_coordinate(String y_coordinate) { this.y_coordinate = y_coordinate; }
	
	public String getCity() { return city; }
	public void setCity(String city) { this.city = city; }
	
	public String getState() { return state; }
	public void setState(String state) { this.state = state; }
	
	public String getZip_code() { return zip_code; }
	public void setZip_code(String zip_code) { this.zip_code = zip_code; }

	public String getName() { return name; }
	public void setName(String name) { this.name = name; }
	
	public String getCategoryId() { return categoryId; }
	public void setCategoryId(String category) { this.categoryId = category; }
	
	public String getCategory() { return category; }
	public void setCategory(String category) { this.category = category; }

}

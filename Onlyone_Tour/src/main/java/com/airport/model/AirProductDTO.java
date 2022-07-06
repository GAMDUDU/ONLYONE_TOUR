package com.airport.model;

import lombok.Data;

@Data
public class AirProductDTO {

	private int air_num;
	private String air_departure;
	private String air_departure_date;
	private String air_arrival;
	private String air_arrival_date;
	private String air_image;
	private String air_price;
	private int air_pnum;
	public int getAir_num() {
		return air_num;
	}
	public void setAir_num(int air_num) {
		this.air_num = air_num;
	}
	public String getAir_departure() {
		return air_departure;
	}
	public void setAir_departure(String air_departure) {
		this.air_departure = air_departure;
	}
	public String getAir_departure_date() {
		return air_departure_date;
	}
	public void setAir_departure_date(String air_departure_date) {
		this.air_departure_date = air_departure_date;
	}
	public String getAir_arrival() {
		return air_arrival;
	}
	public void setAir_arrival(String air_arrival) {
		this.air_arrival = air_arrival;
	}
	public String getAir_arrival_date() {
		return air_arrival_date;
	}
	public void setAir_arrival_date(String air_arrival_date) {
		this.air_arrival_date = air_arrival_date;
	}
	public String getAir_image() {
		return air_image;
	}
	public void setAir_image(String air_image) {
		this.air_image = air_image;
	}
	public String getAir_price() {
		return air_price;
	}
	public void setAir_price(String air_price) {
		this.air_price = air_price;
	}
	public int getAir_pnum() {
		return air_pnum;
	}
	public void setAir_pnum(int air_pnum) {
		this.air_pnum = air_pnum;
	}
}

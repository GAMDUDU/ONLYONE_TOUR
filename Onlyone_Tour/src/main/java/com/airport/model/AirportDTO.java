package com.airport.model;

import lombok.Data;

@Data
public class AirportDTO {

	private int air_num;
	private String air_name;
	private String air_airline;
	private String air_seat_type;
	private int air_seat;
	private String air_date;
	private String air_departure;
	private String air_departure_date;
	private String air_arrival;
	private String air_arrival_date;
	private int air_adult_fare;
	private int air_child_fare;
	private String air_image;
	private String air_spce;
	public int getAir_num() {
		return air_num;
	}
	public void setAir_num(int air_num) {
		this.air_num = air_num;
	}
	public String getAir_name() {
		return air_name;
	}
	public void setAir_name(String air_name) {
		this.air_name = air_name;
	}
	public String getAir_airline() {
		return air_airline;
	}
	public void setAir_airline(String air_airline) {
		this.air_airline = air_airline;
	}
	public String getAir_seat_type() {
		return air_seat_type;
	}
	public void setAir_seat_type(String air_seat_type) {
		this.air_seat_type = air_seat_type;
	}
	public int getAir_seat() {
		return air_seat;
	}
	public void setAir_seat(int air_seat) {
		this.air_seat = air_seat;
	}
	public String getAir_date() {
		return air_date;
	}
	public void setAir_date(String air_date) {
		this.air_date = air_date;
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
	public int getAir_adult_fare() {
		return air_adult_fare;
	}
	public void setAir_adult_fare(int air_adult_fare) {
		this.air_adult_fare = air_adult_fare;
	}
	public int getAir_child_fare() {
		return air_child_fare;
	}
	public void setAir_child_fare(int air_child_fare) {
		this.air_child_fare = air_child_fare;
	}
	public String getAir_image() {
		return air_image;
	}
	public void setAir_image(String air_image) {
		this.air_image = air_image;
	}
	public String getAir_spce() {
		return air_spce;
	}
	public void setAir_spce(String air_spce) {
		this.air_spce = air_spce;
	}
	
}

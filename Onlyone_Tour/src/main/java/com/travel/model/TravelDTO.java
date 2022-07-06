package com.travel.model;

import lombok.Data;

@Data
public class TravelDTO {
	private int travel_num;
	private String travel_name;
	private int travel_price;
	private String travel_calender;
	private String travel_cont;
	private String travel_spec;
	private String travel_air;
	private String travel_room;
	private String travel_image;
	private String travel_departure_airport;
	private String travel_arrival_airport;
	private String travel_departure_date;
	private String travel_return_date;
	private String travel_meeting_time;
	private String travel_meeting_loc;
	private int travel_reserve_count;
	public int getTravel_num() {
		return travel_num;
	}
	public void setTravel_num(int travel_num) {
		this.travel_num = travel_num;
	}
	public String getTravel_name() {
		return travel_name;
	}
	public void setTravel_name(String travel_name) {
		this.travel_name = travel_name;
	}
	public int getTravel_price() {
		return travel_price;
	}
	public void setTravel_price(int travel_price) {
		this.travel_price = travel_price;
	}
	public String getTravel_calender() {
		return travel_calender;
	}
	public void setTravel_calender(String travel_calender) {
		this.travel_calender = travel_calender;
	}
	public String getTravel_cont() {
		return travel_cont;
	}
	public void setTravel_cont(String travel_cont) {
		this.travel_cont = travel_cont;
	}
	public String getTravel_spec() {
		return travel_spec;
	}
	public void setTravel_spec(String travel_spec) {
		this.travel_spec = travel_spec;
	}
	public String getTravel_air() {
		return travel_air;
	}
	public void setTravel_air(String travel_air) {
		this.travel_air = travel_air;
	}
	public String getTravel_room() {
		return travel_room;
	}
	public void setTravel_room(String travel_room) {
		this.travel_room = travel_room;
	}
	public String getTravel_image() {
		return travel_image;
	}
	public void setTravel_image(String travel_image) {
		this.travel_image = travel_image;
	}
	public String getTravel_departure_airport() {
		return travel_departure_airport;
	}
	public void setTravel_departure_airport(String travel_departure_airport) {
		this.travel_departure_airport = travel_departure_airport;
	}
	public String getTravel_arrival_airport() {
		return travel_arrival_airport;
	}
	public void setTravel_arrival_airport(String travel_arrival_airport) {
		this.travel_arrival_airport = travel_arrival_airport;
	}
	public String getTravel_departure_date() {
		return travel_departure_date;
	}
	public void setTravel_departure_date(String travel_departure_date) {
		this.travel_departure_date = travel_departure_date;
	}
	public String getTravel_return_date() {
		return travel_return_date;
	}
	public void setTravel_return_date(String travel_return_date) {
		this.travel_return_date = travel_return_date;
	}
	public String getTravel_meeting_time() {
		return travel_meeting_time;
	}
	public void setTravel_meeting_time(String travel_meeting_time) {
		this.travel_meeting_time = travel_meeting_time;
	}
	public String getTravel_meeting_loc() {
		return travel_meeting_loc;
	}
	public void setTravel_meeting_loc(String travel_meeting_loc) {
		this.travel_meeting_loc = travel_meeting_loc;
	}
	public int getTravel_reserve_count() {
		return travel_reserve_count;
	}
	public void setTravel_reserve_count(int travel_reserve_count) {
		this.travel_reserve_count = travel_reserve_count;
	}
	
	
	
}

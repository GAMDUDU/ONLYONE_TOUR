package com.hotel.model;

import lombok.Data;

@Data
public class HotelReviewDTO {
	
	private int hreview_num;
	private int hotel_num_fk;
	private int hreview_score;
	private String hreview_comm;
	private String hreview_date;
	public int getHreview_num() {
		return hreview_num;
	}
	public void setHreview_num(int hreview_num) {
		this.hreview_num = hreview_num;
	}
	public int getHotel_num_fk() {
		return hotel_num_fk;
	}
	public void setHotel_num_fk(int hotel_num_fk) {
		this.hotel_num_fk = hotel_num_fk;
	}
	public int getHreview_score() {
		return hreview_score;
	}
	public void setHreview_score(int hreview_score) {
		this.hreview_score = hreview_score;
	}
	public String getHreview_comm() {
		return hreview_comm;
	}
	public void setHreview_comm(String hreview_comm) {
		this.hreview_comm = hreview_comm;
	}
	public String getHreview_date() {
		return hreview_date;
	}
	public void setHreview_date(String hreview_date) {
		this.hreview_date = hreview_date;
	}

}

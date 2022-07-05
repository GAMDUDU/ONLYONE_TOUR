package com.hotel.model;

import lombok.Data;

@Data
public class HotelReviewDTO {
	
	private int hreview_num;
	private int hotel_num_fk;
	private int hreview_score;
	private String hreview_comm;
	private String hreview_date;

}

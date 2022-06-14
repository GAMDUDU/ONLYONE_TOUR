package com.travel.model;

import lombok.Data;

@Data
public class TravelReviewDTO {
	
	private int treview_num;
	private int travel_num_fk;
	private int treview_score;
	private String treview_comm;
	private String treview_date;

}

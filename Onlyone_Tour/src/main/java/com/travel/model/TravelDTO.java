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
	
}

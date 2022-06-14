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
	
}

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
}

package com.airport.model;

import lombok.Data;

@Data
public class AirlineDTO {
	
	private int air_num;
	private String air_airline;
	public int getAir_num() {
		return air_num;
	}
	public void setAir_num(int air_num) {
		this.air_num = air_num;
	}
	public String getAir_airline() {
		return air_airline;
	}
	public void setAir_airline(String air_airline) {
		this.air_airline = air_airline;
	}
}

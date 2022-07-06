package com.airport.model;

import lombok.Data;

@Data
public class NationDTO {

	private int air_num;
	private String air_nation;
	private String air_nation_val;
	public int getAir_num() {
		return air_num;
	}
	public void setAir_num(int air_num) {
		this.air_num = air_num;
	}
	public String getAir_nation() {
		return air_nation;
	}
	public void setAir_nation(String air_nation) {
		this.air_nation = air_nation;
	}
	public String getAir_nation_val() {
		return air_nation_val;
	}
	public void setAir_nation_val(String air_nation_val) {
		this.air_nation_val = air_nation_val;
	}
}

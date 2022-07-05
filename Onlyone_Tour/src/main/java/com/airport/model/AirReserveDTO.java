package com.airport.model;

import lombok.Data;

@Data
public class AirReserveDTO {
	
	private int re_index;
	private int re_num;
	private int re_no;
	private int re_people;
	private String re_info;
	
	private String re_go_air;
	private String re_go_num;
	private String re_go;
	private String re_go_date;
	
	private String re_back_air;
	private String re_back_num;
	private String re_back;
	private String re_back_date;
	
	private String re_mem_id;
	private String re_mem_name;
	private String re_mem_gender;
	private String re_mem_birth;
	private String re_mem_phone;
	private String re_mem_email;
	
	private String re_tour_name;
	private String re_tour_gender;
	private String re_tour_birth;
	private String re_tour_phone;
	
	private String re_go_adult;
	private String re_go_child;
	private String re_back_adult;
	private String re_back_child;
	private String re_account;
	
	private String re_status;
	private String re_date;

}

package com.reserve.model;

import lombok.Data;

@Data
public class ReserveDTO {
	
	private int reserve_num;
	private int travel_num;
	private int reserve_count;
	private String reserve_name;
	private String reserve_date;
	private String reserve_email;
	private String reserve_phone;
	private int price_account;
	
	public int getReserve_num() {
		return reserve_num;
	}
	public void setReserve_num(int reserve_num) {
		this.reserve_num = reserve_num;
	}
	public int getTravel_num() {
		return travel_num;
	}
	public void setTravel_num(int travel_num) {
		this.travel_num = travel_num;
	}
	public int getReserve_count() {
		return reserve_count;
	}
	public void setReserve_count(int reserve_count) {
		this.reserve_count = reserve_count;
	}
	public String getReserve_name() {
		return reserve_name;
	}
	public void setReserve_name(String reserve_name) {
		this.reserve_name = reserve_name;
	}
	public String getReserve_date() {
		return reserve_date;
	}
	public void setReserve_date(String reserve_date) {
		this.reserve_date = reserve_date;
	}
	public String getReserve_email() {
		return reserve_email;
	}
	public void setReserve_email(String reserve_email) {
		this.reserve_email = reserve_email;
	}
	public String getReserve_phone() {
		return reserve_phone;
	}
	public void setReserve_phone(String reserve_phone) {
		this.reserve_phone = reserve_phone;
	}
	public int getPrice_account() {
		return price_account;
	}
	public void setPrice_account(int price_account) {
		this.price_account = price_account;
	}


}
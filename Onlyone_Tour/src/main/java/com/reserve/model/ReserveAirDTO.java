package com.reserve.model;

import lombok.Data;

@Data
public class ReserveAirDTO {

	private int reserve_num;
	private int air_num;
	private int reserve_count;
	private String reserve_name_1;
	private String reserve_date_1;
	private String reserve_email_1;
	private String reserve_phone_1;
	private String reserve_gender_1;
	private String reserve_name_2;
	private String reserve_date_2;
	private String reserve_email_2;
	private String reserve_phone_2;
	private String reserve_gender_2;
	private String reserve_name_3;
	private String reserve_date_3;
	private String reserve_email_3;
	private String reserve_phone_3;
	private String reserve_gender_3;

	private int price_account;
}

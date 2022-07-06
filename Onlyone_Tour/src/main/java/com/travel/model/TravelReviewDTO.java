package com.travel.model;

import lombok.Data;

@Data
public class TravelReviewDTO {
	
	private int treview_num;
	private int travel_num_fk;
	private int treview_score;
	private String treview_comm;
	private String treview_date;
	public int getTreview_num() {
		return treview_num;
	}
	public void setTreview_num(int treview_num) {
		this.treview_num = treview_num;
	}
	public int getTravel_num_fk() {
		return travel_num_fk;
	}
	public void setTravel_num_fk(int travel_num_fk) {
		this.travel_num_fk = travel_num_fk;
	}
	public int getTreview_score() {
		return treview_score;
	}
	public void setTreview_score(int treview_score) {
		this.treview_score = treview_score;
	}
	public String getTreview_comm() {
		return treview_comm;
	}
	public void setTreview_comm(String treview_comm) {
		this.treview_comm = treview_comm;
	}
	public String getTreview_date() {
		return treview_date;
	}
	public void setTreview_date(String treview_date) {
		this.treview_date = treview_date;
	}

}

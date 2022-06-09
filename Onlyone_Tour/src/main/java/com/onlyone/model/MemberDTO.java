package com.onlyone.model;

import lombok.Data;

@Data
public class MemberDTO {
	
	private int member_num;
	private String member_name;
	private String member_id;
	private String member_pwd;
	private String member_phone;
	private String member_email;
	private String member_date;
	private String member_nickname;
	
	
	@Override
	public String toString() {
		return "MemberDTO [member_num=" + member_num + ", member_name=" + member_name + ", member_id=" + member_id
				+ ", member_pwd=" + member_pwd + ", member_phone=" + member_phone + ", member_email=" + member_email
				+ ", member_date=" + member_date + ", member_nickname=" + member_nickname + "]";
	}
	
}

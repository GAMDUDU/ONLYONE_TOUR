package com.onlyone.model;

import lombok.Data;

@Data
public class MemberDTO {
	
	private String member_id;
	private String member_pwd;
	private String member_name;
	private String member_email;
	private String member_gender;
	private String member_phone;
	private String member_birth;
	private String member_addr;
	private String member_detailaddr;
	private String member_reg;
	private int verify;
	
}

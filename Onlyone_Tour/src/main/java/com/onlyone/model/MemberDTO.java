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
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getMember_pwd() {
		return member_pwd;
	}
	public void setMember_pwd(String member_pwd) {
		this.member_pwd = member_pwd;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public String getMember_email() {
		return member_email;
	}
	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}
	public String getMember_gender() {
		return member_gender;
	}
	public void setMember_gender(String member_gender) {
		this.member_gender = member_gender;
	}
	public String getMember_phone() {
		return member_phone;
	}
	public void setMember_phone(String member_phone) {
		this.member_phone = member_phone;
	}
	public String getMember_birth() {
		return member_birth;
	}
	public void setMember_birth(String member_birth) {
		this.member_birth = member_birth;
	}
	public String getMember_addr() {
		return member_addr;
	}
	public void setMember_addr(String member_addr) {
		this.member_addr = member_addr;
	}
	public String getMember_detailaddr() {
		return member_detailaddr;
	}
	public void setMember_detailaddr(String member_detailaddr) {
		this.member_detailaddr = member_detailaddr;
	}
	public String getMember_reg() {
		return member_reg;
	}
	public void setMember_reg(String member_reg) {
		this.member_reg = member_reg;
	}
	public int getVerify() {
		return verify;
	}
	public void setVerify(int verify) {
		this.verify = verify;
	}
	
}

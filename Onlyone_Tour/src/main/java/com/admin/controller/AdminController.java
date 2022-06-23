package com.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.admin.model.AdminDAO;

@Controller
public class AdminController {
	
	@Autowired
	private AdminDAO dao;
	
	@RequestMapping("admin.do")
	public String adminMain() {
		return "/admin/admin_main";
	}
	
}

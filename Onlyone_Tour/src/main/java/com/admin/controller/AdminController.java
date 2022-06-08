package com.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.admin.model.AdminDAO;

@Controller
public class AdminController {
	
	@Autowired
	private AdminDAO dao;
	
	
	
}

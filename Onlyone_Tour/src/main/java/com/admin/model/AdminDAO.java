package com.admin.model;

import java.util.List;


public interface AdminDAO {
	
	List<AdminDTO> getAdminList();
	AdminDTO getMember(int num);
	
}

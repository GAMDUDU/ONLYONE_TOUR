
package com.service.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@Data
@NoArgsConstructor
public class ServiceDTO {
	
	private int service_num;
	private String service_name;
	
	private String service_title;
	private String service_cont;
	private int service_code;
	private String service_check;
	private int service_group;
	private int service_step;
	private int service_indent;
	private int service_view;
	private String service_date;
	private String member_id;
	
	private int c_code;
	private String c_name;
}

package com.airport.model;

import java.util.List;

public interface AirportDAO {

	List<AirportDTO> DatePart(AirportDTO dto);
	
	String MaxT();
}

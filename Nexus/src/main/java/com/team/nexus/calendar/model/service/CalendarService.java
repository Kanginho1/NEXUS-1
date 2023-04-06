package com.team.nexus.calendar.model.service;

import java.util.ArrayList;

import com.team.nexus.calendar.model.vo.Calendar;

public interface CalendarService {
	
	ArrayList<Calendar> selectCalendar(int userNo);
	
	void insertCalendar(Calendar cal);
	
	void dropSchedule(Calendar cal);
	
	
}

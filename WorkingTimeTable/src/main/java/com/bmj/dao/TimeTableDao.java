package com.bmj.dao;

import java.util.List;

import com.bmj.entity.TimeTable;

public interface TimeTableDao {
	int insert(TimeTable timetable);
	List<TimeTable> selectByCompanyCode(int CompanyCode);
}
package com.bmj.dao;

import com.bmj.entity.CompanyPerson;

public interface CompanyPersonDao {
	int insertCompanyPerson(CompanyPerson companyperson);
	CompanyPerson selectCompanyCodeByUserId(String userId);
}

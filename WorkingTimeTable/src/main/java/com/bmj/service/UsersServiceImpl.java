package com.bmj.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bmj.dao.UsersDao;

@Service
public class UsersServiceImpl implements UsersService {
	private static final Logger logger;
	static {
		logger = LoggerFactory.getLogger(UsersServiceImpl.class);
	}
	
	@Autowired
	UsersDao dao;
	
	@Override
	public Integer getUsersCount() {
		Integer result = dao.getUsersCount();
		return result;
	}

}

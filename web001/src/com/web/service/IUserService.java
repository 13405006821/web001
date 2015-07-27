package com.web.service;

import java.util.List;

import com.base.util.Json;
import com.web.entity.User;

public interface IUserService {

	List<User> findList(String username, int start, int length);

	void deleteUser(Integer id);

	User getById(Integer id);

	void saveOrUpdate(User user);

	int findCount(String username);

	Json login(User user);
}

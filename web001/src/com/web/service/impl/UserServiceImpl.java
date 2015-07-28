package com.web.service.impl;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import com.base.util.Constants;
import com.base.util.Json;
import com.web.dao.IUserDao;
import com.web.entity.User;
import com.web.service.IUserService;

@Service("userService")
public class UserServiceImpl implements IUserService {
	
	@Resource
	private IUserDao userDao;

	@Override
	public List<User> findList(String username, int start, int length) {
		String hql = "";
		if(StringUtils.isNotBlank(username)){
			hql += " and username like '%" + username + "%' ";
		}
		return userDao.query(hql, start, length);
	}

	@Override
	public void deleteUser(Integer id) {
		userDao.delete(id);
	}

	@Override
	public User getById(Integer id) {
		return userDao.load(id);
	}

	@Override
	public void saveOrUpdate(User user) {
		if(user.getId() > 0){
			user.setUpdateTime(new Date());
			userDao.update(user);
		}else{
			userDao.save(user);
		}
	}

	@Override
	public int findCount(String username) {
		String hql = "";
		if(StringUtils.isNotBlank(username)){
			hql += " and username like '%" + username + "%' ";
		}
		return userDao.countInt(hql);
	}

	@Override
	public Json login(User user) {
		Json json = new Json();
		String hql = " and username = '" + user.getUsername() + "' ";
		List<User> list = userDao.query(hql);
		json.setMsg(Constants.MSG_LOGIN_FAILURE);
		if(list.size() > 0){
			if(list.get(0).getPassword().equals(user.getPassword())){
				json.setSuccess(true);
				json.setMsg(Constants.MSG_LOGIN_SUCCESS);
			}
		}
		return json;
	}
}

package com.easycart.db.dao;

import java.util.List;

import com.easycart.db.dao.support.ISupport;
import com.easycart.db.entity.User;

public interface IUserDao extends ISupport<User>{

	public User login(String email, String password);

	public List<User> getByCompanyId(Integer id);
}

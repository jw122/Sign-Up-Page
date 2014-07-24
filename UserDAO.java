package com.vaannila.dao;

import java.util.List;

import com.vaannila.domain.User;

public interface UserDAO {
	
	public List<User> listUser(); 
	public void saveUser(User user); 
	public void removeUser(User user);

}

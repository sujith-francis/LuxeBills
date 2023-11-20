package com.Batman.repository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.Batman.bo.UserPrincipal;
import com.Batman.dto.User;

@Service
public class LuxeBillUserDetailsService implements UserDetailsService{
	@Autowired
	private ILuxeBillUserMgmtRepo repo;

	@Override
	public UserDetails loadUserByUsername(String usermail) throws UsernameNotFoundException {
		User user = repo.findByusermail(usermail);
		if(user==null) {
			throw new UsernameNotFoundException("Sorry User Not Found");
		}
		
		return new UserPrincipal(user);
	}

}

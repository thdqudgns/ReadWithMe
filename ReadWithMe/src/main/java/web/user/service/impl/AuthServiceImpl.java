package web.user.service.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import web.user.service.face.AuthService;

@Service
public class AuthServiceImpl implements AuthService, UserDetailsService {

	private static final Logger logger = LoggerFactory.getLogger(AuthServiceImpl.class);
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		
		logger.info("AuthService TEST");
		
		return null;
		
	}
}

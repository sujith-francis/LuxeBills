package com.Batman.config;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import com.Batman.bo.UserPrincipal;
import com.Batman.dto.User;

@Component
public class SecurityAuthenticationSuccessHandler implements AuthenticationSuccessHandler {

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		UserPrincipal principal = (UserPrincipal) authentication.getPrincipal();
		User user = principal.getUser();
		 HttpSession session = request.getSession();
		 session.setAttribute("user", user);
		 response.sendRedirect(request.getContextPath() + "/shop/home");
		
		
	}
  
}

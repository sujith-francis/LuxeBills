package com.Batman.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

import com.Batman.repository.LuxeBillUserDetailsService;

@Configuration
@EnableWebSecurity
public class SecurityConfig {
	@Autowired
	private LuxeBillUserDetailsService service;
	@Autowired
	private SecurityAuthenticationSuccessHandler handler;
	
	@Bean
	public AuthenticationProvider getAuthenticationProvider() {
		DaoAuthenticationProvider daoAuthenticationProvider = new DaoAuthenticationProvider();
		daoAuthenticationProvider.setUserDetailsService(service);
		daoAuthenticationProvider.setPasswordEncoder(new BCryptPasswordEncoder());
		return daoAuthenticationProvider;
	}
	
	@Bean
	public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
		
		http
		  .authorizeRequests()
		  .antMatchers("/index.jsp","/home","/login","/buySubscription").permitAll()
		  .antMatchers("/shop/**").authenticated()
		  .antMatchers("/payment/**").authenticated()
		  .and()
		  .formLogin().usernameParameter("usermail")
		  .loginPage("/login").successHandler(handler)
		  .permitAll()
		  .and()
		  .logout().invalidateHttpSession(true).clearAuthentication(true)
		  .logoutUrl("/shop/logout")
		  .and()
		  .headers().frameOptions().sameOrigin()
		  .and().csrf().disable();
		
		return http.build();
		
		}
	
	
	@Bean
	public PasswordEncoder encoder() {
	    return new BCryptPasswordEncoder();
	}

}

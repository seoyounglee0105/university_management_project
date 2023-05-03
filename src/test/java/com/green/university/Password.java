package com.green.university;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class Password {

	public static void main(String[] args) {
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		
		String password = encoder.encode("123123");
		System.out.println(password);
		
	}
}

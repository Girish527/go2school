package com.goschool.controllers;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

public class ParentsController {

	
	
	
	
	@RequestMapping(value = "/ParentsLogin")  
	public ModelAndView ParentsLogin( ) { 
		System.out.println("the request reached to controller/Reports");		
	    return new ModelAndView("ParentsLogin");  
	}  
	
	
	@RequestMapping(value = "/ParentsRegister")  
	public ModelAndView ParentsRegister( ) { 
		System.out.println("the request reached to controller/Reports");		
	    return new ModelAndView("ParentsRegister");  
	}  
	
	
	
}

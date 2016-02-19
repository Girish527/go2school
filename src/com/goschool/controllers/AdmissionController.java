package com.goschool.controllers;

//ackage com.beingjavaguys.controller;  

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;  

import javax.servlet.http.HttpServletResponse;







//import org.springframework.beans.factory.annotation.Autowired;  
import org.springframework.stereotype.Controller;  
import org.springframework.web.bind.annotation.ModelAttribute;  
import org.springframework.web.bind.annotation.RequestMapping;  
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.bind.annotation.RequestParam;  
import org.springframework.web.servlet.ModelAndView;  

import com.goschool.beans.Address;
import com.goschool.beans.Admin;
import com.goschool.beans.RecentActivity;
import com.goschool.beans.School;
import com.goschool.beans.Student; 
//import com.beingjavaguys.domain.Employee;  
//import com.goschool.services.AdmissionService;  
import com.goschool.services.AdmissionServiceImpl;
import com.goschool.services.SchoolDataService;
  
@SuppressWarnings("unused")
@Controller  
public class AdmissionController {  
   
private AdmissionServiceImpl serviceimpl;
private SchoolDataService schoolService;


public SchoolDataService getSchoolService() {
	return schoolService;
}

public void setSchoolService(SchoolDataService schoolService) {
	this.schoolService = schoolService;
}

public AdmissionServiceImpl getServiceimpl() {
	return serviceimpl;
}

public void setServiceimpl(AdmissionServiceImpl serviceimpl) {
	this.serviceimpl = serviceimpl;
}



@RequestMapping(value = "/search", method = RequestMethod.GET)  
public ModelAndView displaySchoolPage(@ModelAttribute RecentActivity recentActivity) {  
	//List<RecentActivity> RecentActivityList=serviceimpl.getRecentActivityInfo();
	
 //return new ModelAndView("schoolpage","RecentActivityList",RecentActivityList);
	//return new ModelAndView("search","RecentActivityList",RecentActivityList);
	return new ModelAndView("search");
}  


 @RequestMapping(value = "/admissionForm", method = RequestMethod.GET)  
 public ModelAndView getForm(@ModelAttribute Student student,@RequestParam int adminid,@RequestParam int id) {  
	 //get the school name to auto fill in textBox
	 System.out.println("the adminid and school id is"+adminid +"---------->"+id);
	 School school=serviceimpl.getSchoolNameForFill(id);
  return new ModelAndView("admissionForm","school",school);  
 }  
  
 @RequestMapping("/register")  
 public ModelAndView registerUser(@ModelAttribute("student1") Student student,@RequestParam int adminid) {  
	 	 	 
	 System.out.println("student school name"+student.getSchoolName());
	 student.setAdminid(adminid);
	 
	 int temp=this.serviceimpl.insertRow(student);	 
//	 System.out.println("this is id");
	 
	 if(temp==0)
    return new ModelAndView("studentregister"); 
	 else
	return new ModelAndView("Adminverify");	 
  
//  return new ModelAndView("redirect/list","student",student);
 }  
 
 @RequestMapping(value = "/StudentMail", method = RequestMethod.GET)  
 public ModelAndView getEmail1(@ModelAttribute Student student,@RequestParam int id) { 
	 Student studentpdf = serviceimpl.getPresentUserDetailsForPdfById(id,student);
  return new ModelAndView("StudentPdf","studentpdf",studentpdf);  
 }  
 

 @RequestMapping("/list")  
 public ModelAndView getList() {  
  List<Student> studentList = serviceimpl.getList();  
  return new ModelAndView("list", "studentList", studentList);  
 }  
  
 @RequestMapping(value="/mainpage",method = RequestMethod.GET)  
 public ModelAndView deleteUser( ) {  
	  
  return new ModelAndView("mainpage");  
 }  
  /*
 @RequestMapping("edit")  
 public ModelAndView editUser(@RequestParam int id,  
   @ModelAttribute Student student) {  
	 Student studentObject = admissionService.getRowById(id);  
  return new ModelAndView("edit", "studentObject", studentObject);  
 }  
  
 @RequestMapping("update")  
 public ModelAndView updateUser(@ModelAttribute Student student) {  
	 admissionService.updateRow(student);  
  return new ModelAndView("redirect:list");  
 }  
  */
 
 @RequestMapping(value = "/schoolSearch", method = RequestMethod.GET, produces="MediaType.TEXT_HTML_VALUE")   
 public void search(@RequestParam String key,HttpServletResponse response) throws IOException {  
	// System.out.println("PRANEETH:"+key);
	 if(key.length()>=1){
 	List<School> result=schoolService.getSchools(key);
 	String returnValue="<ul>";
 	for(int i=0;i<result.size();i++){
 		School school=result.get(i);
 		returnValue+="<li><a href=display.htm?id="+school.getId()+">"+school.getSchoolName()+"</a></li>";
 	}
 	returnValue+="</ul>";
 	System.out.println(returnValue);
 	response.getWriter().write(returnValue);
	 }
 }  
 
 
 @RequestMapping(value = "/schoolsList", method = RequestMethod.GET)   
 public ModelAndView schoolsList(@RequestParam String id) {  // need to change to key ask praneeth
	 System.out.println("Praneeth:"+id);
 	List<School> result=schoolService.getSchools(id);
 	List<Address> addressList=schoolService.getAddresses(id);
 	System.out.println("result of school----->"+result.size()+"size of the address"+addressList.size());
 	ModelAndView model1 = new ModelAndView("schoolList");
	model1.addObject("schoolList",result);
	model1.addObject("addressList",addressList);
	return model1; 
	    
	    	    
 	//return new ModelAndView("schoolList","list",result);	
 	
 }  
 
 
 @RequestMapping(value = "/display", method = RequestMethod.GET)  
 public ModelAndView display(@RequestParam int id) {
	 String Schema="schooldb";
 	School school=schoolService.getSchool(id,Schema);
 	System.out.println("the school size or school list"+school.getImagepath());
 	List<RecentActivity> RecentActivityList=serviceimpl.getRecentActivityInfo(id);
 	
 	ModelAndView model1 = new ModelAndView("schoolpage1");
	model1.addObject("school",school);
	model1.addObject("RecentActivityList",RecentActivityList);
	return model1; 
 	
 	//return new ModelAndView("schoolpage","RecentActivityList",RecentActivityList);
 	//return new ModelAndView("schoolpage", "school", school);  
 }  
 
}  
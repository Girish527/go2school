package com.goschool.controllers;


import java.util.List;  

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


//import org.springframework.beans.factory.annotation.Autowired;  
import org.springframework.stereotype.Controller;  
import org.springframework.web.bind.annotation.ModelAttribute;  
import org.springframework.web.bind.annotation.RequestMapping;  
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
//import org.springframework.web.bind.annotation.RequestParam;  
import org.springframework.web.servlet.ModelAndView;  

import com.goschool.beans.Admin; 
//import com.beingjavaguys.domain.Employee;  
//import com.goschool.services.AdmissionService;  
import com.goschool.services.AdminRegisterServiceImpl;

@Controller  
@SessionAttributes("adminId")
public class AdminRegisterController {  
	
//All objects are in small letters 
//All variables start with Capital letter
//All Methods must follow came notation
	
	
private AdminRegisterServiceImpl adminregisterserviceimpl;

public AdminRegisterServiceImpl getAdminregisterserviceimpl() {
	return adminregisterserviceimpl;
}

public void setAdminregisterserviceimpl(
		AdminRegisterServiceImpl adminregisterserviceimpl) {
	this.adminregisterserviceimpl = adminregisterserviceimpl;
}


//handler for adminRegistrationform
@RequestMapping(value = "/AdminForm", method = RequestMethod.GET)  
public ModelAndView getAdmissionForm(@ModelAttribute Admin admin) { 
return new ModelAndView("AdminForm");  
}  

//handle for admin login form
@RequestMapping(value = "/Adminlogin", method = RequestMethod.GET)  
public ModelAndView getAdminLoginForm(@ModelAttribute Admin admin) { 
return new ModelAndView("Adminlogin");  
}  


//handle for Admin login verification
@RequestMapping(value = "/Adminloginverify")  
public ModelAndView getAdminLoginVerify(@ModelAttribute("admin1") Admin admin,HttpSession session) {
		  
	  System.out.println("the username is"+admin.userName);
	  session.setAttribute("AdminName", admin.userName);
	  String UserName=admin.userName;
	  String Password=admin.password;
	  List<Admin> Adminlist=adminregisterserviceimpl.verifyAdminLogin(UserName,Password);
	  
	  if(Adminlist!=null){
		  int adminid=Adminlist.get(0).getId();
		  session.setAttribute("adminId", adminid);
		  int schoolid=adminregisterserviceimpl.getSchoolid(adminid);
		  String SchoolName=adminregisterserviceimpl.getSchoolName(schoolid);
		  session.setAttribute("SchoolName", SchoolName);
		  session.setAttribute("schoolid", schoolid);
		  System.out.println("the schoolid:"+schoolid+"the adminid:"+adminid);
		return new ModelAndView("Adminpage","admin",admin);	
	  }
	  else 
		  return new ModelAndView("AdminmodifyVerify");
}


//verified the admin registration form
@RequestMapping(value = "/Adminverify")  
public ModelAndView getVerify(@ModelAttribute("admin1") Admin admin) {
	
	int Temp=adminregisterserviceimpl.verifyUser(admin);
	if(Temp==1)
	{
return new ModelAndView("Adminverify");
	}
	else
	{//here we have to some work so mind it 
		System.out.println("it is in the else part");
		this.adminregisterserviceimpl.insertRow(admin);
		return new ModelAndView("Adminregister","admin",admin);
	}
	
}


//handling register
@RequestMapping("/Adminregister")  
public ModelAndView registerUser(@ModelAttribute("admin1") Admin admin) {  
	
	System.out.println("request entering into register"+admin.userName);
	// this.adminregisterserviceimpl.insertRow(admin);
 
return new ModelAndView("Adminregister");  

}  


//handling for sending Email
@RequestMapping(value="/Adminemail1", method=RequestMethod.GET)  
public ModelAndView getEmail1(@RequestParam int id,@ModelAttribute Admin admin,HttpServletRequest request,HttpServletResponse response) {  	
	System.out.println("the size of admin:"+admin.toString().length());
	
	//calling method for sending email
	//adminregisterserviceimpl.sendEmail(id);
	
	Admin adminpdf = adminregisterserviceimpl.getPresentUserDetailsForPdfById(id,admin);
	 System.out.println("the username in pdf mode==="+adminpdf.userName);
	 
    return new ModelAndView("Adminpdf", "adminpdf", adminpdf); 
}  

//display list of admins
@RequestMapping("/Adminlist")  
public ModelAndView getList() {  
	System.out.println("enters into list");
List<Admin> adminList = adminregisterserviceimpl.getList();  
return new ModelAndView("Adminlist", "adminList", adminList);  
}  


//handle edit details
@RequestMapping(value="/AdminEdit", method = RequestMethod.GET)  
public ModelAndView editUser(@RequestParam int id,@ModelAttribute Admin admin) { 
	
	 Admin adminEdit = adminregisterserviceimpl.getPresentUserDetailsById(id,admin);
	 System.out.println("the username in edit mode in controller==="+adminEdit.userName);
	 
     return new ModelAndView("Adminedit", "adminEdit", adminEdit);  
}  




//handle update 
@RequestMapping(value="/Adminupdate")  
public ModelAndView updateUser(@RequestParam int id,@ModelAttribute("admin1") Admin admin) { 
	
	    System.out.println("the username in the first"+admin.userName);	
		int Temp=adminregisterserviceimpl.verifyUser(admin);		
		if(Temp==1)
		{
	return new ModelAndView("Adminverify");
		}
		else
		{//here we have to some work so mind it 
			System.out.println("it is in the else part of update");
			adminregisterserviceimpl.updatePresentUserDetailsRow(admin);
			System.out.println("After inserted");
		     return new ModelAndView("Adminregister","admin1",admin);   
		}
	 
}

/*@RequestMapping("delete")  
public ModelAndView deleteUser(@RequestParam int id) {  
	 admissionService.deleteRow(id);  
return new ModelAndView("redirect:list");  
}  */


}  

package com.goschool.services;

import java.util.List;    

import com.goschool.daoimplementations.AdminRegisterDaoImpl;
import com.goschool.beans.Admin;  
//import com.schoolbridge.daoimplementations.SchoolDAOImplementation;
  
public class AdminRegisterServiceImpl  {  
   
  
	public AdminRegisterDaoImpl getAdminregisterdaoimpl() {
		return adminregisterdaoimpl;
	}


	public void setAdminregisterdaoimpl(AdminRegisterDaoImpl adminregisterdaoimpl) {
		this.adminregisterdaoimpl = adminregisterdaoimpl;
	}


	AdminRegisterDaoImpl adminregisterdaoimpl;  

//service method for 
public int verifyUser(Admin admin){
	int temp1=adminregisterdaoimpl.verifyUser(admin);
	return temp1;
}
	

 public int insertRow(Admin admin) {  
  return this.adminregisterdaoimpl.insertRow(admin);  
 }  
  
   
 public List<Admin> verifyAdminLogin(String username,String password)
 {
	 return this.adminregisterdaoimpl.verifyAdminLogin(username,password);
 }
public List<Admin> getList() {  
  return adminregisterdaoimpl.getList();  
 }  
  
 
 public Admin getPresentUserDetailsById(int id,Admin admin) {  
  return adminregisterdaoimpl.getPresentUserDetailsById(id,admin);  
 } 
  
  
 public int updatePresentUserDetailsRow(Admin admin) {  
  return adminregisterdaoimpl.updatePresentUserDetailsRow(admin);  
 }


public void sendEmail(int id) {
	// TODO Auto-generated method stub
	adminregisterdaoimpl.sendEmail(id);
	
}


public Admin getPresentUserDetailsForPdfById(int id, Admin admin) {
	// TODO Auto-generated method stub
	return adminregisterdaoimpl.getPresentUserDetailsForPdfById(id,admin);
	
}


public int getSchoolid(int adminid) {
	// TODO Auto-generated method stub
	int schoolId=adminregisterdaoimpl.getSchoolid(adminid);
	return schoolId;
}


public String getSchoolName(int schoolid) {
	// TODO Auto-generated method stub
	
	return adminregisterdaoimpl.getSchoolName(schoolid);
}
 
 
 
 /* 
 @Override  
 public int deleteRow(int id) {  
  return admissionDao.deleteRow(id);  
 }  */
  
 
}  
  
  
  
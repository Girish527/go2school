package com.goschool.services;

import java.util.List;    

import com.goschool.daoimplementations.AdmissionDaoImpl;
import com.goschool.beans.RecentActivity;
import com.goschool.beans.School;
import com.goschool.beans.Student;  
//import com.schoolbridge.daoimplementations.SchoolDAOImplementation;
  
public class AdmissionServiceImpl  {  
   
  
	AdmissionDaoImpl admissiondaoimpl;  
	

	public AdmissionDaoImpl getAdmissiondaoimpl() {
		return admissiondaoimpl;
	}


	public void setAdmissiondaoimpl(AdmissionDaoImpl admissiondaoimpl) {
		this.admissiondaoimpl = admissiondaoimpl;
	}
	
	
 public int insertRow(Student student) {  
  return this.admissiondaoimpl.insertRow(student);  
 }  
  
   
 


public List<Student> getList() {  
  return admissiondaoimpl.getList();  
 }


public List<RecentActivity> getRecentActivityInfo(int id) {
	// TODO Auto-generated method stub
	List<RecentActivity> RecentActivityList=admissiondaoimpl.getRecentActivityInfo(id);
	return RecentActivityList;
}


public School getSchoolNameForFill(int id) {
	// TODO Auto-generated method stub
	
	School school=admissiondaoimpl.getSchoolNameForFill(id);
	return school;
}


public Student getPresentUserDetailsForPdfById(int id, Student student) {
	// TODO Auto-generated method stub
	
	Student student1=admissiondaoimpl.getPresentUserDetailsForPdfById(id,student);
	return student1;
}  
  
/* @Override  
 public Student getRowById(int id) {  
  return admissionDao.getRowById(id);  
 }  
  
 @Override  
 public int updateRow(Student student) {  
  return admissionDao.updateRow(student);  
 }  
  
 @Override  
 public int deleteRow(int id) {  
  return admissionDao.deleteRow(id);  
 }  
  */
 
}  
  
  
  

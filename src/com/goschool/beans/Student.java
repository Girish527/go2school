package com.goschool.beans;

//import javax.persistence.Column;
//import javax.persistence.Entity;
//import javax.persistence.GeneratedValue;
//import javax.persistence.Id;
//import javax.persistence.Table;
 

//@Entity
//@Table(name="student")
public class Student {  
  
//@Id  
//@GeneratedValue
//@Column(name = "id")
 private int id; 
//@Column(name = "firstname") 
 private String firstName; 
//@Column(name = "lastname") 
 private String lastName;
//@Column(name = "email") 
 private String email;
//@Column(name = "phone") 
 private String phone;  
 private String schoolName;
 private String place;
 private int adminid;
 public int getAdminid() {
	return adminid;
}

public void setAdminid(int adminid) {
	this.adminid = adminid;
}

public String getSchoolName() {
	return schoolName;
}

public void setSchoolName(String schoolName) {
	this.schoolName = schoolName;
}

public String getPlace() {
	return place;
}

public void setPlace(String place) {
	this.place = place;
}

public int getId() {  
  return id;  
 }  
  
 public void setId(int id) {  
  this.id = id;  
 }  
  
 public String getFirstName() {  
  return firstName;  
 }  
  
 public void setFirstName(String firstName) {  
  this.firstName = firstName;  
 }  
  
 public String getLastName() {  
  return lastName;  
 }  
  
 public void setLastName(String lastName) {  
  this.lastName = lastName;  
 }  
  
 public String getEmail() {  
  return email;  
 }  
  
 public void setEmail(String email) {  
  this.email = email;  
 }  
  
 public String getPhone() {  
  return phone;  
 }  
  
 public void setPhone(String phone) {  
  this.phone = phone;  
 }  
  
}  
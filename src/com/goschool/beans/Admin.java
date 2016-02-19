package com.goschool.beans;

//import javax.persistence.Column;
//import javax.persistence.Entity;
//import javax.persistence.GeneratedValue;
//import javax.persistence.Id;
//import javax.persistence.Table;


//@Entity
//@Table(name="student")
public class Admin {  

//@Id  
//@GeneratedValue
//@Column(name = "id")
private int id; 
//@Column(name = "firstname") 
public String firstName; 
//@Column(name = "lastname") 
public String lastName;
//@Column(name = "email") 
public String email;
//@Column(name = "phone") 
public String phone;
public  String userName;
public String password;
public int pincode;
public String schoolname;

public int getPincode() {
	return pincode;
}

public void setPincode(int pincode) {
	this.pincode = pincode;
}

public String getSchoolname() {
	return schoolname;
}

public void setSchoolname(String schoolname) {
	this.schoolname = schoolname;
}

public String getCity() {
	return city;
}

public void setCity(String city) {
	this.city = city;
}

public String city;


public String getUserName() {
	return userName;
}

public void setUserName(String userName) {
	this.userName = userName;
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


public String getuserName() {  
	  return userName;  
	 }  
	  
public void setuserName(String userName) {  
	  this.userName = userName;  
	 }  

public String getPassword() {  
		  return password;  
		 }  
		  
public void setPassword(String password) {  
		  this.password = password;  
		 }  


}  

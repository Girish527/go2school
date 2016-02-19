package com.goschool.beans;

public class School {
private int id;
public String schoolName;
public String place;

public String getPlace() {
	return place;
}

public void setPlace(String place) {
	this.place = place;
}

public String getSchoolName() {
	return schoolName;
}

public void setSchoolName(String schoolName) {
	this.schoolName = schoolName;
}

public String imagepath;
public int adminid;

public int getAdminid() {
	return adminid;
}

public void setAdminid(int adminid) {
	this.adminid = adminid;
}

public String getImagepath() {
	return imagepath;
}

public void setImagepath(String imagepath) {
	this.imagepath = imagepath;
}


public int getId() {
	return id;
}

public void setId(int id) {
	this.id = id;
}

}

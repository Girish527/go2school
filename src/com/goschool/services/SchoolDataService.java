package com.goschool.services;

import java.util.List;

import com.goschool.beans.Address;
import com.goschool.beans.School;
import com.goschool.daoimplementations.SchoolDaoImplementation;

public class SchoolDataService {

	private SchoolDaoImplementation schooldao;

	public SchoolDaoImplementation getSchooldao() {
		return schooldao;
	}

	public void setSchooldao(SchoolDaoImplementation schooldao) {
		this.schooldao = schooldao;
	}

	public List<School> getSchools(String key){
		return schooldao.getSchools(key);
	}
	
	public School getSchool(int id, String schema){
		School school= schooldao.getSchool(id, schema);
		return school;
	}

	public List<Address> getAddresses(String id) {
		// TODO Auto-generated method stub
		
		List<Address> addressesList=schooldao.getAddresses(id);
		
		return addressesList;
	}
}

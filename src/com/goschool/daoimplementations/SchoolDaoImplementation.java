package com.goschool.daoimplementations;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;

import com.goschool.beans.Address;
import com.goschool.beans.RecentActivity;
import com.goschool.beans.School;
import com.goschool.beans.Student;

@SuppressWarnings("unused")
public class SchoolDaoImplementation {
	@Autowired
	 SessionFactory sessionFactory; 
	   
	 public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@SuppressWarnings("unchecked")
	public List<School> getSchools(String key){
		Session session=sessionFactory.openSession();
		//Query query =session.createSQLQuery("CALL GetSchools(:key)").addEntity(Student.class).setParameter("key", key);
		Criteria cr=session.createCriteria(School.class);
		cr.add(Restrictions.like("schoolName", key, MatchMode.ANYWHERE));
		//session.close();
		return (List<School>)cr.list();
	}
	
	public School getSchool(int id,String schema){
		Session session=sessionFactory.openSession();
		 School school=(School) session.get(School.class,id);
		 //session.close();
		 return school;
	}

	@SuppressWarnings("unchecked")
	public List<Address> getAddresses(String id) {
		// TODO Auto-generated method stub
		Session session=sessionFactory.openSession();
		Query query1 = session.createQuery("select s.id from School s where s.schoolName like '%"+id+"%'");
		System.out.println("the school list size"+query1.list());
		Query query2 = session.createQuery("from Address a where a.schoolId in (:ids)").setParameterList("ids", query1.list());
		System.out.println("the address list size"+query2.list());
		//session.close();
		return (List<Address>)query2.list();
		
	}
	
}

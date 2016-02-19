package com.goschool.daoimplementations;

//import java.io.Serializable;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
//import org.hibernate.Transaction;
//import org.hibernate.bytecode.buildtime.spi.Logger;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.transaction.annotation.Transactional;







import com.goschool.beans.Admin;
import com.goschool.beans.RecentActivity;
import com.goschool.beans.School;
import com.goschool.beans.Student;
  
@SuppressWarnings("unused")
public class AdmissionDaoImpl  {  
  
	
	
private static final Logger logger = LoggerFactory.getLogger(AdmissionDaoImpl.class);	
@Autowired
 SessionFactory sessionFactory; 

public SessionFactory getSessionFactory() {
	return sessionFactory;
}

public void setSessionFactory(SessionFactory sessionFactory) {
	this.sessionFactory = sessionFactory;
}
 

//@Transactional  
 public int insertRow(Student student) {  
	 int temp=0;
	try
	{
	
	   System.out.println("program coming upto dao implementation to insert student row");
	   // sessionFactory=new Configuration().configure().buildSessionFactory();
	   Session session = sessionFactory.openSession();
	   Transaction transaction=session.beginTransaction();
	   session.save(student);
	   System.out.println("the student dettails and the use query value"+student.toString()+"---");
       logger.info("student saved successfully, Person Details="+student); 
	   transaction.commit();	
       session.close();
   
	
	}catch(Exception e)
	{
		System.out.println("expectederror:"+e);
		temp=1;
	}
	//return (Integer) id;
	return temp;

 }  
   
 

public List<Student> getList() {  
	System.out.println("program enters into the list");
  Session session = sessionFactory.openSession();
  System.out.println("11");
  @SuppressWarnings("unchecked")  
  List<Student> employeeList = session.createQuery("from Student")  
    .list();  
  session.close();  
  return employeeList;  
 }  
  /*
   * 
   
 @Override  
 public Student getRowById(int id) {  
  Session session = sessionFactory.openSession();  
  Student student = (Student) session.load(Student.class, id);  
  return student;  
 }  
  
 @Override  
 public int updateRow(Student student) {  
  Session session = sessionFactory.openSession();  
  Transaction tx = session.beginTransaction();  
  session.saveOrUpdate(student);  
  tx.commit();  
  Serializable id = session.getIdentifier(student);  
  session.close();  
  return (Integer) id;  
 }  
  
 @Override  
 public int deleteRow(int id) {  
  Session session = sessionFactory.openSession();  
  Transaction tx = session.beginTransaction();  
  Student student = (Student) session.load(Student.class, id);  
  session.delete(student);  
  tx.commit();  
  Serializable ids = session.getIdentifier(student);  
  session.close();  
  return (Integer) ids;  
 }  
  
  */

@SuppressWarnings("unchecked")
public List<RecentActivity> getRecentActivityInfo(int id) {
	// TODO Auto-generated method stub
	
	Session Session = sessionFactory.openSession();
    System.out.println("11");
    List<RecentActivity> ActivityList1 = Session.createQuery("from RecentActivity R where schoolId='"+id+"'")  
    .list();  
    System.out.println(ActivityList1.size());
    Session.close();  
    return ActivityList1; 
}

public School getSchoolNameForFill(int id) {
	// TODO Auto-generated method stub
	Session session = sessionFactory.openSession();
	//Query query1 = session.createQuery("from School s where s.adminid="+adminid);
	System.out.println("the  id value in in dao"+id);
	School school=(School)session.get(School.class, id);
	System.out.println("the schoolname value in dao"+school.getAdminid()+"-------->"+school.getSchoolName());
	session.close();
	return school;
	//return (School)query1.list();
}

public Student getPresentUserDetailsForPdfById(int id, Student student) {
	// TODO Auto-generated method stub
	    System.out.println("id:"+id);
        Session Session = sessionFactory.openSession();
        Transaction Tx = Session.beginTransaction();
        student = (Student) Session.get(Student.class,new Integer(id));  
        Tx.commit();
        Session.close();
     return student;  
}
  
}  
  
package com.goschool.daoimplementations;

import java.io.Serializable;
import java.net.URL;
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
import org.springframework.jdbc.core.JdbcTemplate;


//import org.springframework.transaction.annotation.Transactional;
import com.goschool.beans.School;


import com.goschool.beans.Admin;





//these all are for email
 //import javax.mail.Session;
 import java.util.Properties;  

import javax.activation.DataHandler;
import javax.mail.BodyPart;
import javax.mail.Message; 
import javax.mail.MessagingException; 
import javax.mail.Multipart;
import javax.mail.SendFailedException; 
import javax.mail.Transport; 
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart; 
import javax.mail.internet.MimeMessage; 
import javax.mail.internet.MimeMultipart;
//upto this for email
import javax.mail.util.ByteArrayDataSource;



  
@SuppressWarnings("unused")
public class AdminRegisterDaoImpl  {  
  
	
	
private static final Logger logger = LoggerFactory.getLogger(AdminRegisterDaoImpl.class);	
@Autowired
 SessionFactory sessionFactory; 

public SessionFactory getSessionFactory() {
	return sessionFactory;
}

public void setSessionFactory(SessionFactory sessionFactory) {
	this.sessionFactory = sessionFactory;
}  


//this method verification for Admin
@SuppressWarnings({ "rawtypes" })
public int verifyUser(Admin admin){
	int Temp=2;
	Session Session=sessionFactory.openSession();
	System.out.println("admin value:"+admin.userName);
	String Hql = "SELECT A.userName FROM Admin A";
	Query Query = Session.createQuery(Hql);
	List Results = Query.list();
	
	System.out.println("the size of userlist is:"+Results.size());
	for(int i=0;i<Results.size();i++)
	{
		System.out.println(Results.get(i));
		if((Results.contains(admin.userName))){
			 Temp=1;
		}
	}
	
	if(Temp==2)
	{
		// work going over here
		    System.out.println("checking for generating schema value");
			String Hql1="create schema"+" "+admin.userName;
			Query Query1=Session.createSQLQuery(Hql1);
			int k=Query1.executeUpdate();
			System.out.println("schema value:"+k);
		}  
	
	
	Session.close();
	System.out.println("temp value is:"+Temp);
	return Temp;
}


//this method is used for verification when the admin values updated
//@SuppressWarnings({ "rawtypes" })
//this method is used for insert the registered values into database 
 public int insertRow(Admin admin) {  
	Serializable Id=null;
	try
	{
	
	   System.out.println("program coming upto dao implementation");
	   // sessionFactory=new Configuration().configure().buildSessionFactory();
	   Session Session = sessionFactory.openSession();
	   Transaction Transaction=Session.beginTransaction();
	   Session.save(admin);
       logger.info("admin saved successfully, Person Details="+admin); 
	   Transaction.commit();	
	   Id = Session.getIdentifier(admin);
       Session.close();
   
	
	}catch(Exception e)
	{
		System.out.println("expectederror:"+e);
	}
	return (Integer) Id;

 }  
   
//this method is used for check admin login
 @SuppressWarnings("unchecked")
public List<Admin> verifyAdminLogin(String UserName,String Password)
 {
	 
	    int Temp=1;	 
	    Session Session = sessionFactory.openSession();
		//Query using Hibernate Query Language
	    //username:girish527,password:qw
	   System.out.println("1");
		String SQL_QUERY =" from Admin as o where o.userName=? and o.password=?";
		Query Query = Session.createQuery(SQL_QUERY);
		Query.setParameter(0,UserName);
		Query.setParameter(1,Password);
		System.out.println("2");
		List<Admin> List = (List<Admin>)Query.list();
		System.out.println("3");
		//this is for use database
		if ((List != null) && (List.size() > 0)) {
			//String Hql1="use"+" "+UserName;
			//Query Query1=Session.createSQLQuery(Hql1);
			//int k=Query1.executeUpdate();
			//System.out.println("schema value:"+k);
			System.out.println("4");
			return List;
			//Temp=2;
		}
		else
		{
			System.out.println("List is null");
			List=null;
			return List;
		}
		//Session.close();
	 	
 }
 
 
 
 
//this method is used for to get the list of all the admins
public List<Admin> getList() {  
	System.out.println("program enters into the list");
    Session Session = sessionFactory.openSession();
    System.out.println("11");
    @SuppressWarnings("unchecked")  
    List<Admin> employeeList = Session.createQuery("from Admin")  
    .list();  
    Session.close();  
    return employeeList;  
 }  
  




//this method is used for get the details of present admin by using id to edit details
 @SuppressWarnings("rawtypes")
public Admin getPresentUserDetailsById(int Id,Admin admin) {  
	 	System.out.println("id:"+Id);
	    Session Session = sessionFactory.openSession();
	    String Hql = "SELECT A.userName FROM Admin A where id="+Id;
	    
		Query Query = Session.createQuery(Hql);
		List Results = Query.list();		
		System.out.println("the size of userlist is:"+Results.size());
		String SchemaName;
		for(int i=0;i<Results.size();i++)
		{
			System.out.println("the present username in the edit "+Results.get(i));
			SchemaName=(String) Results.get(i);
			System.out.println(SchemaName);
			int Result=dropSchema(SchemaName);
			System.out.println(Result);
		}
		
			Session.flush(); 
            Transaction Tx = Session.beginTransaction();
            Admin admin1 = (Admin) Session.get(Admin.class,new Integer(Id)); 
            Admin admin2=(Admin)Session.get(Admin.class,new Integer(Id));
            Session.delete(admin1);  
            Tx.commit();
            Session.close();
            System.out.println("the size of admin2 in dao is"+admin2.hashCode());
         return admin2;  
 } 
 
 
 //this method insert the updated values into the table 
 public int updatePresentUserDetailsRow(Admin admin) {  
  Session Session = sessionFactory.openSession();  
  Transaction Tx = Session.beginTransaction();  
  //Session.saveOrUpdate(admin);
  Session.save(admin);
  Tx.commit();  
  Serializable Id = Session.getIdentifier(admin);  
  Session.close();  
  return (Integer) Id;  
 }  
 
public int dropSchema(String SchemaName)
{
	Session Session = sessionFactory.openSession(); 
	System.out.println("checking for dropping schema value");
	String Hql1="drop schema"+" "+SchemaName;
	Query Query1=Session.createSQLQuery(Hql1);
	int K=Query1.executeUpdate();
	System.out.println("schema value:"+K);
	
	return K;
}


//this method for sending mail
public void sendEmail(int param) {
	// TODO Auto-generated method stub
	/*
	
	try {
        
        String host = "smtp.gmail.com";
        String Password = "986646514698";
        String from = "ggguru74@gmail.com";
        String toAddress = "girish.gorantla@gmail.com";  //Receivers email id     
        Properties props = System.getProperties();
        props.put("mail.smtp.host", host);
        props.put("mail.smtps.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        
        javax.mail.Session session1 = javax.mail.Session.getInstance(props, null);

        MimeMessage message = new MimeMessage(session1);

        message.setFrom(new InternetAddress(from));

        message.setRecipients(Message.RecipientType.TO, toAddress);

        message.setSubject("Test Email");

        BodyPart messageBodyPart = new MimeBodyPart();
         
             message.setSubject("from goschool");
        messageBodyPart.setText("you registered sucessfully");
      
        MimeBodyPart attachment=new MimeBodyPart();
        ByteArrayDataSource dataSource=new ByteArrayDataSource(new URL("http://localhost:9093/GoSchoolAdmin/email1.htm?id="+param).openStream(), "application/pdf");
        attachment.setDataHandler(new DataHandler(dataSource));
        attachment.setFileName("Confirmation.pdf");
        
        
        
        Multipart multipart = new MimeMultipart();

        multipart.addBodyPart(messageBodyPart);
        multipart.addBodyPart(attachment);
        
        messageBodyPart = new MimeBodyPart();     

        message.setContent(multipart);

        try {
            Transport tr = session1.getTransport("smtps");
            tr.connect(host, from, Password);
            tr.sendMessage(message, message.getAllRecipients());            
            tr.close();
            
            
            System.out.println("fine email sending");
               

        } catch (SendFailedException sfe) {
            
        	System.out.println("failed due to either internet/code");
        	
        }

             }
         
                 catch (Exception e) {
                	 System.out.println("failed due to either internet/code");
        e.printStackTrace();
    }
	
	
	*/
	
}

@SuppressWarnings("rawtypes")
public Admin getPresentUserDetailsForPdfById(int id, Admin admin) {
	// TODO Auto-generated method stub
	System.out.println("id:"+id);
    Session Session = sessionFactory.openSession();
    String Hql = "SELECT A.userName FROM Admin A where id="+id;
    
	Query Query = Session.createQuery(Hql);
	List Results = Query.list();		
	System.out.println("the size of userlist is:"+Results.size());
	String SchemaName;
	for(int i=0;i<Results.size();i++)
	{
		System.out.println("the present username in the edit "+Results.get(i));
		
	}
	
		Session.flush(); 
        Transaction Tx = Session.beginTransaction();
        //Admin admin1 = (Admin) Session.load(Admin.class, id); 
        Admin ad=(Admin)Session.get(Admin.class, new Integer(id));
        System.out.println("in dao user name"+ad.userName);
        Tx.commit();
        Session.close();
     return ad;  
}

public int getSchoolid(int adminid) {
	// TODO Auto-generated method stub
	Session session=sessionFactory.openSession();
	Query query1 = session.createQuery("select s.id from School s where s.adminid="+adminid);
	return (int)query1.list().get(0);
	
}

public String getSchoolName(int schoolid) {
	// TODO Auto-generated method stub
	Session session=sessionFactory.openSession();
	Query query1 = session.createQuery("select s.schoolName from School s where s.id="+schoolid);
	return (String)query1.list().get(0);
}

 
 /*
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
  
}  
  

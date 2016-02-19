package com.goschool.daoimplementations;

import java.io.Serializable;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import com.goschool.beans.RecentActivity;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FilterOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintStream;
import java.sql.*;

import org.apache.poi.EncryptedDocumentException;
import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

@SuppressWarnings("unused")
public class AdminPageDaoImpl {
	
	
	private static final Logger logger = LoggerFactory.getLogger(AdminPageDaoImpl.class);
	@Autowired
	 SessionFactory sessionFactory; 

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	JdbcTemplate db;

	public JdbcTemplate getDb() {
	return db;
	}

	public void setDb(JdbcTemplate db) {
	this.db = db;
	}

	@SuppressWarnings({ "unchecked" })
	public List<RecentActivity> getRecentActivityInfo(int schoolid) {
		// TODO Auto-generated method stub
		
		Session Session = sessionFactory.openSession();
	    System.out.println("11");
	    List<RecentActivity> ActivityList1 = Session.createQuery("from RecentActivity R where R.schoolId="+schoolid)  
	    .list();  
	    System.out.println(ActivityList1.size());
	    Session.close();  
	    return ActivityList1;  
		
	}

	public void addRecentActivity(RecentActivity recentActivityList) {
		// TODO Auto-generated method stub
		
		Serializable Id=null;
		try
		{
		
		   System.out.println("program coming uptorecent activity dao implementation");
		   // sessionFactory=new Configuration().configure().buildSessionFactory();
		   Session Session = sessionFactory.openSession();
		   Transaction Transaction=Session.beginTransaction();
		   Session.save(recentActivityList);
	       logger.info("activity saved successfully, Person Details="+recentActivityList); 
		   Transaction.commit();	
		   Id = Session.getIdentifier(recentActivityList);
	       Session.close();
	       System.out.println("serializable id:"+Id);
		
		}catch(Exception e)
		{
			System.out.println("expectederror:"+e);
		}		
	}

	
	
	public void deleteRecentActivity(int id) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();  
		  Transaction tx = session.beginTransaction();  
		  RecentActivity recentActivity = (RecentActivity) session.load(RecentActivity.class, id);  
		  session.delete(recentActivity);  
		  tx.commit();  
		  Serializable Serializeid = session.getIdentifier(recentActivity);  
		  session.close();  
		  System.out.println("serializable id:"+Serializeid);
		
		
	}

	public RecentActivity getRecentActivityById(int id,
			RecentActivity recentActivity) {
		// TODO Auto-generated method stub 
			  Session session = sessionFactory.openSession();  
			  RecentActivity activityEdit = (RecentActivity) session.load(RecentActivity.class, id);  
			  return activityEdit;  
			 }

	public void convert(File file, String username) {
		// TODO Auto-generated method stub
		
		try
		{
		
//		File file=new File(excelfilepath);
//		FileInputStream fip = new FileInputStream(file);
//		PrintStream fw = new PrintStream(new File("E:/"+username+".csv"));
//		System.out.println("after reading file file specification");
//		Workbook wb = WorkbookFactory.create(fip);
//		
//		Sheet sheet=wb.getSheetAt(0);
//		Row row=null;
//		for(int i=2;i<=sheet.getLastRowNum();i++)
//		{
//		
//			row=sheet.getRow(i);
//			String str="";
//			for(int j=0;j<row.getLastCellNum();j++)
//			{
//				str=str+((j==0)?(int)Float.parseFloat(row.getCell(j).toString()):row.getCell(j).toString())+""+(j==(row.getLastCellNum()-1)?"":",");
//			}
//			System.out.println("val:"+str);
//			fw.println(str);
//			//System.out.println();
//		
//			//calling the function for inserting the csv file
//			int n=InsertCsvFile(username);
//			
//			//delete existing file
//			
//			System.out.println("the no of rows effected is 0 means same data if new "+n);
//			System.out.println("username:"+username+"  file E:/"+username+".csv");			
//		}
//		fw.close();
//		fip.close();
//		//return null;
			
			//File file = new File(excelfilepath);
		      FileInputStream fIP = new FileInputStream(file);
		      PrintStream fw=new PrintStream(new File("E:/"+username+".csv"));
		      Workbook wb = WorkbookFactory.create(fIP);
		      Sheet sheet=wb.getSheetAt(0);
		      Row row = null;
		      int cellCount=sheet.getRow(0).getLastCellNum();
		        for (int i = 2; i <= sheet.getLastRowNum(); i++) {
		            row = sheet.getRow(i);
		            String str="";
		            for (int j = 0; j < cellCount; j++) {
		            	//System.out.println("Number:"+row.getLastCellNum());
		            	String content;
		            	if(row.getCell(j)==null) content="";
		            	else
		            	content=""+((j==0)?(int)Float.parseFloat(row.getCell(j).toString()):row.getCell(j).toString());
		            	//if(row.getCell(j).toString().equals("")) System.out.println("yfu");
		            	content=content.replace("\n", "");
		            		content=content.replace("\t", "");
		            	content=content.trim();
		            	//if(content.equals("")) content=" ";	
		            	str=str+content+""+(j==(cellCount-1)?"":",");
		            	//System.out.println(str);
		            }
		           // System.out.println(str);
		            fw.println(str);
		            //System.out.println();
		        }
		        int n=InsertCsvFile(username);
		        fw.close();
	            fIP.close();

		
		}
		catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (EncryptedDocumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InvalidFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
							
	}

	private int InsertCsvFile(String username) {
		// TODO Auto-generated method stub
		
		
	int n = 0;	
	
try {
			
	
	        Connection connection=DBConnection();
			//Class.forName("com.mysql.jdbc.Driver");		   
		    //String url="jdbc:mysql://localhost:3306/schooldb";  
			//Connection connection=DriverManager.getConnection(url,"root","Girish@527");
			
			String query="LOAD DATA LOCAL INFILE 'E:/"+username+".csv' REPLACE INTO TABLE schooldb.admin FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n'";
			PreparedStatement pre = connection.prepareStatement(query);
			n=pre.executeUpdate();	
			//pre.execute();
					
			connection.close();
			pre.close();
						
		  // } catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
			//	e.printStackTrace();	
			
			
		   } catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		  }
		
		   
		   
		return n;	
		
	} 
	
//function for DB Connection
	
	public static Connection DBConnection()
	{
		Connection connection=null;
		
		try
		{
		Class.forName("com.mysql.jdbc.Driver");		   
	    String url="jdbc:mysql://localhost:3306/schooldb";  
		connection=DriverManager.getConnection(url,"root","Girish@527");
				
			
		
	} catch (ClassNotFoundException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();			
   } catch (SQLException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
  }
		
   return connection;	
	
		
	}

	public int updateRecentActivity(RecentActivity recentActivityList) {
		// TODO Auto-generated method stub
		
		Session Session = sessionFactory.openSession();  
		  Transaction Tx = Session.beginTransaction();  
		  //Session.saveOrUpdate(admin);
		  Session.update(recentActivityList);
		  Tx.commit();  
		  Serializable Id = Session.getIdentifier(recentActivityList);  
		  Session.close();  
		  return (Integer) Id; 
		
	}
	
	
	public boolean createTable(String tableName, String query) {
		// TODO Auto-generated method stub
		try{
			db.execute("use girish527");
			System.out.println("coming dao of table creation1- within spcific user");
			db.execute(query);
			System.out.println("coming dao of table creation2");
			System.out.println("the values after change in"+tableName+"------>"+query);
			db.update("INSERT INTO schooldb.AdminTables VALUES('"+tableName+"','"+query+"');");
			System.out.println("coming dao of table creation3");
			return true;
			}catch(Exception e){
				System.out.println("coming dao of table creation EXCEPTION and it is"+e.toString()+e.getLocalizedMessage()+e.getMessage()+e.getStackTrace());
			return false;
			}
			
	}
	 
	
	
	
	
	
}

package com.goschool.controllers;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.apache.poi.EncryptedDocumentException;
import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.multipart.MultipartFile;


//import com.goschooladmin.beans.Admin;
//import com.goschooladmin.beans.Admin;
import com.goschool.beans.Admin;
import com.goschool.beans.UDFile;
import com.goschool.beans.RecentActivity;
import com.goschool.services.AdminPageService;


@SuppressWarnings("unused")
@Controller
public class AdminPageController {
	private static final Logger logger = LoggerFactory
    .getLogger(AdminPageController.class);
	
	private AdminPageService adminpageserviceimpl;

	

	public AdminPageService getAdminpageserviceimpl() {
		return adminpageserviceimpl;
	}

	public void setAdminpageserviceimpl(AdminPageService adminpageserviceimpl) {
		this.adminpageserviceimpl = adminpageserviceimpl;
	}

	
	@RequestMapping(value = "/AdminpageHome")  
	public ModelAndView AdminpageHome( ) { 
		System.out.println("the request reached to controller/Reports-- adminpage home");		
	    return new ModelAndView("AdminpageHome");  
	}  
	
	@RequestMapping(value = "/AdminRecentActivies")  
	public ModelAndView getRecentActivies(HttpSession session) { 
		int schoolid=(int)session.getAttribute("schoolid");
		System.out.println("the request reached to controller/Recent Activities-----session is accessible-------->"+schoolid);		
		List<RecentActivity> RecentActivityList=adminpageserviceimpl.getRecentActivityInfo(schoolid);
		ModelAndView model1 = new ModelAndView("AdminRecentActivity");
		System.out.println(RecentActivityList.size());
		model1.addObject("RecentActivityList",RecentActivityList);
		model1.addObject("recent",new RecentActivity());
	    return model1;  
	}  
		
	@RequestMapping(value = "/saveRecentActivity", method = RequestMethod.POST)  
	public ModelAndView addRecentActivity(@ModelAttribute("RecentActivityList")RecentActivity RecentActivityList,HttpSession session) {  
		
		RecentActivityList.schoolId=(int)session.getAttribute("schoolid");
		adminpageserviceimpl.addRecentActivity(RecentActivityList); 
		System.out.println("the recent activity details"+RecentActivityList.getSchoolId()+"----"+RecentActivityList.getId()+"-----"+RecentActivityList.getRecentactivity1());
	    return new ModelAndView("Adminpage");  
	 }  
	
	
	
	@RequestMapping(value="/deleteRecentActivityList", method = RequestMethod.GET) 
	public ModelAndView deleteRecentActivity(@RequestParam int id) {  
		
		adminpageserviceimpl.deleteRecentActivity(id);  
	     return new ModelAndView("Adminpage");  
	
	}  	
	
	@RequestMapping(value="/editRecentActivityList", method = RequestMethod.GET)  
	public ModelAndView editRecentActivity(@RequestParam int id,@ModelAttribute RecentActivity recentActivity) { 
		
		System.out.println("the id is--->"+id);
		 RecentActivity activityEdit = adminpageserviceimpl.getRecentActivityId(id,recentActivity);
		 System.out.println("the username in edit mode==="+activityEdit.recentactivity1+"-----schoolid---"+activityEdit.getSchoolId());
		 
	     return new ModelAndView("AdminRecentActivityedit", "activityEdit", activityEdit);  
	}  	
	
	
	@RequestMapping(value = "/AdminRecentActivityUpdate", method = RequestMethod.POST)  
	public ModelAndView updateRecentActivity(@ModelAttribute("activityEdit")RecentActivity RecentActivityList,HttpSession session) {  
		
		RecentActivityList.schoolId=(int)session.getAttribute("schoolid");
		int id=adminpageserviceimpl.updateRecentActivity(RecentActivityList); 
		System.out.println("the recent activity details"+RecentActivityList.getSchoolId()+"----"+RecentActivityList.getId()+"the respose id is"+id);
	    return new ModelAndView("Adminpage");  
	 }  
	
	
	
	
	@RequestMapping(value = "/AdminReports")  
	public ModelAndView getReports( ) { 
		System.out.println("the request reached to controller/Reports");		
	    return new ModelAndView("AdminReports");  
	}  
	
	
	@RequestMapping(value="/AdminExcelView", method = RequestMethod.POST) 
	public ModelAndView ExcelView(@RequestParam("dropDownTables") String TableName,@ModelAttribute("udfile") UDFile udfile ) {  
		 udfile.TableName=TableName;
		 System.out.println("the temporary table name in the controller--->"+udfile.getTableName());
		 
	     return new ModelAndView("AdminExcelView","udfile",udfile);  	
	}  		
	
	

	// for convert xls to csv and insert csv into database also 
	@RequestMapping(value="/AdminExportExcel", method = RequestMethod.POST) 
	public ModelAndView ExportExcel(@RequestParam("file") MultipartFile file,@ModelAttribute("udfile") UDFile udfile) {  		
		try {
      System.out.println("the file details ----->"+file.getContentType()+"---->"+file.getName()+"--->"+file.getOriginalFilename()+"--->"+file.getSize());
			File file1=new File(file.getOriginalFilename());
			file.transferTo(file1);
			adminpageserviceimpl.convert(file1,"admin");
			System.out.println("after coverting csv");
			//File file1=new File("E:/admin.csv");
			//System.out.println("length of file"+file1.length());
			//file1.delete();
			System.out.println("after deleting the file");
		} catch (EncryptedDocumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			udfile.setMsg("Error uploading File");
			return new ModelAndView("AdminReports","udfile",udfile); 
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			udfile.setMsg("Error uploading File");
			return new ModelAndView("AdminReports","udfile",udfile); 
		} 
		
		 System.out.println("BEFORE REDIRECTING");
		 udfile.setMsg("uploaded successfully");
	     return new ModelAndView("AdminReports","udfile",udfile);  
	
	}  	
	
	
	
	//from here all related to tables
	//calling the table creation jsp
	@RequestMapping(value = "/AdminTableCreation", method = RequestMethod.GET)
	public  ModelAndView createTablesView() {
		return new ModelAndView("AdminTablesCreation");
	}

/*
	public  ModelAndView createTable(@RequestParam String tableName,@RequestParam String query) {
	System.out.println("Controller is called");
	adminpageserviceimpl.createTable(tableName, query);
	return new ModelAndView("AdminTablesCreation");
	}
	*/
	
	
	@RequestMapping(value = "/AdminTableSaveinDB", method = RequestMethod.GET)
	public ModelAndView saveTablesinDB(@RequestParam String tableName,@RequestParam String query) {
		System.out.println("the controller called and values"+tableName+"--------->"+query);
		//String tableName="admintables";
		//String query="insert into admintables values('abc','select',2)";
		adminpageserviceimpl.createTable(tableName, query);
		return new ModelAndView("AdminTablesCreation");
	}
	
	
	
	
	
	
}


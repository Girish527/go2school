package com.goschool.services;

import java.util.List;
import java.io.File;
import java.io.IOException;

import com.goschool.beans.RecentActivity;
import com.goschool.daoimplementations.AdminPageDaoImpl;

@SuppressWarnings("unused")
public class AdminPageService {
	
	private AdminPageDaoImpl adminpagedaoimpl;

	public void setAdminpagedaoimpl(AdminPageDaoImpl adminpagedaoimpl) {
		this.adminpagedaoimpl = adminpagedaoimpl;
	}

	public AdminPageDaoImpl getAdminpagedaoimpl() {
		return adminpagedaoimpl;
	}

	@SuppressWarnings({ })
	public List<RecentActivity> getRecentActivityInfo(int schoolid) {
		// TODO Auto-generated method stub
		List<RecentActivity> ActivityList1=adminpagedaoimpl.getRecentActivityInfo(schoolid);
		System.out.println(ActivityList1.size());
		return ActivityList1;
	}

	public void addRecentActivity(RecentActivity recentActivityList) {
		// TODO Auto-generated method stub
		adminpagedaoimpl.addRecentActivity(recentActivityList);
	}

	public void deleteRecentActivity(int id) {
		// TODO Auto-generated method stub
		
		adminpagedaoimpl.deleteRecentActivity(id);
		
	}

	public RecentActivity getRecentActivityId(int id,
			RecentActivity recentActivity) {
		// TODO Auto-generated method stub
		RecentActivity activityEdit=adminpagedaoimpl.getRecentActivityById(id,recentActivity);
		
		return activityEdit;
	}

	public void convert(File file,String username) {
		// TODO Auto-generated method stub
			adminpagedaoimpl.convert(file,username);
		
	}

	public int updateRecentActivity(RecentActivity recentActivityList) {
		// TODO Auto-generated method stub
		
		int id=adminpagedaoimpl.updateRecentActivity(recentActivityList);
		
		return id;
		
	}
	
	
	public void createTable(String tableName, String query) {
		// TODO Auto-generated method stub
		adminpagedaoimpl.createTable(tableName,query);
	}  
	

}

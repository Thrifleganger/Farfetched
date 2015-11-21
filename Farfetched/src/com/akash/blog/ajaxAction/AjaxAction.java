/**
 * 
 */
package com.akash.blog.ajaxAction;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.akash.util.JDBCHelper;
import com.google.gson.Gson;

/**
 * @author nex53kf
 *
 */
public class AjaxAction {
	
	JDBCHelper jdbcHelper = new JDBCHelper();
	public static final String EMPTY = "";
	
	public Object execute() throws IOException, SQLException{
		
		System.out.println("Inside AjaxAction");
		
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		Map<String,Map<String,String>> consolidatedResult = new HashMap();
		
		String method = request.getQueryString();
		System.out.println("Query String: "+method);
		
		if(method.contains("populateBlogEntriesOnPageLoad")){
			consolidatedResult = populateBlogEntriesOnPageLoad();
		}
		
		String json = new Gson().toJson(consolidatedResult);
		
		System.out.println("ConsolidatedResult: "+json);
		
		response.setContentType("text/html");
		response.setHeader("cache-control", "no-cache");
		PrintWriter out = response.getWriter();
		out.write(json);
		return null; 
		
	}
	
	public Map<String,Map<String,String>> populateBlogEntriesOnPageLoad() throws SQLException{
		
		System.out.println("Inside populateBlogEntriesOnPageLoad");
		ResultSet resultSet = jdbcHelper.fetchBlogEntriesOnPageLoad();
		Map<String,Map<String,String>> consolidatedResult = new HashMap();
		
		String title = EMPTY;
		String description = EMPTY;
		String image = EMPTY;		
		Integer counter = 0;
		
		while(resultSet.next()){
			
			Map<String,String> individualResult = new HashMap();
			
			counter++;
			title = resultSet.getString("title");
			description = resultSet.getString("description");
			image = resultSet.getString("image_location");
			
			System.out.println("Title: "+title+", Description: "+description+", Image: "+image);
			
			individualResult.put("title", title);
			individualResult.put("description", description);
			individualResult.put("image", image);
			
			consolidatedResult.put("blog"+counter.toString(),individualResult);
			
		}
		
		return consolidatedResult;
	}

}

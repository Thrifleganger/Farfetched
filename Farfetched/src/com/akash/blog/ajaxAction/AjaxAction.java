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
		
		String queryString = request.getQueryString();
		String[] params = queryString.split("&");
		String[] keyVal;
		
		Map<String,String> paramMap = new HashMap();
		
		for(int i = 0; i < params.length; i++){
			
			keyVal = params[i].split("=");
			paramMap.put(keyVal[0], keyVal[1]);
			
		}
		
		System.out.println("Query String: "+queryString);
		
		if(paramMap.containsKey("method")){
			if(paramMap.get("method").toString().equals("populateBlogEntriesOnPageLoad")){
				consolidatedResult = populateBlogEntriesOnPageLoad();
			} else if(paramMap.get("method").toString().equals("fetchMoreBlogEntries")){
				consolidatedResult = fetchAdditionalResults(paramMap.get("globalCounter").toString(),paramMap.get("sortBy").toString());
			}
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
			
		Integer counter = 1;
		
		consolidatedResult = populateResponseMap(resultSet, counter);
		
		return consolidatedResult;
	}
	
	public Map<String,Map<String,String>> fetchAdditionalResults(String globalCounter, String sortBy) throws SQLException{
		
		System.out.println("Inside fetchAdditionalResults()");
		Map<String,Map<String,String>> consolidatedResult = new HashMap();
		ResultSet resultSet = null;
		int numberOfRows = 0;
		
		if(sortBy.equals("default")){
			System.out.println("Inside sortBy : default");
			resultSet = jdbcHelper.fetchAdditionalResultsByTime();
		} 
		
		if(resultSet.last()){
			numberOfRows = resultSet.getRow();
			resultSet.beforeFirst();
		}
		
		if(Integer.parseInt(globalCounter) > numberOfRows){
			consolidatedResult = null;
		} else{
			resultSet.absolute(Integer.parseInt(globalCounter)-1);
			consolidatedResult = populateResponseMap(resultSet, Integer.parseInt(globalCounter));
		}
		
		return consolidatedResult;
	}
	
	public Map<String,Map<String,String>> populateResponseMap(ResultSet resultSet, int counter) throws SQLException{
		
		String title = EMPTY;
		String description = EMPTY;
		String image = EMPTY;
		
		Map<String,Map<String,String>> consolidatedResult = new HashMap();
		
		while(resultSet.next()){
			
			Map<String,String> individualResult = new HashMap();
			
			title = resultSet.getString("title");
			description = resultSet.getString("description");
			image = resultSet.getString("image_location");
			
			System.out.println("Title: "+title+", Description: "+description+", Image: "+image);
			
			individualResult.put("title", title);
			individualResult.put("description", description);
			individualResult.put("image", image);
			
			consolidatedResult.put("blog"+counter,individualResult);
			
			counter++;
		}
		
		return consolidatedResult;
	}

}

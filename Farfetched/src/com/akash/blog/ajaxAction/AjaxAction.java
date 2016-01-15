/**
 * 
 */
package com.akash.blog.ajaxAction;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.akash.blog.BlogEntryBean;
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
		Map<String,Map<String,String>> consolidatedResult = new HashMap<String,Map<String,String>>();
		Map<String,String> individualResult = new HashMap<String,String>();
		
		String json = null;
		String queryString = request.getQueryString();
		String[] params = queryString.split("&");
		String[] keyVal;
		
		Map<String,String> paramMap = new HashMap<String,String>();
		
		for(int i = 0; i < params.length; i++){
			
			keyVal = params[i].split("=");
			paramMap.put(keyVal[0], keyVal[1]);
			
		}
		
		System.out.println("Query String: "+queryString);
		
		if(paramMap.containsKey("method")){
			if(paramMap.get("method").toString().equals("populateBlogEntriesOnPageLoad")){
				consolidatedResult = populateBlogEntriesOnPageLoad(paramMap.get("sortBy").toString(),paramMap.get("categoryFilter").toString());
				json = new Gson().toJson(consolidatedResult);
			} else if(paramMap.get("method").toString().equals("fetchMoreBlogEntries")){
				consolidatedResult = fetchAdditionalResults(paramMap.get("globalCounter").toString(),paramMap.get("sortBy").toString());
				json = new Gson().toJson(consolidatedResult);
			} else if(paramMap.get("method").toString().equals("updateFavCount")){
				int favCount = updateFavCount(Integer.parseInt(paramMap.get("blogId")),paramMap.get("operation").toString());
				json = new Gson().toJson(favCount);
			} else if(paramMap.get("method").toString().equals("fetchIndividualBlogEntry")){
				individualResult = fetchIndividualBlogEntry(Integer.parseInt(paramMap.get("blogId")));
				json = new Gson().toJson(individualResult);
			}				
		}
		
		System.out.println("ConsolidatedResult: "+json);
		
		response.setContentType("text/html");
		response.setHeader("cache-control", "no-cache");
		PrintWriter out = response.getWriter();
		out.write(json);
		return null; 
		
	}
	
	public Map<String,Map<String,String>> populateBlogEntriesOnPageLoad(String sortBy, String categoryFilter) throws SQLException{
		
		System.out.println("Inside populateBlogEntriesOnPageLoad");
		String sort = EMPTY;
		
		//Preprocess sortBy and filter
		if(sortBy.equalsIgnoreCase("Date")){
			sort = "DATE_CREATED";
		} else if(sortBy.equalsIgnoreCase("Popularity")){
			sort = "FAV_COUNT";
		}
		
		ResultSet resultSet = jdbcHelper.fetchBlogEntriesOnPageLoad(sort,categoryFilter.toLowerCase());
		Map<String,Map<String,String>> consolidatedResult = new HashMap<String,Map<String,String>>();
		Integer counter = 1;
		
		consolidatedResult = populateResponseMap(resultSet, counter);
		
		return consolidatedResult;
	}
	
	public Map<String,Map<String,String>> fetchAdditionalResults(String globalCounter, String sortBy) throws SQLException{
		
		System.out.println("Inside fetchAdditionalResults()");
		Map<String,Map<String,String>> consolidatedResult = new HashMap<String,Map<String,String>>();
		ResultSet resultSet = null;
		int numberOfRows = 0;
		
		if(sortBy.equals("default")){
			System.out.println("Inside sortBy : default");
			resultSet = jdbcHelper.fetchAdditionalResultsByTime(Integer.parseInt(globalCounter));
		} 
		
		if(resultSet == null){
			consolidatedResult = null;
		} else{
			consolidatedResult = populateResponseMap(resultSet, Integer.parseInt(globalCounter)+1);
		}
		
		return consolidatedResult;
	}
	
	public Map<String,Map<String,String>> populateResponseMap(ResultSet resultSet, int counter) throws SQLException{
		
		BlogEntryBean blog = new BlogEntryBean();
		
		Map<String,Map<String,String>> consolidatedResult = new HashMap<String,Map<String,String>>();
		
		while(resultSet.next()){
			
			Map<String,String> individualResult = new HashMap<String,String>();
			
			blog.setTitle(resultSet.getString("title"));
			blog.setDescription(resultSet.getString("description"));
			blog.setType(resultSet.getString("blog_type"));
			blog.setEventDate(resultSet.getDate("event_date"));
			blog.setTime(resultSet.getString("time"));
			blog.setVenue(resultSet.getString("venue"));
			blog.setCover(resultSet.getString("cover"));
			blog.setImageId(Integer.parseInt(resultSet.getString("image_link")));
			blog.setRsvp(resultSet.getString("rsvp"));
			blog.setFavCount(Integer.parseInt(resultSet.getString("fav_count")));
			blog.setBuyLink(resultSet.getString("buy_link"));
			blog.setReviewStars(Integer.parseInt(resultSet.getString("stars")));
			blog.setCurrentDate(resultSet.getTimestamp("date_created"));
			blog.setFacebook(resultSet.getString("facebook"));
			blog.setSoundcloud(resultSet.getString("soundcloud"));
			blog.setYoutube(resultSet.getString("youtube"));
			blog.setTwitter(resultSet.getString("twitter"));
			blog.setAuthor_name(resultSet.getString("author_name"));
			blog.setAuthor_email(resultSet.getString("author_email"));
			blog.setDisplay_checkbox(resultSet.getString("author_visibility"));
			blog.setVisibility(resultSet.getString("blog_visibility"));
			blog.setStatus(resultSet.getString("status"));
			if(resultSet.getString("consolidated_links").contains(",")){
				blog.setConsolidatedLinks(Arrays.asList(resultSet.getString("consolidated_links").split(",")));
				blog.setConsolidatedTypes(Arrays.asList(resultSet.getString("consolidated_types").split(",")));
			} else{
				blog.setConsolidatedLinks(Arrays.asList(resultSet.getString("consolidated_links")));
				blog.setConsolidatedLinks(Arrays.asList(resultSet.getString("consolidated_links")));
			}
			blog.setNumberOfLinks(blog.getConsolidatedLinks().size());
			
			individualResult.put("title", blog.getTitle());
			individualResult.put("description", blog.getDescription());
			individualResult.put("type", blog.getType());
			individualResult.put("description", blog.getDescription());
			individualResult.put("image", blog.getImageId().toString());
			individualResult.put("favCount", blog.getFavCount().toString());
			consolidatedResult.put("blog"+counter,individualResult);
			
			counter++;
		}
		
		return consolidatedResult;
	}
	
	public int updateFavCount(int blog_id, String operation){
		
		System.out.println("Inside updateFavCount");
		
		return jdbcHelper.updateFavCount(blog_id, operation);
	}
	
	public Map<String,String> fetchIndividualBlogEntry(int blog_id) throws NumberFormatException, SQLException{
		
		System.out.println("Inside fetchIndividualBlogEntry, blogID: "+blog_id);
		
		BlogEntryBean blog = new BlogEntryBean();
		Map<String,String> individualResult = new HashMap<String,String>();
		ResultSet resultSet = null;
		
		resultSet = jdbcHelper.fetchIndividualBlogEntry(blog_id);
		
		while(resultSet.next()){
			
			blog.setTitle(resultSet.getString("title"));
			blog.setDescription(resultSet.getString("description"));
			blog.setType(resultSet.getString("blog_type"));
			blog.setEventDate(resultSet.getDate("event_date"));
			blog.setTime(resultSet.getString("time"));
			blog.setVenue(resultSet.getString("venue"));
			blog.setCover(resultSet.getString("cover"));
			blog.setImageId(Integer.parseInt(resultSet.getString("image_link")));
			blog.setRsvp(resultSet.getString("rsvp"));
			blog.setFavCount(Integer.parseInt(resultSet.getString("fav_count")));
			blog.setBuyLink(resultSet.getString("buy_link"));
			blog.setReviewStars(Integer.parseInt(resultSet.getString("stars")));
			blog.setCurrentDate(resultSet.getTimestamp("date_created"));
			blog.setFacebook(resultSet.getString("facebook"));
			blog.setSoundcloud(resultSet.getString("soundcloud"));
			blog.setYoutube(resultSet.getString("youtube"));
			blog.setTwitter(resultSet.getString("twitter"));
			blog.setAuthor_name(resultSet.getString("author_name"));
			blog.setAuthor_email(resultSet.getString("author_email"));
			blog.setDisplay_checkbox(resultSet.getString("author_visibility"));
			blog.setVisibility(resultSet.getString("blog_visibility"));
			blog.setStatus(resultSet.getString("status"));
			if(resultSet.getString("consolidated_links").contains(",")){
				blog.setConsolidatedLinks(Arrays.asList(resultSet.getString("consolidated_links").split(",")));
				blog.setConsolidatedTypes(Arrays.asList(resultSet.getString("consolidated_types").split(",")));
			} else{
				blog.setConsolidatedLinks(Arrays.asList(resultSet.getString("consolidated_links")));
				blog.setConsolidatedLinks(Arrays.asList(resultSet.getString("consolidated_links")));
			}
			blog.setNumberOfLinks(blog.getConsolidatedLinks().size());
			
			individualResult.put("title", blog.getTitle());
			individualResult.put("description", blog.getDescription());
			individualResult.put("type", blog.getType());
			individualResult.put("description", blog.getDescription());
			individualResult.put("image", blog.getImageId().toString());
			individualResult.put("favCount", blog.getFavCount().toString());
		
		}
		return individualResult;
	}

}

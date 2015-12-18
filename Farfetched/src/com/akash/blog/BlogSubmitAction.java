/**
 * 
 */
package com.akash.blog;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Locale;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;


import com.akash.util.JDBCHelper;
import com.opensymphony.xwork2.ActionSupport;

/**
 * @author Thrifleganger
 *
 */
public class BlogSubmitAction extends ActionSupport implements ServletRequestAware{
	
	HttpServletRequest request = ServletActionContext.getRequest();
	ServletContext servletContext = ServletActionContext.getServletContext();
	
	BlogEntryBean blog = new BlogEntryBean();
	JDBCHelper jdbcHelper = new JDBCHelper();
	
	private String returnType = "success";
	private boolean isSaved = false;
	private int count = 0;
	 
	public String execute(){
		
		printBlogFormFieldValues();	
		
		if(blog.getImage() != null){
			if(blog.getImage().exists()){
				try {
					blog.setImageStream(new FileInputStream(blog.getImage()));
				} catch (FileNotFoundException e) {
					e.printStackTrace();
				}
				blog.setImageId(jdbcHelper.imageBaseIdEntry(blog));
				if(blog.getImageId() != -1){
					isSaved = saveImageOnFileSystem(blog.getImage());
					if(isSaved){
						jdbcHelper.imageBasePartialFill(blog);
					}
				}
			}
		}

		if(!blog.getAudio().isEmpty()){
			prepareAudioLinksForEntry();
		}
		if(!blog.getVideo().isEmpty()){
			prepareVideoLinksForEntry();
		}

		if(prepareBlogForEntry()){
			
			jdbcHelper.imageBaseCompleteFill(blog);
			
			for(Integer audioLinkID : blog.getAudioLinkId()){
				jdbcHelper.linkBaseCompleteFill(blog,audioLinkID);
			}
			for(Integer videoLinkID : blog.getVideoLinkId()){
				jdbcHelper.linkBaseCompleteFill(blog,videoLinkID);
			}
			
			System.out.println("Completed insertion of links to LINK_BASE");
		}
		
		return "success";
	}
	 
	@SuppressWarnings("deprecation")
	boolean saveImageOnFileSystem(File tempImageLoc){
		
		Integer imageId = blog.getImageId();
		String fileName = imageId.toString();
		String extension = blog.getImageFileName().substring(blog.getImageFileName().lastIndexOf(".")+1);
		blog.setImageType(extension); 	
		
		String destination = "";
		
		if(request.getRequestURL().toString().contains("localhost")){		
			destination = "C:\\images\\blog\\";
		}
		File destinationFile  = new File(destination, fileName+"."+extension);
   	 	try {
			FileUtils.copyFile(tempImageLoc, destinationFile);
			blog.setImageLocation(destinationFile.toString());
			blog.setImageSize(destinationFile.length());
			blog.setImageFileName(fileName+"."+extension);			
			
			isSaved = true;
			
		} catch (IOException e) {
			isSaved = false;
			e.printStackTrace();
			addActionError(e.getMessage());
			returnType = "input";
		}
   	 	
   	 	System.out.println("destination file path: "+destinationFile.toString());
   	 	System.out.println("Image size: "+blog.getImageSize());
   	 	
   	 	return isSaved;
	}
	
	boolean prepareAudioLinksForEntry(){
		String domain = "";
		boolean isSuccess = true;
		int link_id;
		for(String audioLink : blog.getAudio()){
			try {
				URI audioURL = new URI(audioLink);
				domain = audioURL.getHost();				
			} catch (URISyntaxException e) {
				e.printStackTrace();
			} catch (Exception e){
				e.printStackTrace();
			}
			
			link_id = jdbcHelper.linkBasePartialFill(audioLink, domain, "audio");
			System.out.println("New audio link added, link_id: "+link_id);
			if(link_id != -1){
				blog.getAudioLinkId().add(link_id);
				isSuccess = true;
			} else{
				isSuccess = false;
			}
		}
		return isSuccess;
	}
		
	boolean prepareVideoLinksForEntry(){
		String domain = "";
		boolean isSuccess = true;
		int link_id;
		for(String videoLink : blog.getVideo()){
			try {
				URI videoURL = new URI(videoLink);
				domain = videoURL.getHost();				
			} catch (URISyntaxException e) {
				e.printStackTrace();
			} catch (Exception e){
				e.printStackTrace();
			}
			
			link_id = jdbcHelper.linkBasePartialFill(videoLink, domain, "video");
			System.out.println("New video link added, link_id: "+link_id);
			if(link_id != -1){
				blog.getVideoLinkId().add(link_id);
				isSuccess = true;
			} else{
				isSuccess = false;
			}
		}
		return isSuccess;
	}
	
	boolean prepareBlogForEntry(){
		
		boolean isSuccess = false;
		
		java.util.Date currentJavaDate = new java.util.Date();
		java.sql.Timestamp currentSQLDate = new java.sql.Timestamp(currentJavaDate.getTime());	
		System.out.println("JavaDate: "+currentJavaDate+" SQLDate: "+currentSQLDate);
		blog.setCurrentDate(currentSQLDate);			
		
		try {
			if(blog.getEvent_date() != null && !blog.getEvent_date().equals("")){
				DateFormat format = new SimpleDateFormat("yyyy-MM-dd", Locale.ENGLISH);
				java.util.Date eventDate;
				eventDate = format.parse(blog.getEvent_date());
				System.out.println("Event date: "+eventDate); 
				blog.setEventDate(new java.sql.Date(eventDate.getTime()));
			}
		} catch (ParseException e) {
			e.printStackTrace();
		}
				
		int blog_id = jdbcHelper.blogBaseCompleteFill(blog);
		
		if(blog_id != -1){
			blog.setBlogId(blog_id);
			isSuccess = true;
		} else{
			isSuccess = false;
		}
		
		return isSuccess;
	}
	
	
	void printBlogFormFieldValues(){
		
		try{
			System.out.println("Values passed: ");
			System.out.println("Type: "+blog.getType());
			System.out.println("Title: "+blog.getTitle());
			System.out.println("Description: "+blog.getDescription());
			System.out.println("Date: "+blog.getEvent_date());
			System.out.println("Time: "+blog.getTime());
			System.out.println("Venue: "+blog.getVenue());
			System.out.println("RSVP: "+blog.getRsvp());
			System.out.println("Video Link: "+blog.getVideo().toString());
			System.out.println("Audio Link: "+blog.getAudio().toString());
			if(blog.getImage() != null){
				System.out.println("image: "+blog.getImage().toString());
			}
			System.out.println("Facebook: "+blog.getFacebook());
			System.out.println("Soundcloud: "+blog.getSoundcloud());
			System.out.println("Youtube: "+blog.getYoutube());
			System.out.println("Twitter: "+blog.getTwitter());
			System.out.println("Display checkbox: "+blog.getDisplay_checkbox());
			System.out.println("Author name: "+blog.getAuthor_name());
			System.out.println("Author email: "+blog.getAuthor_email());
		} catch(Exception e){
			e.printStackTrace();
		}
	}

	public BlogEntryBean getBlog() {
		return blog;
	}

	public void setBlog(BlogEntryBean blog) {
		this.blog = blog;
	}

	@Override
	public void setServletRequest(HttpServletRequest arg0) {
		// TODO Auto-generated method stub
		
	}

}

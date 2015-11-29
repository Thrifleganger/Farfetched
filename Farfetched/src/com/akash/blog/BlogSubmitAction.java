/**
 * 
 */
package com.akash.blog;

import java.io.File;
import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;

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
	
	BlogEntryBean blog = new BlogEntryBean();
	JDBCHelper jdbcHelper = new JDBCHelper();
	
	private String returnType = "success";
	private boolean isSaved = false;
	private int count = 0;
	 
	public String execute(){
		
		printBlogFormFieldValues();	
		
		isSaved = saveImageOnFileSystem(blog.getImage());
		
		if(isSaved){
			count = jdbcHelper.imageBasePartialFill(blog);
			if(count == 1){
				prepareLinksForEntry();
				System.out.println(blog.getAudioLinkId().toString());
				
			}
		}
			
		
		return "success";
	}
	
	boolean saveImageOnFileSystem(File tempImageLoc){
		
		Integer imageId = jdbcHelper.getMaxImageIdFromImageBase()+1;
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
   	 	System.out.println("Image si)ze: "+blog.getImageSize());
   	 	
   	 	return isSaved;
	}
	
	void prepareLinksForEntry(){
		String domain = "";
		int link_id;
		for(String audioLink : blog.getAudio()){
			try {
				URI audioURL = new URI(audioLink);
				String domainFull = audioURL.getHost();
				if(domainFull.startsWith("www.")){
					domain = domainFull.substring(4,domainFull.indexOf("."));							
				} else{
					domain = domainFull.substring(0,domainFull.indexOf("."));
				}
			} catch (URISyntaxException e) {
				e.printStackTrace();
			}
			
			link_id = jdbcHelper.linkBasePartialFill(audioLink, domain, "audio");
			System.out.println("New audio link added, link_id: "+link_id);
			if(link_id != -1){
				blog.getAudioLinkId().add(link_id);
			}
		}
	}
	
	
	void printBlogFormFieldValues(){
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
		System.out.println("image: "+blog.getImage().toString());
		System.out.println("Facebook: "+blog.getFacebook());
		System.out.println("Soundcloud: "+blog.getSoundcloud());
		System.out.println("Youtube: "+blog.getYoutube());
		System.out.println("Twitter: "+blog.getTwitter());
		System.out.println("Display checkbox: "+blog.getDisplay_checkbox());
		System.out.println("Author name: "+blog.getAuthor_name());
		System.out.println("Author email: "+blog.getAuthor_email());
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

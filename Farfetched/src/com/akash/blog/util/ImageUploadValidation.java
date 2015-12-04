/**
 * 
 */
package com.akash.blog.util;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.google.gson.Gson;

/**
 * @author NEX53KF
 *
 */
public class ImageUploadValidation {
	
	private File fileUpload;
	private String fileUploadFileName;
	private String fileUploadContentType;
	
	public void execute() throws IOException{
		
		HttpServletResponse response = ServletActionContext.getResponse();
		String isValid = "true";
		
		File uploadedFile = getFileUpload();
		Long size = uploadedFile.length(); 		
		String mimeType = getFileUploadContentType();
		System.out.println("File Upload AJAX: Size - " +size+ " Mime Type - "+mimeType);
		
		if(size > 2000000){
			isValid = "size";
		}
		if(!mimeType.contains("image")){
			isValid = "type";
		}
		
		Map<String,String> responseMap = new HashMap<String,String>();
		
		String json = new Gson().toJson(isValid);
		
		System.out.println("ConsolidatedResult: "+json);
		
		response.setContentType("text/html");
		response.setHeader("cache-control", "no-cache");
		PrintWriter out = response.getWriter();
		out.write(json);
	}

	public File getFileUpload() {
		return fileUpload;
	}

	public void setFileUpload(File fileUpload) {
		this.fileUpload = fileUpload;
	}

	public String getFileUploadFileName() {
		return fileUploadFileName;
	}

	public void setFileUploadFileName(String fileUploadFileName) {
		this.fileUploadFileName = fileUploadFileName;
	}

	public String getFileUploadContentType() {
		return fileUploadContentType;
	}

	public void setFileUploadContentType(String fileUploadContentType) {
		this.fileUploadContentType = fileUploadContentType;
	}

}

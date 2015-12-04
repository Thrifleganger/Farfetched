/**
 * 
 */
package com.akash.blog.util;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.akash.util.JDBCHelper;

/**
 * @author NEX53KF
 *
 */
public class RetrieveImageStream {

	private int imageId;
	
	public void execute() throws IOException{
		
		System.out.println("Inside RetrieveImageStream, imageID: "+getImageId());
		
		HttpServletResponse response = ServletActionContext.getResponse();
		JDBCHelper jdbcHelper = new JDBCHelper();
		byte[] imageByteStream = null;
		
		imageByteStream = jdbcHelper.retrieveImageStream(getImageId());
		
		if(imageByteStream != null){
			 /*response.setContentType(getServletContext().getMimeType(imageName));*/
             response.setContentLength(imageByteStream.length);
             response.getOutputStream().write(imageByteStream);
		}
		
	}

	
	private Object getServletContext() {
		// TODO Auto-generated method stub
		return null;
	}


	public int getImageId() {
		return imageId;
	}

	public void setImageId(int imageId) {
		this.imageId = imageId;
	}
	
}

/**
 * 
 */
package com.akash.download;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.Action;
/**
 * @author Thrifleganger
 *
 */
public class DownloadAction implements Action {

	private InputStream fileInputStream;
    private String fileName;
    private String downloadId;
    
    public InputStream getFileInputStream() 
    {
            return fileInputStream;
    }

    public String execute() throws Exception 
    {
    	HttpServletRequest request = ServletActionContext.getRequest();
    	System.out.println("DownloadId = "+downloadId);
    	File fileToDownload = null;
    	System.out.println(request.getRequestURL().toString().contains("localhost"));
    	if(request.getRequestURL().toString().contains("localhost")){
			if(downloadId.equals("1")){
				fileToDownload = new File("F:\\Farfetch'd Press Kit\\Farfetchd-Presskit-Document.pdf");
				System.out.println("Inside file to download, "+fileToDownload+"  "+fileToDownload.getName() );
			} else if(downloadId.equals("2")){
				fileToDownload = new File("F:\\Farfetch'd Press Kit\\Farfetchd-Presskit-Document.pdf");
			} else if(downloadId.equals("3")){
				fileToDownload = new File("F:\\Farfetch'd Press Kit\\Farfetchd-Presskit-Document.pdf");
			} else if(downloadId.equals("4")){
				fileToDownload = new File("F:\\Farfetch'd Press Kit\\Farfetchd-Presskit-Document.pdf");
			}
		}else{
			if(downloadId.equals("1")){
				fileToDownload = new File("/media/Farfetchd_Presskit_Document.pdf");
			} else if(downloadId.equals("2")){
				fileToDownload = new File("/media/Farfetchd_Images.zip");
			} else if(downloadId.equals("3")){
				fileToDownload = new File("/media/Farfetchd_Tech_Rider.pdf");
			} else if(downloadId.equals("4")){
				fileToDownload = new File("/media/Farfetchd_The_Alchemist.zip");
			}	
		}  
    	if(fileToDownload!=null){
    		fileName = fileToDownload.getName();
    		fileInputStream = new FileInputStream(fileToDownload);
    	}
        return SUCCESS;
    }

    public String getFileName() 
    {
            return fileName;
    }

    public void setFileName(String fileName) 
    {
            this.fileName = fileName;
    }

	public String getDownloadId() {
		return downloadId;
	}

	public void setDownloadId(String downloadId) {
		this.downloadId = downloadId;
	}       
	
}

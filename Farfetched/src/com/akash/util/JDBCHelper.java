/**
 * 
 */
package com.akash.util;

import java.sql.*;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.akash.blog.BlogEntryBean;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;

/**
 * @author Thrifleganger
 *
 */
public class JDBCHelper {
	
	private final String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
	private String DB_URL = null;	
	private String USER = null;
	private String PASS = "tuffy6543";
	private Connection connection = null;
	private PreparedStatement pStatement = null;
	private Statement statement = null;
	private ResultSet result = null;
	
	BlogEntryBean blog = new BlogEntryBean();
	
	
	public JDBCHelper(){
		
		HttpServletRequest request = ServletActionContext.getRequest();
		
		if(request.getServerName().contains("localhost")){
			DB_URL = "jdbc:mysql://localhost/farfetchd";
			USER = "thrifleganger";
			PASS = "tuffy6543";
		}
		else{
			DB_URL = "jdbc:mysql://ec2-54-169-64-147.ap-southeast-1.compute.amazonaws.com/farfetchd";
			USER = "root";
			PASS = "tuffy6543";
		}
		
		System.out.println("Request URI"+request.getRequestURI());
		System.out.println("Request URL"+request.getRequestURL());
		System.out.println("ServerName"+request.getServerName());
		System.out.println("ServerPort"+request.getServerPort());
		System.out.println("Remote host"+request.getRemoteHost()+" "+request.getRemoteAddr()+" "+request.getRemoteUser());	
		try{
			System.out.println("Registering JDBC driver");
			Class.forName(JDBC_DRIVER);
			
			System.out.println("Connecting to database");
			connection = (Connection) DriverManager.getConnection(DB_URL,USER,PASS);
		}catch(SQLException se){
		      se.printStackTrace();
		}catch(Exception e){
		      e.printStackTrace();
		}
	}
	
	public Connection getConnection(){
		
		try{
			System.out.println("Registering JDBC driver");
			Class.forName(JDBC_DRIVER);
			
			System.out.println("Connecting to database");
			connection = (Connection) DriverManager.getConnection(DB_URL,USER,PASS);
		}catch(SQLException se){
		      se.printStackTrace();
		}catch(Exception e){
		      e.printStackTrace();
		}
		return connection;
	}
	
	public ResultSet selectQuery(String query) throws SQLException{
		try{
			statement = (Statement) connection.createStatement();
			result = statement.executeQuery(query);

		}catch(SQLException se){
		      //Handle errors for JDBC
		      se.printStackTrace();
		}catch(Exception e){
		      //Handle errors for Class.forName
		      e.printStackTrace();
		}
		return result;
	}
	
	public boolean emailSubscriptionUserExists(String email){
		
		boolean returnFlag = false;
		try{
			statement = (Statement) connection.createStatement();
			String query = "SELECT COUNT(*) FROM EMAILSUBSCRIPTION WHERE EMAILID='"+email+"'";
			result = statement.executeQuery(query);
			result.next();
			
			int numberOfRecords = result.getInt(1);
			System.out.println("Number of records: "+numberOfRecords);
			
			if(numberOfRecords == 0){
				returnFlag = false;
			}
			else{
				returnFlag = true;
			}

		}catch(SQLException se){
		      //Handle errors for JDBC
		      se.printStackTrace();
		}catch(Exception e){
		      //Handle errors for Class.forName
		      e.printStackTrace();
		}
		return returnFlag;
	}
	
	public int getMaxUserIdFromEmailScubscription(){
		
		int maxNumber = 0;
		try{
			statement = (Statement) connection.createStatement();
			String query = "SELECT MAX(USERID) FROM EMAILSUBSCRIPTION";
			result = statement.executeQuery(query);
			result.next();
			
			maxNumber = result.getInt(1);
			System.out.println("Maximum userID: "+maxNumber);

		}catch(SQLException se){
		      //Handle errors for JDBC
		      se.printStackTrace();
		}catch(Exception e){
		      //Handle errors for Class.forName
		      e.printStackTrace();
		}
		return maxNumber;
	}
	
	public int insertEmailId(int userId, String email){
		
		int affectedRows = 0;
		try{
			statement = (Statement) connection.createStatement();
			String query = "INSERT INTO EMAILSUBSCRIPTION VALUES("+userId+",'"+email+"','Y')";
			affectedRows = statement.executeUpdate(query);
			System.out.println("Inserted email ID: "+email+", rows affected: "+affectedRows);

		}catch(SQLException se){
		      //Handle errors for JDBC
		      se.printStackTrace();
		}catch(Exception e){
		      //Handle errors for Class.forName
		      e.printStackTrace();
		}
		return affectedRows;
	}
	
	public boolean isUnsubscribed(String email){
		
		boolean isUnsubscribed = false;
		try{
			statement = (Statement) connection.createStatement();
			String query = "SELECT SUBSTATUS FROM EMAILSUBSCRIPTION WHERE EMAILID='"+email+"'";
			result = statement.executeQuery(query);
			result.next();
			
			String status = result.getString(1);
			System.out.println("Subscription status: "+status);
			
			if(status.equalsIgnoreCase("N")){
				isUnsubscribed = true;
			}
			else{
				isUnsubscribed = false;
			}

		}catch(SQLException se){
		      //Handle errors for JDBC
		      se.printStackTrace();
		}catch(Exception e){
		      //Handle errors for Class.forName
		      e.printStackTrace();
		}
		
		return isUnsubscribed;
	}
	
	public int changeSubscriptionStatus(String email){
		
		int affectedRows = 0;
		try{
			statement = (Statement) connection.createStatement();
			String query = "UPDATE EMAILSUBSCRIPTION SET SUBSTATUS='Y' WHERE EMAILID='"+email+"'";
			affectedRows = statement.executeUpdate(query);
			System.out.println("Changed subscription status, rows affected: "+affectedRows);

		}catch(SQLException se){
		      //Handle errors for JDBC
		      se.printStackTrace();
		}catch(Exception e){
		      //Handle errors for Class.forName
		      e.printStackTrace();
		}
		
		return affectedRows;
	}
	
	public int changeEmailSubscriptionStatusToNil(String emailId){
		int affectedRows = 0;
		try{
			statement = (Statement) connection.createStatement();
			String query = "UPDATE EMAILSUBSCRIPTION SET SUBSTATUS='N' WHERE EMAILID='"+emailId+"'";
			affectedRows = statement.executeUpdate(query);
			System.out.println("Changed subscription status to N, rows affected: "+affectedRows);

		}catch(SQLException se){
		      //Handle errors for JDBC
		      se.printStackTrace();
		}catch(Exception e){
		      //Handle errors for Class.forName
		      e.printStackTrace();
		}
		
		return affectedRows;
	}
	
	public int getMaxOrderIdFromProductByNow(){
		
		int maxNumber = 0;
		try{
			statement = (Statement) connection.createStatement();
			String query = "SELECT MAX(ORDERID) FROM PRODUCTBUYNOW";
			result = statement.executeQuery(query);
			result.next();
			
			maxNumber = result.getInt(1);
			System.out.println("Maximum userID: "+maxNumber);

		}catch(SQLException se){
		      //Handle errors for JDBC
		      se.printStackTrace();
		}catch(Exception e){
		      //Handle errors for Class.forName
		      e.printStackTrace();
		}
		return maxNumber;
	}
	
	public int placeOrder(int orderId, int productId, String productName, int quantity, int unitPrice,
			int totalPrice,	String fname, String lname, String email, String contact, String street, 
			String locality, String city, String state, String pincode, String paymentConfirm, String isShipped,
			String orderStatus, String currentTime){
		
		int affectedRows = 0;
		try{
			statement = (Statement) connection.createStatement();
			String query = "INSERT INTO PRODUCTBUYNOW VALUES("+orderId+","+productId+",'"+productName+"',"+quantity+"," +
					""+unitPrice+","+totalPrice+",'"+fname+"','"+lname+"','"+email+"','"+contact+"','"+street+"','"+locality+"'," +
							"'"+city+"','"+state+"','"+pincode+"','"+paymentConfirm+"','"+isShipped+"'," +
									"'"+orderStatus+"','"+currentTime+"','','')";
			
			System.out.println("Query: "+query);
			affectedRows = statement.executeUpdate(query);
			System.out.println("Inserted email ID: "+email+", rows affected: "+affectedRows);

		}catch(SQLException se){
		      //Handle errors for JDBC
		      se.printStackTrace();
		}catch(Exception e){
		      //Handle errors for Class.forName
		      e.printStackTrace();
		}
		return affectedRows;
		
		
	}
	
	
	public int changeOrderStatusToCancelled(String orderId){
		int affectedRows = 0;
		try{
			statement = (Statement) connection.createStatement();
			String query = "UPDATE PRODUCTBUYNOW SET ORDERSTATUS='C' WHERE ORDERID="+Integer.parseInt(orderId);
			affectedRows = statement.executeUpdate(query);
			System.out.println("Changed order status to C, rows affected: "+affectedRows);

		}catch(SQLException se){
		      //Handle errors for JDBC
		      se.printStackTrace();
		}catch(Exception e){
		      //Handle errors for Class.forName
		      e.printStackTrace();
		}
		
		return affectedRows;
	}
	
	public int insertContactDetails(String name, String email, String number, String description, String currentTime){
		
		int affectedRows = 0;
		try{
			statement = (Statement) connection.createStatement();
			String query = "INSERT INTO CONTACTUS VALUES('"+name+"','"+email+"','"+number+"','"+description+"','"+currentTime+"')";
			
			System.out.println("Query: "+query);
			affectedRows = statement.executeUpdate(query);
			System.out.println("Inserted contact details of: "+email+", rows affected: "+affectedRows);

		}catch(SQLException se){
		      //Handle errors for JDBC
		      se.printStackTrace();
		}catch(Exception e){
		      //Handle errors for Class.forName
		      e.printStackTrace();
		}
		return affectedRows;
	}
	
	
	public int insertBookingDetails(String name, String email, String number, String description, String currentTime){
		
		int affectedRows = 0;
		try{
			statement = (Statement) connection.createStatement();
			String query = "INSERT INTO BOOKUS VALUES('"+name+"','"+email+"','"+number+"','"+description+"','"+currentTime+"')";
			
			System.out.println("Query: "+query);
			affectedRows = statement.executeUpdate(query);
			System.out.println("Inserted contact details of: "+email+", rows affected: "+affectedRows);

		}catch(SQLException se){
		      //Handle errors for JDBC
		      se.printStackTrace();
		}catch(Exception e){
		      //Handle errors for Class.forName
		      e.printStackTrace();
		}
		return affectedRows;
	}
	
	public ResultSet fetchBlogEntriesOnPageLoad(){
		
		ResultSet resultSet = null;
		try{
			statement = (Statement) connection.createStatement();
			String query = "SELECT *, GROUP_CONCAT(T.LINK) AS CONSOLIDATED_LINKS, GROUP_CONCAT(T.TYPE) AS CONSOLIDATED_TYPES FROM (SELECT DISTINCT BLOG_BASE.BLOG_ID, BLOG_BASE.TITLE, BLOG_BASE.DESCRIPTION, BLOG_BASE.TYPE AS BLOG_TYPE, BLOG_BASE.EVENT_DATE, BLOG_BASE.TIME, BLOG_BASE.VENUE, BLOG_BASE.COVER, BLOG_BASE.IMAGE_LINK, BLOG_BASE.RSVP, BLOG_BASE.FAV_COUNT, BLOG_BASE.BUY_LINK, BLOG_BASE.STARS, BLOG_BASE.DATE_CREATED, BLOG_BASE.FACEBOOK, BLOG_BASE.SOUNDCLOUD, BLOG_BASE.YOUTUBE, BLOG_BASE.TWITTER, BLOG_BASE.AUTHOR_NAME, BLOG_BASE.AUTHOR_EMAIL, BLOG_BASE.AUTHOR_VISIBILITY, BLOG_BASE.BLOG_VISIBILITY, BLOG_BASE.STATUS, LINK_BASE.LINK, LINK_BASE.TYPE FROM BLOG_BASE,LINK_BASE WHERE BLOG_BASE.BLOG_ID = LINK_BASE.BLOG_ID) AS T GROUP BY T.BLOG_ID ORDER BY DATE_CREATED DESC LIMIT 5;";
			resultSet = selectQuery(query);

		}catch(SQLException se){
		      //Handle errors for JDBC
		      se.printStackTrace();
		}catch(Exception e){
		      //Handle errors for Class.forName
		      e.printStackTrace();
		}
		return resultSet;
	}
	
	public ResultSet fetchAdditionalResultsByTime(Integer globalCounter){
		
		System.out.println("GlobalCounter: "+globalCounter);
		ResultSet resultSet = null;
		try{
			pStatement = connection.prepareStatement("SELECT *, GROUP_CONCAT(T.LINK) AS CONSOLIDATED_LINKS, GROUP_CONCAT(T.TYPE) AS CONSOLIDATED_TYPES FROM (SELECT DISTINCT BLOG_BASE.BLOG_ID, BLOG_BASE.TITLE, BLOG_BASE.DESCRIPTION, BLOG_BASE.TYPE AS BLOG_TYPE, BLOG_BASE.EVENT_DATE, BLOG_BASE.TIME, BLOG_BASE.VENUE, BLOG_BASE.COVER, BLOG_BASE.IMAGE_LINK, BLOG_BASE.RSVP, BLOG_BASE.FAV_COUNT, BLOG_BASE.BUY_LINK, BLOG_BASE.STARS, BLOG_BASE.DATE_CREATED, BLOG_BASE.FACEBOOK, BLOG_BASE.SOUNDCLOUD, BLOG_BASE.YOUTUBE, BLOG_BASE.TWITTER, BLOG_BASE.AUTHOR_NAME, BLOG_BASE.AUTHOR_EMAIL, BLOG_BASE.AUTHOR_VISIBILITY, BLOG_BASE.BLOG_VISIBILITY, BLOG_BASE.STATUS, LINK_BASE.LINK, LINK_BASE.TYPE FROM BLOG_BASE,LINK_BASE WHERE BLOG_BASE.BLOG_ID = LINK_BASE.BLOG_ID) AS T GROUP BY T.BLOG_ID ORDER BY DATE_CREATED DESC LIMIT ?,?;");
			pStatement.setInt(1, globalCounter);
			pStatement.setInt(2, globalCounter+5);
			
			resultSet = pStatement.executeQuery();

		}catch(SQLException se){
		      //Handle errors for JDBC
		      se.printStackTrace();
		}catch(Exception e){
		      //Handle errors for Class.forName
		      e.printStackTrace();
		}
		
		return resultSet; 
	}
	
	public int getMaxImageIdFromImageBase(){
		
		int maxNumber = 0;
		try{
			statement = (Statement) connection.createStatement();
			String query = "SELECT MAX(IMAGE_ID) FROM IMAGE_BASE";
			result = statement.executeQuery(query);
			result.next();
			
			maxNumber = result.getInt(1);
			System.out.println("Maximum imageID: "+maxNumber);

		}catch(SQLException se){
		      //Handle errors for JDBC
		      se.printStackTrace();
		}catch(Exception e){
		      //Handle errors for Class.forName
		      e.printStackTrace();
		}
		return maxNumber;
	}
	
	public int imageBaseIdEntry(BlogEntryBean blog){
		int affectedRows = 0;
		int imageId = -1;
		try{
			pStatement = connection.prepareStatement("INSERT INTO IMAGE_BASE(IMAGE) VALUES(?)");
			pStatement.setBinaryStream(1, blog.getImageStream());
			
			affectedRows = pStatement.executeUpdate();
			System.out.println("Inserted partial entry to IMAGE_BASE, rows affected: "+affectedRows);
			
			if(affectedRows == 1){
				result = selectQuery("SELECT MAX(IMAGE_ID) FROM IMAGE_BASE");
				result.next();
				imageId = result.getInt(1);
			} 			

		}catch(SQLException se){
		      //Handle errors for JDBC
		      se.printStackTrace();
		}catch(Exception e){
		      //Handle errors for Class.forName
		      e.printStackTrace();
		}
		return imageId;
	}
	
	public int imageBasePartialFill(BlogEntryBean blog){

		int affectedRows = 0;
		try{
			pStatement = connection.prepareStatement("UPDATE IMAGE_BASE SET IMAGE_LOCATION = ?,IMAGE_TYPE = ?,FILENAME = ?,IMAGE_SIZE = ? WHERE IMAGE_ID = ?");
			pStatement.setString(1, blog.getImageLocation());
			pStatement.setString(2, blog.getImageType());
			pStatement.setString(3, blog.getImageFileName());
			pStatement.setLong(4, blog.getImageSize());
			pStatement.setInt(5, blog.getImageId());
			
			affectedRows = pStatement.executeUpdate();
			System.out.println("Inserted partial entry to IMAGE_BASE, rows affected: "+affectedRows);

		}catch(SQLException se){
		      //Handle errors for JDBC
		      se.printStackTrace();
		}catch(Exception e){
		      //Handle errors for Class.forName
		      e.printStackTrace();
		}
		return affectedRows;
		
	}
	
	public int linkBasePartialFill(String link, String domain, String type){

		int affectedRows = 0;
		ResultSet resultSet = null;
		try{
			pStatement = connection.prepareStatement("INSERT INTO LINK_BASE(LINK,DOMAIN,TYPE) VALUES(?,?,?)");
			pStatement.setString(1, link);
			pStatement.setString(2, domain);
			pStatement.setString(3, type);
			
			affectedRows = pStatement.executeUpdate();
			System.out.println("Inserted partial entry to LINK_BASE, rows affected: "+affectedRows);
			if(affectedRows == 1){
				resultSet = selectQuery("SELECT MAX(LINK_ID) FROM LINK_BASE");
				resultSet.next();
				return resultSet.getInt(1);
			} else{
				affectedRows = -1;
			}
			

		}catch(SQLException se){
		      //Handle errors for JDBC
		      se.printStackTrace();
		      affectedRows = -1;
		}catch(Exception e){
		      //Handle errors for Class.forName
		      e.printStackTrace();
		      affectedRows = -1;
		}
		return affectedRows;
		
	}
	
	public int blogBaseCompleteFill(BlogEntryBean blog){
		
		int affectedRows = 0;
		int maxNumber = 0;
		try{
			pStatement = connection.prepareStatement("INSERT INTO BLOG_BASE(TITLE, DESCRIPTION, TYPE, EVENT_DATE, VENUE, " +
					"TIME, COVER, VIDEO_LINK, AUDIO_LINK, IMAGE_LINK," +
					" RSVP, FAV_COUNT, BUY_LINK, STARS, DATE_CREATED," +
					"DATE_APPROVED, FACEBOOK, SOUNDCLOUD, YOUTUBE, TWITTER, " +
					"AUTHOR_NAME, AUTHOR_EMAIL, AUTHOR_VISIBILITY,BLOG_VISIBILITY, STATUS) " +
					"VALUES(?,?,?,?,?," +
					"?,?,?,?,?," +
					"?,?,?,?,?," +
					"?,?,?,?,?," +
					"?,?,?,?,?)");
			
			pStatement.setString(1, blog.getTitle());
			pStatement.setString(2, blog.getDescription());
			pStatement.setString(3, blog.getType());
			pStatement.setDate(4, blog.getEventDate());
			pStatement.setString(5, blog.getVenue());
			
			pStatement.setString(6, blog.getTime());
			pStatement.setString(7, blog.getCover());
			pStatement.setString(8, blog.getVideoLinkId().toString().replace("[", "").replace("]", ""));
			pStatement.setString(9, blog.getAudioLinkId().toString().replace("[", "").replace("]", ""));
			pStatement.setInt(10, blog.getImageId());

			pStatement.setString(11, blog.getRsvp());
			pStatement.setInt(12, blog.getFavCount());
			pStatement.setString(13, blog.getBuyLink());
			pStatement.setInt(14, blog.getReviewStars());
			pStatement.setTimestamp(15, blog.getCurrentDate());
			
			pStatement.setTimestamp(16, blog.getApprovedDate());
			pStatement.setString(17, blog.getFacebook());
			pStatement.setString(18, blog.getSoundcloud());
			pStatement.setString(19, blog.getYoutube());
			pStatement.setString(20, blog.getTwitter());
			
			pStatement.setString(21, blog.getAuthor_name());
			pStatement.setString(22, blog.getAuthor_email());
			pStatement.setString(23, blog.getDisplay_checkbox());
			pStatement.setString(24, blog.getVisibility());
			pStatement.setString(25, blog.getStatus());			
						
			affectedRows = pStatement.executeUpdate();
			System.out.println("Inserted blog entry to BLOG_BASE, rows affected: "+affectedRows);
			if(affectedRows == 1){
				result = selectQuery("SELECT MAX(BLOG_ID) FROM BLOG_BASE");
				result.next();
				maxNumber = result.getInt(1);
				System.out.println("Blog ID: "+maxNumber);
				
			} else{
				maxNumber = -1;
			}
			

		}catch(SQLException se){
		      //Handle errors for JDBC
		      se.printStackTrace();
		      affectedRows = -1;
		}catch(Exception e){
		      //Handle errors for Class.forName
		      e.printStackTrace();
		      affectedRows = -1;
		}
		
		return maxNumber;
		
	}
	
	public int imageBaseCompleteFill(BlogEntryBean blog){
		
		int affectedRows = 0;
		try{
			pStatement = connection.prepareStatement("UPDATE IMAGE_BASE SET BLOG_ID = ? WHERE IMAGE_ID = ?");
			pStatement.setInt(1, blog.getBlogId());
			pStatement.setInt(2, blog.getImageId());
			
			affectedRows = pStatement.executeUpdate();
			System.out.println("Complete insert into IMAGE_BASE, rows affected: "+affectedRows);

		}catch(SQLException se){
		      //Handle errors for JDBC
		      se.printStackTrace();
		}catch(Exception e){
		      //Handle errors for Class.forName
		      e.printStackTrace();
		}
		return affectedRows;
	}
	
	public int linkBaseCompleteFill(BlogEntryBean blog, Integer linkId){
		
		int affectedRows = 0;
		try{
			pStatement = connection.prepareStatement("UPDATE LINK_BASE SET BLOG_ID = ? WHERE LINK_ID = ?");
			pStatement.setInt(1, blog.getBlogId());
			pStatement.setInt(2, linkId);
			
			affectedRows = pStatement.executeUpdate();

		}catch(SQLException se){
		      //Handle errors for JDBC
		      se.printStackTrace();
		}catch(Exception e){
		      //Handle errors for Class.forName
		      e.printStackTrace();
		}
		return affectedRows;
	}
	
	public byte[] retrieveImageStream(int imageId){
		
		byte[] image = null;
		
		try{
			statement = (Statement) connection.createStatement();
			String query = "SELECT IMAGE FROM IMAGE_BASE WHERE IMAGE_ID="+imageId;
			result = statement.executeQuery(query);
			result.next();
			
			image = result.getBytes(1);

		}catch(SQLException se){
		      //Handle errors for JDBC
		      se.printStackTrace();
		}catch(Exception e){
		      //Handle errors for Class.forName
		      e.printStackTrace();
		}
		
		return image;
	}
	
	public int updateFavCount(int blog_id, String operation){
		int affectedRows = 0;
		int favCount = 0;
		try{
			if(operation.equals("add")){
				pStatement = connection.prepareStatement("UPDATE BLOG_BASE SET FAV_COUNT = FAV_COUNT + 1 WHERE BLOG_ID = ?");
				pStatement.setInt(1, blog_id);
			} else if(operation.equals("sub")){
				pStatement = connection.prepareStatement("UPDATE BLOG_BASE SET FAV_COUNT = FAV_COUNT - 1 WHERE BLOG_ID = ?");
				pStatement.setInt(1, blog_id);
			}
			
			affectedRows = pStatement.executeUpdate();
			
			pStatement = connection.prepareStatement("SELECT FAV_COUNT FROM BLOG_BASE WHERE BLOG_ID = ?");
			pStatement.setInt(1, blog_id);
			
			result = pStatement.executeQuery();
			if(result.next()){
				favCount = result.getInt(1);
			}
			System.out.println("Update favCount on "+blog_id+", operation: "+operation);

		}catch(SQLException se){
		      //Handle errors for JDBC
		      se.printStackTrace();
		}catch(Exception e){
		      //Handle errors for Class.forName
		      e.printStackTrace();
		}
		return favCount;
	}
	
}

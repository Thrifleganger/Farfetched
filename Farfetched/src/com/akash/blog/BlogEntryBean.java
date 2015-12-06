package com.akash.blog;

import java.io.File;
import java.io.FileInputStream;
import java.util.ArrayList;
import java.util.List;

public class BlogEntryBean {
	
	private String type;
	private String title;
	private String description;
	private String event_date;
	private java.sql.Date eventDate;
	private String time;
	private String venue;
	private String cover;
	private String rsvp;
	private List<String> video = new ArrayList<String>();
	private List<String> audio = new ArrayList<String>();
	private File image;
	private FileInputStream imageStream;
	private String imageContentType;
	private String imageFileName;
	private String imageType;
	private long imageSize;
	private String imageLocation;
	private int favCount;
	private String buyLink;	
	private int reviewStars;
	private String facebook;
	private String soundcloud;
	private String youtube; 
	private String twitter;
	private String display_checkbox;
	private String author_name;
	private String author_email;
	private List<Integer> audioLinkId = new ArrayList<Integer>();
	private List<Integer> videoLinkId = new ArrayList<Integer>();
	private int imageId;
	private int blogId;
	private java.sql.Timestamp currentDate;
	private java.sql.Timestamp approvedDate;
	private String visibility;
	private String status;
	
	
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getEvent_date() {
		return event_date;
	}
	public void setEvent_date(String event_date) {
		this.event_date = event_date;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getVenue() {
		return venue;
	}
	public void setVenue(String venue) {
		this.venue = venue;
	}
	public String getRsvp() {
		return rsvp;
	}
	public void setRsvp(String rsvp) {
		this.rsvp = rsvp;
	}
	public List<String> getVideo() {
		return video;
	}
	public void setVideo(List<String> video) {
		this.video = video;
	}
	public List<String> getAudio() {
		return audio;
	}
	public void setAudio(List<String> audio) {
		this.audio = audio;
	}
	public File getImage() {
		return image;
	}
	public void setImage(File image) {
		this.image = image;
	}
	public String getFacebook() {
		return facebook;
	}
	public void setFacebook(String facebook) {
		this.facebook = facebook;
	}
	public String getSoundcloud() {
		return soundcloud;
	}
	public void setSoundcloud(String soundcloud) {
		this.soundcloud = soundcloud;
	}
	public String getYoutube() {
		return youtube;
	}
	public void setYoutube(String youtube) {
		this.youtube = youtube;
	}
	public String getTwitter() {
		return twitter;
	}
	public void setTwitter(String twitter) {
		this.twitter = twitter;
	}
	public String getDisplay_checkbox() {
		return display_checkbox;
	}
	public void setDisplay_checkbox(String display_checkbox) {
		this.display_checkbox = display_checkbox;
	}
	public String getAuthor_name() {
		return author_name;
	}
	public void setAuthor_name(String author_name) {
		this.author_name = author_name;
	}
	public String getAuthor_email() {
		return author_email;
	}
	public void setAuthor_email(String author_email) {
		this.author_email = author_email;
	}
	public List<Integer> getAudioLinkId() {
		return audioLinkId;
	}
	public void setAudioLinkId(List<Integer> audioLinkId) {
		this.audioLinkId = audioLinkId;
	}
	public List<Integer> getVideoLinkId() {
		return videoLinkId;
	}
	public void setVideoLinkId(List<Integer> videoLinkId) {
		this.videoLinkId = videoLinkId;
	}
	public int getImageId() {
		return imageId;
	}
	public void setImageId(int imageId) {
		this.imageId = imageId;
	}
	public int getBlogId() {
		return blogId;
	}
	public void setBlogId(int blogId) {
		this.blogId = blogId;
	}
	public String getCover() {
		return cover;
	}
	public void setCover(String cover) {
		this.cover = cover;
	}
	public String getImageContentType() {
		return imageContentType;
	}
	public void setImageContentType(String imageContentType) {
		this.imageContentType = imageContentType;
	}
	public String getImageFileName() {
		return imageFileName;
	}
	public void setImageFileName(String imageFileName) {
		this.imageFileName = imageFileName;
	}
	public String getImageType() {
		return imageType;
	}
	public void setImageType(String imageType) {
		this.imageType = imageType;
	}
	public long getImageSize() {
		return imageSize;
	}
	public void setImageSize(long imageSize) {
		this.imageSize = imageSize;
	}
	public String getImageLocation() {
		return imageLocation;
	}
	public void setImageLocation(String imageLocation) {
		this.imageLocation = imageLocation;
	}
	public FileInputStream getImageStream() {
		return imageStream;
	}
	public void setImageStream(FileInputStream imageStream) {
		this.imageStream = imageStream;
	}
	public java.sql.Timestamp getCurrentDate() {
		return currentDate;
	}
	public void setCurrentDate(java.sql.Timestamp currentDate) {
		this.currentDate = currentDate;
	}
	public java.sql.Timestamp getApprovedDate() {
		return approvedDate;
	}
	public void setApprovedDate(java.sql.Timestamp approvedDate) {
		this.approvedDate = approvedDate;
	}
	public String getVisibility() {
		return visibility;
	}
	public void setVisibility(String visibility) {
		this.visibility = visibility;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public int getFavCount() {
		return favCount;
	}
	public void setFavCount(int favCount) {
		this.favCount = favCount;
	}
	public String getBuyLink() {
		return buyLink;
	}
	public void setBuyLink(String buyLink) {
		this.buyLink = buyLink;
	}
	public int getReviewStars() {
		return reviewStars;
	}
	public void setReviewStars(int reviewStars) {
		this.reviewStars = reviewStars;
	}
	public java.sql.Date getEventDate() {
		return eventDate;
	}
	public void setEventDate(java.sql.Date eventDate) {
		this.eventDate = eventDate;
	}

}

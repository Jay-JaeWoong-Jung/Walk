package model;

public class BoardVO {
	private int no;
	private String userId;
	private String content;
	private String timePosted;
	
	
	public BoardVO(int no, String userId, String content, String timePosted) {
		super();
		this.no = no;
		this.userId = userId;
		this.content = content;
		this.timePosted = timePosted;
	}
	
	
	public BoardVO(String userId, String content) {
		super();
		this.userId = userId;
		this.content = content;
	}

	



	public BoardVO(int no) { //for getPostingByNo, deletePosting
		super();
		this.no = no;
	}


	public BoardVO(int no, String content) { // For checkId, EditContentController
		super();
		this.no = no;
		this.content = content;
	}
	
	public BoardVO(String timePosted) { // For getAllpostByDate
		
		this.timePosted = timePosted;
	}


	public void setNo(int no) {
		this.no = no;
	}


	public void setUserId(String userId) {
		this.userId = userId;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public void setTimePosted(String timePosted) {
		this.timePosted = timePosted;
	}


	public int getNo() {
		return no;
	}


	public String getUserId() {
		return userId;
	}


	public String getContent() {
		return content;
	}


	public String getTimePosted() {
		return timePosted;
	}


	@Override
	public String toString() {
		return "BoardVO [no=" + no + ", userId=" + userId + ", content=" + content + ", timePosted=" + timePosted + "]";
	}
	
	
}

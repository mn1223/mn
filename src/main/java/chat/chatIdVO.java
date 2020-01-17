package chat;

public class chatIdVO {
	
	public chatIdVO(String myid,String yourid) {
		this.myid = myid;
		this.yourid = yourid;
		
	}
	
	private String myid;
	private String yourid;
	
	
	public String getMyid() {
		return myid;
	}
	public void setMyid(String myid) {
		this.myid = myid;
	}
	public String getYourid() {
		return yourid;
	}
	public void setYourid(String yourid) {
		this.yourid = yourid;
	}
	
	

}

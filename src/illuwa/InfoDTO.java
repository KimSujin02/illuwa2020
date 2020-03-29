package illuwa;

public class InfoDTO {
	private int membercount;
	private int boardcount;
	private int num;
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getMembercount() {
		return membercount;
	}
	public void setMembercount(int membercount) {
		this.membercount = membercount;
	}
	public int getBoardcount() {
		return boardcount;
	}
	public void setBoardcount(int boardcount) {
		this.boardcount = boardcount;
	}
	@Override
	public String toString() {
		return "InfoDTO [membercount=" + membercount + ", boardcount=" + boardcount + ", num=" + num + "]";
	}
	
	
}

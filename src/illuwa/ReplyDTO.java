package illuwa;

public class ReplyDTO {
	private int replynum;
	private int postnum;
	private String writer;
	private String content;
	private int like;
	public int getReplynum() {
		return replynum;
	}
	public void setReplynum(int replynum) {
		this.replynum = replynum;
	}
	public int getPostnum() {
		return postnum;
	}
	public void setPostnum(int postnum) {
		this.postnum = postnum;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getLike() {
		return like;
	}
	public void setLike(int like) {
		this.like = like;
	}
	@Override
	public String toString() {
		return "ReplyDTO [replynum=" + replynum + ", postnum=" + postnum + ", writer=" + writer + ", content=" + content
				+ ", like=" + like + "]";
	}
}

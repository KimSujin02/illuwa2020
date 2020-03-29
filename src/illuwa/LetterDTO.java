package illuwa;

public class LetterDTO {
	private String to;
	private String from;
	private String content;
	private int read;
	public String getTo() {
		return to;
	}
	public void setTo(String to) {
		this.to = to;
	}
	public String getFrom() {
		return from;
	}
	public void setFrom(String from) {
		this.from = from;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getRead() {
		return read;
	}
	public void setRead(int read) {
		this.read = read;
	}
	@Override
	public String toString() {
		return "LetterDTO [to=" + to + ", from=" + from + ", content=" + content + ", read=" + read + "]";
	}
}

package illuwa;

import java.util.Vector;

public interface Board {
	//필요한 기능들
	//글쓰기
	//글 불러오기(게시글 내용)
	//글 권한 비밀번호 확인하기
	//글 수정하기
	//글 삭제하기
	//글 신고하기
	//글 조회수 올리기
	//글 답글 수 올리기
	//글 답글 수 내리기
	//친구고민게시판 글 불러오기(vector 사용하기)
	//진로/학업고민게시판 글 불러오기(vector 사용하기)
	//성고민게시판 글 불러오기(vector 사용하기)
	//연애고민상담게시판 글 불러오기(vector 사용하기)
	//기타잡담게시판 글 불러오기(vector 사용하기)
	
	public int insertBoard(BoardDTO dto);
	public BoardDTO readBoard(int num);
	public int updateBoard(BoardDTO dto);
	public int deleteBoard(int num);
	public int reportBoard(int num, String writer);
	public int readcountUpdate(int num);
	public int replycountUpdate(int num, int up);
	
	public Vector<BoardDTO> friendBoard();
	public Vector<BoardDTO> studyBoard();
	public Vector<BoardDTO> privateBoard();
	public Vector<BoardDTO> loveBoard();
	public Vector<BoardDTO> otherBoard();
	
}

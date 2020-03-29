package illuwa;

import java.sql.*;
import java.util.Vector;

public class BoardDAO implements Board{
	Connection conn;
	PreparedStatement pstmt;
	String sql;
	ResultSet rs;
	
	DBConnectionMgr dbcp;
	
	public BoardDAO() { //생성자 
		dbcp = DBConnectionMgr.getInstance();
	}

	@Override
	public int insertBoard(BoardDTO dto) {
		int result = 1; //성공하면 1 실패하면  0
		sql = "INSERT INTO board VALUES(?, ?, ?, ?, date_format(NOW(), '%Y%m%d%H%i%s'), ?, ?, 0, 0, ?)";
		try {
			conn = dbcp.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, 0);
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getContent());
			pstmt.setString(4, dto.getWriter());
			pstmt.setString(5, dto.getImage());
			pstmt.setInt(6, dto.getSubject());
			pstmt.setString(7, dto.getIp());
			pstmt.executeUpdate();
			sql = "UPDATE info SET boardcount=boardcount+1 WHERE num=1";
			pstmt = conn.prepareStatement(sql);
			pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
			result = 0;
		}
		return result;
	}

	@Override
	public BoardDTO readBoard(int num) {
		BoardDTO dto = new BoardDTO();
		sql = "SELECT * FROM board WHERE num=?";
		try {
			conn = dbcp.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setWriter(rs.getString("writer"));
				dto.setDate(rs.getString("date"));
				dto.setImage(rs.getString("image"));
				dto.setSubject(rs.getInt("subject"));
				dto.setReadcount(rs.getInt("readcount"));
				dto.setReplycount(rs.getInt("replycount"));
				dto.setIp(rs.getString("ip"));
				dto.toString();
			}
		}catch (Exception e) {
			System.out.println(e);
			System.out.println("보드 데이터 가져오다가 문제생김");
		}
		return dto;
	}

	@Override
	public int updateBoard(BoardDTO dto) {
		int result = 1;
		sql = "UPDATE board SET title=?, content=?, image=?, subject=? WHERE num=?";
		try {
			conn = dbcp.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getContent());
			pstmt.setString(3, dto.getImage());
			pstmt.setInt(4, dto.getSubject());
			pstmt.setInt(5, dto.getNum());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			result = 0;
		}
		return result;
	}

	@Override
	public int deleteBoard(int num) {
		int result = 1;
		sql = "DELETE * FROM board WHERE num=?";
		try {
			conn = dbcp.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
		} catch (Exception e) {
			e.printStackTrace();
			result = 0;
		}
		return result;
	}

	@Override
	public int reportBoard(int num, String writer) {
		int result = 1;
		sql = "INSERT INTO board_report VALUES(?, ?)";
		try {
			conn = dbcp.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, writer);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			result = 0;
		}
		return result;
	}
	
	@Override
	public int readcountUpdate(int num) {
		int result = 1;
		sql = "UPDATE board SET readcount=readcount+1 WHERE num=?";
		try {
			conn = dbcp.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			result = 0;
		}
		return result;
	}
	
	@Override
	public int replycountUpdate(int num, int up) {
		int result = 1;
		if(up == 1) {
			sql = "UPDATE board SET replycount=replycount+1 WHERE num=?";
			try {
				conn = dbcp.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, num);
				pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
				result = 0;
			}
		}
		else if(up == 0) {
			sql = "UPDATE board SET replycount=replycount-1 WHERE num=?";
			try {
				conn = dbcp.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, num);
				pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
				result = 0;
			}
		}
		return result;
	}

	@Override
	public Vector<BoardDTO> friendBoard() {
		sql = "SELECT num, title, writer, date, readcount, replycount FROM board WHERE subject=1 ORDER BY num DESC";
		Vector<BoardDTO> vlist = new Vector<BoardDTO>();
		BoardDTO dto = null;
		try {
			conn = dbcp.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				dto = new BoardDTO();
				dto.setNum(rs.getInt("num"));
				dto.setTitle(rs.getString("title"));
				dto.setWriter(rs.getString("writer"));
				dto.setDate(rs.getString("date"));
				dto.setReadcount(rs.getInt("readcount"));
				dto.setReplycount(rs.getInt("replycount"));
				vlist.add(dto);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return vlist;
	}

	@Override
	public Vector<BoardDTO> studyBoard() {
		sql = "SELECT num, title, writer, date, readcount, replycount FROM board WHERE subject=2 ORDER BY num DESC";
		Vector<BoardDTO> vlist = new Vector<BoardDTO>();
		BoardDTO dto = null;
		try {
			conn = dbcp.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				dto = new BoardDTO();
				dto.setNum(rs.getInt("num"));
				dto.setTitle(rs.getString("title"));
				dto.setWriter(rs.getString("writer"));
				dto.setDate(rs.getString("date"));
				dto.setReadcount(rs.getInt("readcount"));
				dto.setReplycount(rs.getInt("replycount"));
				vlist.add(dto);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return vlist;
	}

	@Override
	public Vector<BoardDTO> privateBoard() {
		sql = "SELECT num, title, writer, date, readcount, replycount FROM board WHERE subject=3 ORDER BY num DESC";
		Vector<BoardDTO> vlist = new Vector<BoardDTO>();
		BoardDTO dto = null;
		try {
			conn = dbcp.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				dto = new BoardDTO();
				dto.setNum(rs.getInt("num"));
				dto.setTitle(rs.getString("title"));
				dto.setWriter(rs.getString("writer"));
				dto.setDate(rs.getString("date"));
				dto.setReadcount(rs.getInt("readcount"));
				dto.setReplycount(rs.getInt("replycount"));
				vlist.add(dto);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return vlist;
	}

	@Override
	public Vector<BoardDTO> loveBoard() {
		sql = "SELECT num, title, writer, date, readcount, replycount FROM board WHERE subject=4 ORDER BY num DESC";
		Vector<BoardDTO> vlist = new Vector<BoardDTO>();
		BoardDTO dto = null;
		try {
			conn = dbcp.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				dto = new BoardDTO();
				dto.setNum(rs.getInt("num"));
				dto.setTitle(rs.getString("title"));
				dto.setWriter(rs.getString("writer"));
				dto.setDate(rs.getString("date"));
				dto.setReadcount(rs.getInt("readcount"));
				dto.setReplycount(rs.getInt("replycount"));
				vlist.add(dto);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return vlist;
	}

	@Override
	public Vector<BoardDTO> otherBoard() {
		sql = "SELECT num, title, writer, date, readcount, replycount FROM board WHERE subject=5 ORDER BY num DESC";
		Vector<BoardDTO> vlist = new Vector<BoardDTO>();
		BoardDTO dto = null;
		try {
			conn = dbcp.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				dto = new BoardDTO();
				dto.setNum(rs.getInt("num"));
				dto.setTitle(rs.getString("title"));
				dto.setWriter(rs.getString("writer"));
				dto.setDate(rs.getString("date"));
				dto.setReadcount(rs.getInt("readcount"));
				dto.setReplycount(rs.getInt("replycount"));
				vlist.add(dto);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return vlist;
	}

}

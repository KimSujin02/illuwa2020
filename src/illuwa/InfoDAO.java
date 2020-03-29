package illuwa;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class InfoDAO implements Info{
	Connection conn;
	PreparedStatement pstmt;
	String sql;
	ResultSet rs;
	
	DBConnectionMgr dbcp;
	
	public InfoDAO() {
		dbcp = DBConnectionMgr.getInstance();
	}

	@Override
	public InfoDTO allCount() {
		InfoDTO dto = new InfoDTO();
		sql = "SELECT membercount, boardcount FROM info WHERE num=?";
		try {
			conn = dbcp.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, 1);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto.setMembercount(rs.getInt("membercount"));
				dto.setBoardcount(rs.getInt("boardcount"));
			}
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println("멤버 수 정보를 가져오지 못함");
		}
		return dto;
	}

}

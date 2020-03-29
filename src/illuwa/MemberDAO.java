package illuwa;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class MemberDAO implements Member{
	Connection conn;
	PreparedStatement pstmt;
	String sql;
	ResultSet rs;
	
	DBConnectionMgr dbcp;
	
	public MemberDAO() {
		dbcp = DBConnectionMgr.getInstance();
	}

	@Override
	public int joinMember(MemberDTO dto) {
		int result = 1;
		sql = "INSERT INTO member VALUES(?, ?, ?, ?, 0, 0, ?, ?, 0, ?)";
		try {
			conn = dbcp.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPw());
			pstmt.setString(3, dto.getName());
			pstmt.setString(4, dto.getTel());
			pstmt.setString(5, dto.getBirth());
			pstmt.setString(6, dto.getGender());
			pstmt.setString(7, dto.getEmail());
			pstmt.executeUpdate();
			sql = "UPDATE info SET membercount=membercount+1 WHERE num=1";
			pstmt = conn.prepareStatement(sql);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			result = 0;
		}
		return result;
	}

	@Override
	public int confirmId(String id) {
		int result = 1;
		sql = "SELECT * FROM member WHERE id=?";
		try {
			conn = dbcp.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				System.out.println("������ ���̵� ����(�ش� ���̵� ���Ұ�)");
				result = 0;
			} else {
				System.out.println("���̵� �� �� ����");
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("���̵� Ȯ�� �� ����");
		}
		return result;
	}

	@Override
	public boolean confirmAge(String jm) {
//		int[] mulN = {2, 3, 4, 5, 6, 7, 8, 9, 2, 3, 4, 5};
//        int sum = 0;
//        for(int i = 0; i < jm.length()-1; i++) {
//            sum += (jm.charAt(i) - '0') * mulN[i];
//        }
//        int last = (11-(sum%11)) % 10; //10�϶� �� �ڸ��� ������ ��. 10�̸� 0���� �������� �ϴ� ����
//        System.out.println(last);
//        return (jm.charAt(jm.length()-1)-'0') == last;
		return false;
	}

	@Override
	public int loginMember(String id, String pw) {
		int result = 1;
		String pwdb = "";
		sql = "SELECT id, pw FROM member WHERE id=?";
		try {
			conn = dbcp.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()){
				pwdb = rs.getString("pw");
				if(pwdb.equals(pw)){
					System.out.println("�α��� ����");
					result = 1;
	 	   		}else {
	 	   			System.out.println("��й�ȣ�� ��ġ���� ����");
	 	   			result = 0;
	 	   		}
			} else {
				System.out.println("�ش� ���̵� ������ ����");
				result = 2;
			}
	     }catch(Exception e){
	     	e.printStackTrace();
	     	System.out.println("�α��� try�� ���� �Ұ�");
	     	result = 0;
	     	}
		return result;
	}

	@Override
	public MemberDTO memberInfo(String id) {
		MemberDTO dto = new MemberDTO();
		sql = "SELECT * FROM member WHERE id=?";
		try {
			conn = dbcp.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,  dto.getId());
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto.setId(rs.getString("id"));
				dto.setPw(rs.getString("pw"));
				dto.setName(rs.getString("name"));
				dto.setTel(rs.getString("tel"));
				dto.setPostcount(rs.getInt("postcount"));
				dto.setReplycount(rs.getInt("replycount"));
				dto.setBirth(rs.getString("birth"));
				dto.setGender(rs.getString("gender"));
				dto.setLevel(rs.getInt("level"));
				dto.setEmail(rs.getString("email"));
			}
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println("ȸ�� ���� �ҷ����� �� ����");
		}
		return dto;
	}

	@Override
	public int updateMember(MemberDTO dto) {
		int result = 1;
		sql="UPDATE member SET pw=?, tel=?, email= ? WHERE id = ?";
		try {
			conn = dbcp.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getPw());
			pstmt.setString(2,  dto.getTel());
			pstmt.setString(3, dto.getEmail());
			pstmt.setString(4, dto.getId());
			pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
			result = 0;
		}
		return result;
	}

	@Override
	public int deleteMember(String id) {
		int result = 1;
		sql = "DELETE FROM member WHERE id=?";
		try {
			conn = dbcp.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.executeUpdate();
	    }catch(Exception e){
        	e.printStackTrace();
        	result = 0;
	    }
		return result;
	}
}

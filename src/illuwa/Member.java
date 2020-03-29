package illuwa;

public interface Member {
	//필요한 기능들
	//회원가입하기
	//중복 아이디 있는지 확인하기
	//주민번호 확인해서 성인인지 아닌지
	//로그인하기
	//로그아웃하기 <<< 이놈은 웹상에서 쿠키 해제로
	
	//마이페이지로 내 정보 가져오기 (selectMember같은?)
	//회원정보수정하기
	//회원탈퇴하기
	
	public int joinMember(MemberDTO dto);
	public int confirmId(String id);
	public boolean confirmAge(String jm);
	public int loginMember(String id, String pw);
	public MemberDTO memberInfo(String id);
	public int updateMember(MemberDTO dto);
	public int deleteMember(String id);
}

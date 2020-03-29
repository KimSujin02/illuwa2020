package illuwa;

public interface Member {
	//�ʿ��� ��ɵ�
	//ȸ�������ϱ�
	//�ߺ� ���̵� �ִ��� Ȯ���ϱ�
	//�ֹι�ȣ Ȯ���ؼ� �������� �ƴ���
	//�α����ϱ�
	//�α׾ƿ��ϱ� <<< �̳��� ���󿡼� ��Ű ������
	
	//������������ �� ���� �������� (selectMember����?)
	//ȸ�����������ϱ�
	//ȸ��Ż���ϱ�
	
	public int joinMember(MemberDTO dto);
	public int confirmId(String id);
	public boolean confirmAge(String jm);
	public int loginMember(String id, String pw);
	public MemberDTO memberInfo(String id);
	public int updateMember(MemberDTO dto);
	public int deleteMember(String id);
}

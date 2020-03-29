package illuwa;

import java.util.Vector;

public interface Board {
	//�ʿ��� ��ɵ�
	//�۾���
	//�� �ҷ�����(�Խñ� ����)
	//�� ���� ��й�ȣ Ȯ���ϱ�
	//�� �����ϱ�
	//�� �����ϱ�
	//�� �Ű��ϱ�
	//�� ��ȸ�� �ø���
	//�� ��� �� �ø���
	//�� ��� �� ������
	//ģ����ΰԽ��� �� �ҷ�����(vector ����ϱ�)
	//����/�о���ΰԽ��� �� �ҷ�����(vector ����ϱ�)
	//����ΰԽ��� �� �ҷ�����(vector ����ϱ�)
	//���ְ�λ��Խ��� �� �ҷ�����(vector ����ϱ�)
	//��Ÿ���Խ��� �� �ҷ�����(vector ����ϱ�)
	
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

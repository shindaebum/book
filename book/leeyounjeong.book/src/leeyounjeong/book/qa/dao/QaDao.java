package leeyounjeong.book.qa.dao;

import java.util.List;

import leeyounjeong.book.qa.domain.Qa;

public interface QaDao {
	List<Qa> getQas();  //게시판 목록
	Qa getQa(int qaNo);  //게시판 글 하나
	int addQa(Qa qa);  //게시글 추가
	int updateQa(Qa qa);  //게시글 수정
	int delQa(int qaNo);  //게시글 삭제
}

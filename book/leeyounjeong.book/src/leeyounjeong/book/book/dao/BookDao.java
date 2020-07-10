package leeyounjeong.book.book.dao;


import java.util.List;

import leeyounjeong.book.book.domain.Book;
import leeyounjeong.book.book.domain.BookImg;

public interface BookDao {
	//도서
	List<Book> getBooks();		//책 목록 정보
	Book getBook(long ISBN);	//책 하나 정보
	int addBook(Book book); 	//책 추가
	int updateBook(Book book);	//책 수정
	int delBook(long ISBN);		//책 삭제
	
	
	//이미지
	String getBookImg(long ISBN);		//이미지 하나 정보
	int addBookImg(BookImg bookImg);			//이미지 추가
	int modifyBookImgName(BookImg bookImg);	//이미지 이름수정
}	

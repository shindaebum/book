package leeyounjeong.book.book.dao.map;


import java.util.List;

import leeyounjeong.book.book.domain.Book;
import leeyounjeong.book.book.domain.BookImg;

public interface BookMap {
	//도서
	List<Book> getBooks();		
	Book getBook(long ISBN);	
	int addBook(Book book); 				
	int updateBook(Book book);	
	int delBook(long ISBN);		
	
	//이미지
	String getBookImg(long ISBN);		
	int addBookImg(BookImg bookImg);		
	int modifyBookImgName(BookImg bookImg);
}

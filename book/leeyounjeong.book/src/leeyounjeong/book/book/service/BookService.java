package leeyounjeong.book.book.service;


import java.util.List;

import leeyounjeong.book.book.domain.Book;
import leeyounjeong.book.book.domain.BookImg;

public interface BookService {
	List<Book> listBooks();     		//목록을 읽어옴
	Book findBook(long ISBN);			//책을 찾음
	boolean regBook(Book book);			//책을 등록함
	boolean modifyBook(Book book);		//책을 수정함
	boolean secede(long ISBN);			//책을 삭제함
	
	String readBookImgName(long ISBN);
	boolean regBookImg(BookImg bookImg);
	boolean updateBookImgName(BookImg bookImg);
}

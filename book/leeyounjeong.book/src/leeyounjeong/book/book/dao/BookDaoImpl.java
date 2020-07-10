package leeyounjeong.book.book.dao;


import java.util.List;

import leeyounjeong.book.book.dao.map.BookMap;
import leeyounjeong.book.book.domain.Book;
import leeyounjeong.book.book.domain.BookImg;
import leeyounjeong.book.config.Configuration;

public class BookDaoImpl implements BookDao{
	private BookMap bookMapper;
	
	
	public BookDaoImpl() {
		this.bookMapper = Configuration.getMapper(BookMap.class);
	}
	
	@Override
	public List<Book> getBooks(){
		return bookMapper.getBooks();
	}
	
	@Override
	public Book getBook(long ISBN) {
		return bookMapper.getBook(ISBN);
	}
	
	@Override
	public int addBook(Book book) {
		return bookMapper.addBook(book);
	}
	
	@Override
	public int updateBook(Book book) {
		return bookMapper.updateBook(book);
	}
	
	@Override
	public int delBook(long ISBN) {
		return bookMapper.delBook(ISBN);
	}
	
	
//이미지
	@Override
	public String getBookImg(long ISBN) {
		return bookMapper.getBookImg(ISBN);
	}
	
	@Override
	public int addBookImg(BookImg bookImg) {
		return bookMapper.addBookImg(bookImg);
	}
	
	@Override
	public int modifyBookImgName(BookImg bookImg) {
		return bookMapper.modifyBookImgName(bookImg);
	}
}

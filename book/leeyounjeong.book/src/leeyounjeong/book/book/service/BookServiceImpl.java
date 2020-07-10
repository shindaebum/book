package leeyounjeong.book.book.service;


import java.util.List;

import leeyounjeong.book.book.dao.BookDao;
import leeyounjeong.book.book.dao.BookDaoImpl;
import leeyounjeong.book.book.domain.Book;
import leeyounjeong.book.book.domain.BookImg;

public class BookServiceImpl implements BookService {
	private BookDao bookDao;
	
	public BookServiceImpl() {
		this.bookDao = new BookDaoImpl();
	}
	
	@Override
	public List<Book> listBooks(){
		return bookDao.getBooks();
	}
	
	@Override
	public Book findBook(long ISBN) {
		return bookDao.getBook(ISBN);
	}
	
	@Override
	public boolean regBook(Book book) {
		return bookDao.addBook(book)>0;
	}
	
	@Override
	public boolean modifyBook(Book book) {
		return bookDao.updateBook(book)>0;
	}
	
	@Override
	public boolean secede(long ISBN) {
		return bookDao.delBook(ISBN)>0;
	}
	
//이미지
	@Override
	public String readBookImgName(long ISBN) {
		return bookDao.getBookImg(ISBN);
	}
	
	@Override
	public boolean regBookImg(BookImg bookImg) {
		return bookDao.addBookImg(bookImg)>0;
	}


	@Override
	public boolean updateBookImgName(BookImg bookImg) {
		return bookDao.modifyBookImgName(bookImg)>0;
	}
}

package leeyounjeong.book.book.domain;

public class BookImg {
	private long ISBN;
	private String bookImgName;
	
	public BookImg() {}
	
	public BookImg(long ISBN, String bookImgName) {
		this.ISBN = ISBN;
		this.bookImgName = bookImgName;
	}

	public long getISBN() {
		return ISBN;
	}

	public String getBookImgName() {
		return bookImgName;
	}

	public void setISBN(long iSBN) {
		ISBN = iSBN;
	}

	public void setBookImgName(String bookImgName) {
		this.bookImgName = bookImgName;
	}
	
}

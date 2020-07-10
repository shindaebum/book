package leeyounjeong.book.book.domain;

public class Book {
	private long ISBN;
	private String bookTitle;
	private int bookPrice;
	private String author;
	private String pubName;
	private String pubDate;
	private String bookType;
	private String bookInfo;
	
	public Book() {}
	
	public Book(long ISBN, String bookTitle, int bookPrice, String author,
			String pubName, String pubDate, String bookType, String bookInfo) {
		this.ISBN = ISBN;
		this.bookTitle= bookTitle;
		this.bookPrice= bookPrice;
		this.author= author;
		this.pubName = pubName;
		this.pubDate = pubDate;
		this.bookType = bookType;
		this.bookInfo = bookInfo;
	}
	
	public long getISBN() {
		return ISBN;
	}
	public String getBookTitle() {
		return bookTitle;
	}
	public int getBookPrice() {
		return bookPrice;
	}
	public String getAuthor() {
		return author;
	}
	public String getPubName() {
		return pubName;
	}
	public String getPubDate() {
		return pubDate;
	}
	public String getBookType() {
		return bookType;
	}
	public String getBookInfo() {
		return bookInfo;
	}
	public void setISBN(long iSBN) {
		ISBN = iSBN;
	}
	public void setBookTitle(String bookTitle) {
		this.bookTitle = bookTitle;
	}
	public void setBookPrice(int bookPrice) {
		this.bookPrice = bookPrice;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public void setPubName(String pubName) {
		this.pubName = pubName;
	}
	public void setPubDate(String pubDate) {
		this.pubDate = pubDate;
	}
	public void setBookType(String bookType) {
		this.bookType = bookType;
	}
	public void setBookInfo(String bookInfo) {
		this.bookInfo = bookInfo;
	}
	
	
	@Override
	public String toString() {
		return String.format("%d %s %d %s %s %s %s %s",
				ISBN,bookTitle,bookPrice,author,pubName,pubDate,bookType,bookInfo);
	}
}

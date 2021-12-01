package web.user.dto;

public class Book_class {
	private int book_class_no;
	private String book_class_name;
	@Override
	public String toString() {
		return "Book_class [book_class_no=" + book_class_no + ", book_class_name=" + book_class_name + "]";
	}
	public int getBook_class_no() {
		return book_class_no;
	}
	public void setBook_class_no(int book_class_no) {
		this.book_class_no = book_class_no;
	}
	public String getBook_class_name() {
		return book_class_name;
	}
	public void setBook_class_name(String book_class_name) {
		this.book_class_name = book_class_name;
	}
	
}

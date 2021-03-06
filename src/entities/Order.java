package entities;

import java.util.Date;

public class Order {
	private int id, member,staff,book;
	private Date start_date, end_date;
	private String description;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getMember() {
		return member;
	}
	public void setMember(int member) {
		this.member = member;
	}
	public int getStaff() {
		return staff;
	}
	public void setStaff(int staff) {
		this.staff = staff;
	}
	public int getBook() {
		return book;
	}
	public void setBook(int book) {
		this.book = book;
	}
	public Date getStart_date() {
		return start_date;
	}
	public void setStart_date(Date start_date) {
		this.start_date = start_date;
	}
	public Date getEnd_date() {
		return end_date;
	}
	public void setEnd_date(Date end_date) {
		this.end_date = end_date;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Order(int id, int member, int staff, int book, Date start_date, Date end_date, String description) {
		super();
		this.id = id;
		this.member = member;
		this.staff = staff;
		this.book = book;
		this.start_date = start_date;
		this.end_date = end_date;
		this.description = description;
	}
	@Override
	public String toString() {
		return "Order [id=" + id + ", member=" + member + ", staff=" + staff + ", book=" + book + ", start_date="
				+ start_date + ", end_date=" + end_date + ", description=" + description + "]";
	}
	
	
	
}

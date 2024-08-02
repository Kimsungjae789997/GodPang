package shop.vo;

public class ReviewVO {
	private int review_no;
	private String review_title;
	private String review_content;
	private String review_write_date;
	private String review_delyn;
	private String prod_id;
	private int cart_no;
	private String review_img;
	public String getReview_img() {
		return review_img;
	}
	public void setReview_img(String review_img) {
		this.review_img = review_img;
	}
	public int getReview_no() {
		return review_no;
	}
	public void setReview_no(int review_no) {
		this.review_no = review_no;
	}
	public String getReview_title() {
		return review_title;
	}
	public void setReview_title(String review_title) {
		this.review_title = review_title;
	}
	public String getReview_content() {
		return review_content;
	}
	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}
	public String getReview_write_date() {
		return review_write_date;
	}
	public void setReview_write_date(String review_write_date) {
		this.review_write_date = review_write_date;
	}
	public String getReview_delyn() {
		return review_delyn;
	}
	public void setReview_delyn(String review_delyn) {
		this.review_delyn = review_delyn;
	}
	public String getProd_id() {
		return prod_id;
	}
	public void setProd_id(String prod_id) {
		this.prod_id = prod_id;
	}
	public int getCart_no() {
		return cart_no;
	}
	public void setCart_no(int cart_no) {
		this.cart_no = cart_no;
	}
	@Override
	public String toString() {
		return "ReviewVO [review_no=" + review_no + ", review_title=" + review_title + ", review_content="
				+ review_content + ", review_write_date=" + review_write_date + ", review_delyn=" + review_delyn
				+ ", prod_id=" + prod_id + ", cart_no=" + cart_no + "]";
	}

}

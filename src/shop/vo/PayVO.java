package shop.vo;

public class PayVO {
	
	private int cart_no;
	private String pay_date;
	private int pay_amt;
	private int pay_finalprice;
	private int coupon_no;
	private String mem_id;
	
	
	public int getCart_no() {
		return cart_no;
	}
	public void setCart_no(int cart_no) {
		this.cart_no = cart_no;
	}
	public String getPay_date() {
		return pay_date;
	}
	public void setPay_date(String pay_date) {
		this.pay_date = pay_date;
	}
	public int getPay_amt() {
		return pay_amt;
	}
	public void setPay_amt(int pay_amt) {
		this.pay_amt = pay_amt;
	}
	public int getPay_finalprice() {
		return pay_finalprice;
	}
	public void setPay_finalprice(int pay_finalprice) {
		this.pay_finalprice = pay_finalprice;
	}
	public int getCoupon_no() {
		return coupon_no;
	}
	public void setCoupon_no(int coupon_no) {
		this.coupon_no = coupon_no;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	
	
}

package shop.vo;

public class MembershipVO {
	private int membership_no;
	private String mem_id;
	private String membership_code;
	private String membership_hire_date;
	private String membership_retire_date;
	private String membership_delete;
	private String membership_bank_name;
	private String membership_bank_no;
	private String membership_card_name;
	private String membership_card_no;
	private String membership_card_cvc;
	private String membership_card_pass;
	private int membership_discount_rate;
	
	public int getMembership_no() {
		return membership_no;
	}
	public void setMembership_no(int membership_no) {
		this.membership_no = membership_no;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getMembership_code() {
		return membership_code;
	}
	public void setMembership_code(String membership_code) {
		this.membership_code = membership_code;
	}
	public String getMembership_hire_date() {
		return membership_hire_date;
	}
	public void setMembership_hire_date(String membership_hire_date) {
		this.membership_hire_date = membership_hire_date;
	}
	public String getMembership_retire_date() {
		return membership_retire_date;
	}
	public void setMembership_retire_date(String membership_retire_date) {
		this.membership_retire_date = membership_retire_date;
	}
	public String getMembership_delete() {
		return membership_delete;
	}
	public void setMembership_delete(String membership_delete) {
		this.membership_delete = membership_delete;
	}
	public String getMembership_bank_name() {
		return membership_bank_name;
	}
	public void setMembership_bank_name(String membership_bank_name) {
		this.membership_bank_name = membership_bank_name;
	}
	public String getMembership_bank_no() {
		return membership_bank_no;
	}
	public void setMembership_bank_no(String membership_bank_no) {
		this.membership_bank_no = membership_bank_no;
	}
	public String getMembership_card_name() {
		return membership_card_name;
	}
	public void setMembership_card_name(String membership_card_name) {
		this.membership_card_name = membership_card_name;
	}
	public String getMembership_card_no() {
		return membership_card_no;
	}
	public void setMembership_card_no(String membership_card_no) {
		this.membership_card_no = membership_card_no;
	}
	public String getMembership_card_cvc() {
		return membership_card_cvc;
	}
	public void setMembership_card_cvc(String membership_card_cvc) {
		this.membership_card_cvc = membership_card_cvc;
	}
	public String getMembership_card_pass() {
		return membership_card_pass;
	}
	public void setMembership_card_pass(String membership_card_pass) {
		this.membership_card_pass = membership_card_pass;
	}
	public int getMembership_discount_rate() {
		return membership_discount_rate;
	}
	public void setMembership_discount_rate(int membership_discount_rate) {
		this.membership_discount_rate = membership_discount_rate;
	}
	@Override
	public String toString() {
		return "MembershipVO [membership_no=" + membership_no + ", mem_id=" + mem_id + ", membership_code="
				+ membership_code + ", membership_hire_date=" + membership_hire_date + ", membership_retire_date="
				+ membership_retire_date + ", membership_delete=" + membership_delete + ", membership_bank_name="
				+ membership_bank_name + ", membership_bank_no=" + membership_bank_no + ", membership_card_name="
				+ membership_card_name + ", membership_card_no=" + membership_card_no + ", membership_card_cvc="
				+ membership_card_cvc + ", membership_card_pass=" + membership_card_pass + ", membership_discount_rate="
				+ membership_discount_rate + "]";
	}
	
}

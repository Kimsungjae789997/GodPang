package shop.vo;

public class MemberVO {
	private String mem_id;
	private String mem_pass;
	private String mem_name;
	private String mem_zip;
	private String mem_add1;
	private String mem_add2;
	private String mem_tel;
	private String mem_mail;
	private String mem_memorialq;
	private String mem_memoriala;
	private String mem_delete;
	
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getMem_pass() {
		return mem_pass;
	}
	public void setMem_pass(String mem_pass) {
		this.mem_pass = mem_pass;
	}
	public String getMem_name() {
		return mem_name;
	}
	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
	public String getMem_zip() {
		return mem_zip;
	}
	public void setMem_zip(String mem_zip) {
		this.mem_zip = mem_zip;
	}
	public String getMem_add1() {
		return mem_add1;
	}
	public void setMem_add1(String mem_add1) {
		this.mem_add1 = mem_add1;
	}
	public String getMem_add2() {
		return mem_add2;
	}
	public void setMem_add2(String mem_add2) {
		this.mem_add2 = mem_add2;
	}
	public String getMem_tel() {
		return mem_tel;
	}
	public void setMem_tel(String mem_tel) {
		this.mem_tel = mem_tel;
	}
	public String getMem_mail() {
		return mem_mail;
	}
	public void setMem_mail(String mem_mail) {
		this.mem_mail = mem_mail;
	}
	public String getMem_memorialq() {
		return mem_memorialq;
	}
	public void setMem_memorialq(String mem_memorialq) {
		this.mem_memorialq = mem_memorialq;
	}
	public String getMem_memoriala() {
		return mem_memoriala;
	}
	public void setMem_memoriala(String mem_memoriala) {
		this.mem_memoriala = mem_memoriala;
	}
	public String getMem_delete() {
		return mem_delete;
	}
	public void setMem_delete(String mem_delete) {
		this.mem_delete = mem_delete;
	}
	@Override
	public String toString() {
		return "MemberVO [mem_id=" + mem_id + ", mem_pass=" + mem_pass + ", mem_name=" + mem_name + ", mem_zip="
				+ mem_zip + ", mem_add1=" + mem_add1 + ", mem_add2=" + mem_add2 + ", mem_tel=" + mem_tel + ", mem_mail="
				+ mem_mail + ", mem_memorialq=" + mem_memorialq + ", mem_memoriala=" + mem_memoriala + ", mem_delete="
				+ mem_delete + "]";
	}
	
}

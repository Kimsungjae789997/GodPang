package shop.vo;

public class ProdVO {
	private String prod_id;
	private String prod_name;
	private String prod_content;
	private int prod_cost;
	private int prod_price;
	private String prod_img;
	private String prod_insdate;
	private String lprod_gu;
	
	public String getProd_id() {
		return prod_id;
	}
	public void setProd_id(String prod_id) {
		this.prod_id = prod_id;
	}
	public String getProd_name() {
		return prod_name;
	}
	public void setProd_name(String prod_name) {
		this.prod_name = prod_name;
	}
	public String getProd_content() {
		return prod_content;
	}
	public void setProd_content(String prod_content) {
		this.prod_content = prod_content;
	}
	public int getProd_cost() {
		return prod_cost;
	}
	public void setProd_cost(int prod_cost) {
		this.prod_cost = prod_cost;
	}
	public int getProd_price() {
		return prod_price;
	}
	public void setProd_price(int prod_price) {
		this.prod_price = prod_price;
	}
	public String getProd_img() {
		return prod_img;
	}
	public void setProd_img(String prod_img) {
		this.prod_img = prod_img;
	}
	public String getProd_insdate() {
		return prod_insdate;
	}
	public void setProd_insdate(String prod_insdate) {
		this.prod_insdate = prod_insdate;
	}
	public String getLprod_gu() {
		return lprod_gu;
	}
	public void setLprod_gu(String lprod_gu) {
		this.lprod_gu = lprod_gu;
	}
	@Override
	public String toString() {
		return "ProdVO [prod_id=" + prod_id + ", prod_name=" + prod_name + ", prod_content=" + prod_content
				+ ", prod_cost=" + prod_cost + ", prod_price=" + prod_price + ", prod_img=" + prod_img
				+ ", prod_insdate=" + prod_insdate + ", lprod_gu=" + lprod_gu + "]";
	}
	
}

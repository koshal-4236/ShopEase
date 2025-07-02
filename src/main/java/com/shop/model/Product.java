package com.shop.model;

import javax.persistence.*;

@Entity
@Table(name="products")
public class Product {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int  id;
	
	@Column(name = "product_name")
	private String product_name;
	
	@Column(name = "product_desc")
	private String product_desc;
	
	@Column(name = "price")
	private double price;
	
	@Column(name="image_url")
	private String imageUrl;
	
	
	public Product() {}
	
	public Product(String product_name, String product_desc, double price, String imageUrl) {
		super();
		this.product_name = product_name;
		this.product_desc = product_desc;
		this.price = price;
		this.imageUrl = imageUrl;
	}
	
	  public int getId() {
	        return id;
	    }

	    public void setId(int id) {
	        this.id = id;
	    }
	    
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public String getProduct_desc() {
		return product_desc;
	}
	public void setProduct_desc(String product_desc) {
		this.product_desc = product_desc;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public String getImageUrl() {
		return imageUrl;
	}
	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}
	
	
	
}

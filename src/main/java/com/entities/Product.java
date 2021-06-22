package com.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="product")
public class Product {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int pId;
	private String pName;
	@Column(length = 3000)
	private String pDesc;
	private String pPhoto;
	private double pPrice;
	private int pQuantity;
	private double pDiscount;
	
	@ManyToOne
	private Category category;
	
	
	public Product(int pId, String pName, String pDesc, String pPhoto, double pPrice, int pQuantity, double pDiscount) {
		super();
		this.pId = pId;
		this.pName = pName;
		this.pDesc = pDesc;
		this.pPhoto = pPhoto;
		this.pPrice = pPrice;
		this.pQuantity = pQuantity;
		this.pDiscount = pDiscount;
	}


	public Product(String pName, String pDesc, String pPhoto, double pPrice, int pQuantity, double pDiscount, Category category) {
		super();
		this.pName = pName;
		this.pDesc = pDesc;
		this.pPhoto = pPhoto;
		this.pPrice = pPrice;
		this.pQuantity = pQuantity;
		this.pDiscount = pDiscount;
		this.category = category;
	}


	public Product() {
		super();
	}


	public int getpId() {
		return pId;
	}


	public void setpId(int pId) {
		this.pId = pId;
	}


	public String getpName() {
		return pName;
	}


	public void setpName(String pName) {
		this.pName = pName;
	}


	public String getpDesc() {
		return pDesc;
	}


	public void setpDesc(String pDesc) {
		this.pDesc = pDesc;
	}


	public String getpPhoto() {
		return pPhoto;
	}


	public void setpPhoto(String pPhoto) {
		this.pPhoto = pPhoto;
	}


	public double getpPrice() {
		return pPrice;
	}


	public void setpPrice(double pPrice) {
		this.pPrice = pPrice;
	}


	public int getpQuantity() {
		return pQuantity;
	}


	public void setpQuantity(int pQuantity) {
		this.pQuantity = pQuantity;
	}


	public double getpDiscount() {
		return pDiscount;
	}


	public void setpDiscount(double pDiscount) {
		this.pDiscount = pDiscount;
	}


	@Override
	public String toString() {
		return "Product [pId=" + pId + ", pName=" + pName + ", pDesc=" + pDesc + ", pPhoto=" + pPhoto + ", pPrice="
				+ pPrice + ", pQuantity=" + pQuantity + ", pDiscount=" + pDiscount + "]";
	}


	public Category getCategory() {
		return category;
	}


	public void setCategory(Category category) {
		this.category = category;
	}
		
	// Calculate price after discount
	public double calculatePriceAfterDiscount()
	{
		double discount = (this.getpDiscount()/100.0)*this.getpPrice();
		return Math.round(this.getpPrice()-discount);
	}
}

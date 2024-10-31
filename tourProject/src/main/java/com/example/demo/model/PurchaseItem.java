package com.example.demo.model;

import java.util.Date;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;

@Entity
@Table(name = "purchases")
public class PurchaseItem {
	    @Id
	    @GeneratedValue(strategy = GenerationType.IDENTITY)
	    private int purchaseId;

	    @Column(name = "user_id", nullable = false)
	    private String userId;

	    @Column(name = "product_id", nullable = false)
	    private int productId;

	    private int quantity;
	    private int purchasePrice;

	    @Column(name = "purchase_date")
	    @Temporal(TemporalType.TIMESTAMP)
	    private Date purchaseDate;

	    
		public int getPurchaseId() {
			return purchaseId;
		}

		public void setPurchaseId(int purchaseId) {
			this.purchaseId = purchaseId;
		}

		public String getUserId() {
			return userId;
		}

		public void setUserId(String userId) {
			this.userId = userId;
		}

		public int getProductId() {
			return productId;
		}

		public void setProductId(int productId) {
			this.productId = productId;
		}

		public int getQuantity() {
			return quantity;
		}

		public void setQuantity(int quantity) {
			this.quantity = quantity;
		}

		public int getPurchasePrice() {
			return purchasePrice;
		}

		public void setPurchasePrice(int purchasePrice) {
			this.purchasePrice = purchasePrice;
		}

		public Date getPurchaseDate() {
			return purchaseDate;
		}

		public void setPurchaseDate(Date purchaseDate) {
			this.purchaseDate = purchaseDate;
		}
	    
	    
}

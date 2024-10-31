package com.example.demo.model;

import java.time.LocalDateTime;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "inquiry_comments")
public class InquiryComment {
	   @Id
	    @Column(name = "comment_id")
	    @GeneratedValue(strategy = GenerationType.IDENTITY)
	    private Long commentId;

	    @Column(name = "inquiry_id")
	    private int inquiryId;

	    @Column(name = "user_id")
	    private String userId;

	    @Column(name = "content")
	    private String content;

	    @Column(name = "created_at")
	    private LocalDateTime createdAt;

		public Long getCommentId() {
			return commentId;
		}

		public void setCommentId(Long commentId) {
			this.commentId = commentId;
		}

		public int getInquiryId() {
			return inquiryId;
		}

		public void setInquiryId(int inquiryId) {
			this.inquiryId = inquiryId;
		}

		public String getUserId() {
			return userId;
		}

		public void setUserId(String userId) {
			this.userId = userId;
		}

		public String getContent() {
			return content;
		}

		public void setContent(String content) {
			this.content = content;
		}

		public LocalDateTime getCreatedAt() {
			return createdAt;
		}

		public void setCreatedAt(LocalDateTime createdAt) {
			this.createdAt = createdAt;
		}
	    
	    
	    
}

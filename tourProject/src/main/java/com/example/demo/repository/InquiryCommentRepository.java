package com.example.demo.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.demo.model.InquiryComment;

public interface InquiryCommentRepository extends JpaRepository<InquiryComment, Long> {
    List<InquiryComment> findByInquiryId(int inquiryId);
}



package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.model.InquiryComment;
import com.example.demo.repository.InquiryCommentRepository;

@Service
public class InquiryCommentService {

    @Autowired
    private InquiryCommentRepository inquiryCommentRepository;

    public List<InquiryComment> getCommentsByInquiryId(int inquiryId) {
        return inquiryCommentRepository.findByInquiryId(inquiryId);
    }

    public void save(InquiryComment comment) {
        inquiryCommentRepository.save(comment);
    }


    // 필요한 경우 추가적인 서비스 메소드 구현
}

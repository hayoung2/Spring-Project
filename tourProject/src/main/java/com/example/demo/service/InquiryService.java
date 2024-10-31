package com.example.demo.service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.example.demo.model.Inquiry;
import com.example.demo.repository.InquiryCommentRepository;
import com.example.demo.repository.InquiryRepository;

import jakarta.persistence.EntityNotFoundException;

import java.util.List;
import java.util.Optional;

@Service
public class InquiryService {
	private final InquiryRepository inquiryRepository;

    @Autowired
    public InquiryService(InquiryRepository inquiryRepository) {
        this.inquiryRepository = inquiryRepository;
    }
   
    // 모든 문의사항 조회
    public List<Inquiry> findAllInquiries() {
        return inquiryRepository.findAll();
    }
    public Inquiry findById(int inquiryId) {
        Optional<Inquiry> inquiry = inquiryRepository.findById(inquiryId);
        return inquiry.orElse(null); // inquiry 객체가 존재하면 반환, 없으면 null 반환
    }
    
    // ID로 특정 문의사항 조회
    public Optional<Inquiry> findInquiryById(int id) {
        return inquiryRepository.findById(id);
    }

    // 문의사항 저장
    public Inquiry saveInquiry(Inquiry inquiry) {
        return inquiryRepository.save(inquiry);
    }

    // 문의사항 수정
    public void updateInquiry(int id, Inquiry updatedInquiry) {
        // ID로 문의사항 찾기
        Inquiry inquiry = inquiryRepository.findById(id)
            .orElseThrow(() -> new EntityNotFoundException("Inquiry not found"));

        // 필드 업데이트
        inquiry.setTitle(updatedInquiry.getTitle());
        inquiry.setContent(updatedInquiry.getContent());
        // 필요한 경우 기타 필드도 업데이트

        inquiryRepository.save(inquiry);
    }

    // ID로 문의사항 삭제
    public void deleteInquiry(int id) { 
    
        inquiryRepository.deleteById(id);
    }
}

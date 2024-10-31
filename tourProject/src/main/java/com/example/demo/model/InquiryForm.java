package com.example.demo.model;


import org.springframework.web.multipart.MultipartFile;

public class InquiryForm {
    private String userId; // 사용자 ID
    private String title; // 문의 제목
    private String content; // 문의 내용
    private MultipartFile file; // 첨부 파일

    // 기본 생성자
    public InquiryForm() {
    }

    // Getter와 Setter 메서드
    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public MultipartFile getFile() {
        return file;
    }

    public void setFile(MultipartFile file) {
        this.file = file;
    }
}


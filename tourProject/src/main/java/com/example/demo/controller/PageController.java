package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.model.Inquiry;
import com.example.demo.model.User;
import com.example.demo.service.InquiryService;

import jakarta.servlet.http.HttpSession;

@Controller
public class PageController {
	
    @Autowired
    private InquiryService inquiryService;
    
	@GetMapping("/index")
    public String index() {
        return "index";
    }

  @GetMapping("/articlePage")
    public String articlePage() {
        return "articlePage"; 
    }
  
  @GetMapping("/noticePage")
    public String noticePage() {
        return "noticePage"; 
    }
  @GetMapping("/signup")
    public String signup() {
        return "signup"; 
    }
 
  @GetMapping("/login")
    public String login() {
        return "login"; 
   }
  
  
  @GetMapping("/noticeDetail")
  public String noticeDetail() {
      return "noticeDetail"; 
  }
  
  @GetMapping("/createInquiryForm")
  public String createInquiryForm() {
      return "createInquiryForm"; 
  }
  @GetMapping("/inquiryDetail")
  public String inquiryDetail(@RequestParam("inquiryId") int inquiryId, Model model, HttpSession session) {
      // inquiryService를 통해 특정 inquiryId에 해당하는 Inquiry 객체를 조회
      Inquiry inquiry = inquiryService.findById(inquiryId);

      // Model 객체에 조회된 Inquiry 객체 추가
      model.addAttribute("inquiry", inquiry);

      // 로그인한 사용자가 Inquiry 작성자인지 확인하여 Model에 추가 (옵션)
      User loggedInUser = (User) session.getAttribute("loggedInUser");
      model.addAttribute("isOwner", loggedInUser != null && loggedInUser.getUsername().equals(inquiry.getUserId()));

      return "inquiryDetail"; // 해당 JSP 페이지로 이동
  }
  
}

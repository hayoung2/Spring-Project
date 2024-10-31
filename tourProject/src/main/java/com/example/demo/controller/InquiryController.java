package com.example.demo.controller;

import com.example.demo.model.Inquiry;
import com.example.demo.model.InquiryComment;
import com.example.demo.model.InquiryForm;
import com.example.demo.model.User;
import com.example.demo.repository.InquiryRepository;
import com.example.demo.service.InquiryCommentService;
import com.example.demo.service.InquiryService;

import jakarta.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/inquiry")
public class InquiryController {

    @Autowired
    private InquiryRepository inquiryRepository;
    @Autowired
    private InquiryService inquiryService;
    @Autowired
    private InquiryCommentService inquiryCommentService;

    @PostMapping("/submit")
    public String submitInquiry(@ModelAttribute InquiryForm form, RedirectAttributes redirectAttributes,HttpSession session) {
        Inquiry inquiry = new Inquiry();
        User loggedInUser = (User) session.getAttribute("loggedInUser");
        
        inquiry.setUserId(loggedInUser.getUsername());
        inquiry.setTitle(form.getTitle());
        inquiry.setContent(form.getContent());
        inquiry.setCreatedAt(new Date()); // 현재 날짜와 시간 설정

        try {
            MultipartFile file = form.getFile();
            if (file != null && !file.isEmpty()) {
                inquiry.setFileData(file.getBytes());
            }
        } catch (IOException e) {
            // 파일 읽기 실패 처리
            e.printStackTrace();
        }

        inquiryRepository.save(inquiry); // 데이터베이스에 저장

        redirectAttributes.addFlashAttribute("successMessage", "문의가 성공적으로 등록되었습니다.");
        return "redirect:/inquiry/customerServicePage"; // 문의 등록 후 리디렉션
    }
    

    @GetMapping("/customerServicePage")
    public String customerServicePage(Model model) {
        List<Inquiry> inquiries = inquiryService.findAllInquiries();
        model.addAttribute("inquiries", inquiries);
        return "customerServicePage"; // 뷰 이름이 customerServicePage.jsp 일 경우
    }
    
    @GetMapping("/inquiryDetail")
    public String inquiryDetail(@RequestParam("inquiryId") int inquiryId, Model model, HttpSession session) {
        Inquiry inquiry = inquiryService.findById(inquiryId);
        List<InquiryComment> comments = inquiryCommentService.getCommentsByInquiryId(inquiryId);

        
        model.addAttribute("inquiry", inquiry);
        model.addAttribute("comments", comments);
        
        User loggedInUser = (User) session.getAttribute("loggedInUser");
        model.addAttribute("isOwner", loggedInUser != null && loggedInUser.getUsername().equals(inquiry.getUserId()));

        return "inquiryDetail";
    }
    
    @GetMapping("/editInquiry")
    public String editInquiry(@RequestParam("inquiryId") int inquiryId, Model model) {
        Inquiry inquiry = inquiryService.findById(inquiryId);
        model.addAttribute("inquiry", inquiry);
        return "editInquiry"; // 문의사항 수정 페이지의 JSP 파일 이름
    }
    


    // 문의사항 수정 처리
    @PostMapping("/updateInquiry")
    public String updateInquiry(@ModelAttribute Inquiry inquiry) {
        inquiryService.updateInquiry(inquiry.getId(), inquiry);
        return "redirect:/inquiry/customerServicePage";
    }

    // 문의사항 삭제 처리
    @GetMapping("/deleteInquiry")
    public String deleteInquiry(@RequestParam("inquiryId") int inquiryId) {
        inquiryService.deleteInquiry(inquiryId);
        return "redirect:/inquiry/customerServicePage";
    }
    
  
    
    @PostMapping("/submitComment")
    public String submitComment(@RequestParam("inquiryId") int inquiryId,
                                @RequestParam("commentContent") String commentContent,
                                HttpSession session) {
        User loggedInUser = (User) session.getAttribute("loggedInUser");

        InquiryComment comment = new InquiryComment();
        comment.setInquiryId(inquiryId);
        comment.setUserId(loggedInUser.getUsername()); // 현재 로그인된 사용자의 ID
        comment.setContent(commentContent);
        comment.setCreatedAt(LocalDateTime.now()); // 현재 시간

        inquiryCommentService.save(comment);

        return "redirect:/inquiryDetail";
    }

    
}

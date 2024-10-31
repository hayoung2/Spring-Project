package com.example.demo.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.service.CartItemService;
import com.example.demo.service.ProductService;
import com.example.demo.service.PurchaseService;
import com.example.demo.service.UserService;
import com.example.demo.service.WishlistService;

@Controller
public class ProfileController {
	@Autowired
    private UserController userService;
    @Autowired
    private ProductService productService; // 제품 서비스
    @Autowired
    private PurchaseService purchaseService; // 구매 서비스
    @Autowired
    private WishlistService wishlistService; // 위시리스트 서비스
    @Autowired
    private CartItemService cartItemService;
    
    @GetMapping("/profilePage")
    public String profilePage(@RequestParam("userId") String userId, Model model) {
    
    	   // 사용자 정보 로드
        var user = userService.getUserById(userId); // 사용자 정보 조회
      
        var purchases = purchaseService.findByUserId(userId); // 사용자의 구매 내역
        var wishlistItems = wishlistService.findByUserId(userId); // 위시리스트 아이템
        var cartItems = cartItemService.findByUserId(userId); // 장바구니 아이템

        // 모델에 데이터 추가
        model.addAttribute("user", user);
        //model.addAttribute("products", products);
        model.addAttribute("purchases", purchases);
        model.addAttribute("wishlistItems", wishlistItems);
        model.addAttribute("cartItems", cartItems);

 
     

        return "profilePage";
    }
    
}

package com.example.demo.controller;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.concurrent.ExecutorService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.demo.model.CartItem;
import com.example.demo.model.Product;
import com.example.demo.model.PurchaseItem;
import com.example.demo.model.User;
import com.example.demo.model.WishlistItem;
import com.example.demo.service.CartItemService;
import com.example.demo.service.ProductService;
import com.example.demo.service.PurchaseService;
import com.example.demo.service.UserService;
import com.example.demo.service.WishlistService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/users")
public class UserController {

    private final UserService userService;

    @Autowired
    public UserController(UserService userService) {
        this.userService = userService;
    }
    

    @Autowired
    private ProductService productService;
    @Autowired
    private PurchaseService purchaseService;
    @Autowired
    private WishlistService wishlistService;
    @Autowired
    private CartItemService cartItemService;
  
    

    @PostMapping("/register")
    public ModelAndView registerUser(@ModelAttribute User user) {
        userService.saveUser(user);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("redirect:/login"); 
        return modelAndView;
    }
    
    @PostMapping("/update")
    public String updateUser(@ModelAttribute User user, Model model) {

        return "redirect:/index"; // 프로필 페이지나 적절한 페이지로 리다이렉트
    }

    
    
    
    @PostMapping("/delete")
    public String deleteUser(HttpSession session, RedirectAttributes redirectAttributes) {
        User loggedInUser = (User) session.getAttribute("loggedInUser");
        if (loggedInUser != null) {
            userService.deleteUser(loggedInUser.getUsername()); // Assuming there's a deleteUser method in your UserService
            session.invalidate(); // Log the user out by invalidating the session
            redirectAttributes.addFlashAttribute("success", "Your account has been successfully deleted.");
            return "redirect:/login"; // Redirect to the login page
        } else {
            redirectAttributes.addFlashAttribute("error", "No user is currently logged in.");
            return "redirect:/index"; // Redirect to the home page or index page
        }
    }
    
    public User getUserById(String userId) {
        return userService.getUserData(userId);
    }
//    public List<Product> getProductsByUserId(String userId) {
//        return productService.findByUserId(userId);
//    }

    // PurchaseService에서 특정 사용자의 구매 내역 조회
    public List<PurchaseItem> getPurchasesByUserId(String userId) {
        return purchaseService.findByUserId(userId);
    }

    // WishlistService에서 특정 사용자의 위시리스트 아이템 조회
    public List<WishlistItem> getWishlistItemsByUserId(String userId) {
        return wishlistService.findByUserId(userId);
    }

    // CartItemService에서 특정 사용자의 장바구니 아이템 조회
    public List<CartItem> getCartItemsByUserId(String userId) {
        return cartItemService.findByUserId(userId);
    }
    
    
  
}
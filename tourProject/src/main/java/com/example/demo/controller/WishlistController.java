package com.example.demo.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.model.WishlistItem;
import com.example.demo.service.WishlistService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/wishlist")
public class WishlistController {
    @Autowired
    private WishlistService wishlistService;

    @GetMapping("/{userId}")
    public ResponseEntity<List<WishlistItem>> getWishlist(@PathVariable String userId) {
        List<WishlistItem> wishlist = wishlistService.getWishlistForUser(userId);
        return new ResponseEntity<>(wishlist, HttpStatus.OK);
    }
    
    

    @PostMapping("/add")
    public String addToWishlist(@RequestParam("userId") String userId,
                                @RequestParam("productId") int productId,
                                @RequestParam("productName") String productName,
                                @RequestParam("productPrice") int productPrice,
                                @RequestParam("productQuantity") int productQuantity) {
        WishlistItem wishlistItem = new WishlistItem();
        wishlistItem.setUserId(userId);
        wishlistItem.setProductName(productName);
        wishlistItem.setProductPrice(productPrice);
        wishlistItem.setProductQuantity(productQuantity);
        wishlistService.save(wishlistItem);
        return "redirect:/productPage";
    }
}

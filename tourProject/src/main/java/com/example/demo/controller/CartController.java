package com.example.demo.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.model.CartItem;
import com.example.demo.model.User;
import com.example.demo.service.CartItemService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class CartController {
    @Autowired
    private CartItemService cartItemService;
    
    
    @PostMapping("/cart/add")
    public String addToCart(@RequestParam("userId") String userId,
                            @RequestParam("productId") int productId,
                            @RequestParam("productName") String productName,
                            @RequestParam("productPrice") int productPrice,
                            @RequestParam("productQuantity") int productQuantity) {
        CartItem cartItem = new CartItem();
        cartItem.setUserId(userId);
        cartItem.setProductName(productName);
        cartItem.setPrice(productPrice);
        cartItem.setQuantity(productQuantity);
        cartItemService.save(cartItem);
        return "redirect:/productPage";
    }
}

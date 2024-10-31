package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.model.CartItem;
import com.example.demo.model.WishlistItem;
import com.example.demo.repository.WishlistRepository;

@Service
public class WishlistService {
    @Autowired
    private WishlistRepository wishlistRepository;

    public List<WishlistItem> getWishlistForUser(String userId) {
        return wishlistRepository.findByUserId(userId);
    }
    public void save(WishlistItem cartItem) {
    	  wishlistRepository.save(cartItem);
    }
   
    
    public List<WishlistItem> findByUserId(String userId) {
        return wishlistRepository.findByUserId(userId);
    }
}
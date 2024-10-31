package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.model.CartItem;
import com.example.demo.model.User;
import com.example.demo.repository.CartItemRepository;

@Service
public class CartItemService {
	  @Autowired
	    private CartItemRepository cartItemRepository;


	  public void save(CartItem cartItem) {
	        cartItemRepository.save(cartItem);
	    }
	    
	    public List<CartItem> findByUserId(String userId) {
	        return cartItemRepository.findByUserId(userId);
	    }
}

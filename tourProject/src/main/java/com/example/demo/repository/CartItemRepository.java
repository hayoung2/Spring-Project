package com.example.demo.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.demo.model.CartItem;

public interface CartItemRepository extends JpaRepository<CartItem, Integer> {
	List<CartItem> findByUserId(String userId);
}

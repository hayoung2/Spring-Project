package com.example.demo.repository;


import com.example.demo.model.PurchaseItem;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PurchaseRepository extends JpaRepository<PurchaseItem, Integer> {
	 List<PurchaseItem> findByUserId(String userId);
}
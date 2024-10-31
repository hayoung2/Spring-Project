package com.example.demo.service;


import com.example.demo.model.PurchaseItem;
import com.example.demo.repository.PurchaseRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class PurchaseService {
	 @Autowired
	    private PurchaseRepository purchaseRepository;

	    public void savePurchase(PurchaseItem purchaseItem) {
	        purchaseRepository.save(purchaseItem);
	    }
	    
	    public List<PurchaseItem> findByUserId(String userId) {
	        return purchaseRepository.findByUserId(userId);
	    }
}

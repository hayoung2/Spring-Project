package com.example.demo.controller;

import com.example.demo.service.PurchaseService;
import com.example.demo.model.PurchaseItem;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class PurchaseController {

	@Autowired
	private PurchaseService purchaseService;

	@PostMapping("/purchase")
	public String handlePurchase(@ModelAttribute PurchaseItem purchaseItem, RedirectAttributes redirectAttributes) {
		purchaseItem.setPurchaseDate(new Date()); // 현재 날짜 및 시간 설정
		purchaseService.savePurchase(purchaseItem); // 구매 정보 저장

		return "redirect:/productPage"; // 상품 페이지로 리다이렉트
	}
}

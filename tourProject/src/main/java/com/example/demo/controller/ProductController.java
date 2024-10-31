package com.example.demo.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.model.Product;
import com.example.demo.service.ProductService;

@Controller
public class ProductController {
    
    @Autowired
    private ProductService productService;

    @GetMapping("/productPage")
    public String listProducts(Model model) {
        List<Product> products = productService.findAllProducts();
        model.addAttribute("productList", products);
        return "productPage"; 
    }
    
    @GetMapping("/productDetail")
    public String productDetail(@RequestParam("productId") int productId, Model model) {
        Optional<Product> product = productService.findProductById(productId);
        if(product.isPresent()) {
            model.addAttribute("product", product.get());
            return "productDetail"; // 상세 정보를 보여줄 JSP 페이지 이름
        } else {
            // 제품을 찾을 수 없는 경우의 처리 로직
            // 에러 메시지를 설정하거나 에러 페이지로 리다이렉트 할 수 있습니다.
            model.addAttribute("errorMessage", "Product not found");
            return "productNotFound";
        }
    }
}
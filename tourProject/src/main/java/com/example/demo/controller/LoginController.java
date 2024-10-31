package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.demo.model.User;
import com.example.demo.service.AuthenticationService;
import com.example.demo.service.UserService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/users")
public class LoginController {
	  @Autowired
	    private UserService userService;

	  @PostMapping("/login")
	  public String doLogin(@RequestParam("username") String username,
	                        @RequestParam("password") String password,
	                        HttpSession session,
	                        RedirectAttributes redirectAttributes) {
	      User user = userService.loginUser(username, password);
	      if (user != null) {
	          session.setAttribute("loggedInUser", user); 
	          return "redirect:/index";
	      } else {
	          redirectAttributes.addFlashAttribute("error", "Invalid username or password");
	          return "redirect:/login"; // Redirect back to the login page on failure
	      }
	  }
	    

	    @PostMapping("/logout")
	    public String doLogout(HttpSession session) {
	        session.invalidate(); 
	        return "redirect:/login";
	    }
}

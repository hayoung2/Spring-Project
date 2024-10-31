package com.example.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.model.User;
import com.example.demo.repository.UserRepository;

import jakarta.servlet.http.HttpSession;

@Service
public class UserService {

    private final UserRepository userRepository;

    @Autowired
    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    public User saveUser(User user) {
        return userRepository.save(user); 
    }
    
    public User loginUser(String username, String password) {
        User user = userRepository.findByUsername(username);
        if (user != null && user.getPassword().equals(password)) {
            return user; // Return the User object for successful authentication
        }
        return null; // Return null if authentication fails
    }
    
    public void logoutUser(HttpSession session) {
        session.removeAttribute("loggedInUser"); // 세션에서 로그인한 사용자 정보 삭제
        session.invalidate(); // 세션을 무효화합니다
    }

    public void deleteUser(String userId) {
    	 userRepository.deleteById(userId); 
    }


    public User getUserData(String userId) {
    
        return userRepository.findById(userId).orElse(null);
    }
}
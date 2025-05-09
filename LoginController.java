package com.university.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class LoginController {
    
    @GetMapping("/login")
    public String showLoginForm() {
        return "login";
    }
    
    @PostMapping("/login")
    public String processLogin(
            @RequestParam String email,
            @RequestParam String password,
            Model model) {
        
        // Add your authentication logic here
        // For now, we'll just redirect if email is not empty
        if(email != null && !email.isEmpty()) {
            return "redirect:/courses";
        } else {
            model.addAttribute("error", "Invalid credentials");
            return "login";
        }
    }
}
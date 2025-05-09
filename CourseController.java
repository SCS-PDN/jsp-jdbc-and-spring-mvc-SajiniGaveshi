package com.university.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Map;

@Controller
public class CourseController {
    
    @Autowired
    private JdbcTemplate jdbcTemplate;
    
    @GetMapping("/courses")
    public String showCourses(Model model) {
        List<Map<String, Object>> courses = jdbcTemplate.queryForList("SELECT * FROM courses");
        model.addAttribute("courses", courses);
        return "courses";
    }
    
    @PostMapping("/register/{courseId}")
    public String registerCourse(@RequestParam Long courseId, Model model) {
        // In a real app, you'd get the logged-in student's ID from session
        Long studentId = 1L; // Hardcoded for example
        
        jdbcTemplate.update(
            "INSERT INTO registrations (student_id, course_id, date) VALUES (?, ?, NOW())",
            studentId, courseId);
        
        return "redirect:/success";
    }
}
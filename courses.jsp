<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Available Courses</title>
</head>
<body>
    <h2>Available Courses</h2>
    
    <table border="1">
        <tr>
            <th>Course ID</th>
            <th>Name</th>
            <th>Instructor</th>
            <th>Credits</th>
            <th>Action</th>
        </tr>
        <c:forEach items="${courses}" var="course">
            <tr>
                <td>${course.course_id}</td>
                <td>${course.name}</td>
                <td>${course.instructor}</td>
                <td>${course.credits}</td>
                <td>
                    <form action="/register/${course.course_id}" method="post">
                        <button type="submit">Register</button>
                    </form>
                </td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
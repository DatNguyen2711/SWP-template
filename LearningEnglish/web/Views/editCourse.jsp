<%-- 
    Document   : createCourse
    Created on : Feb 6, 2023, 11:47:32 AM
    Author     : 84877
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <style>
        div{
            margin: 30px 10px; 
        }
    </style>
    <body>
        <form action="/LearningEnglish/teacher/editCourse" method="post">
            <div>
                ID: <input type="text" name="courseId" readonly="" value="${course.courseId}"/>
            </div>
            <div>
                Name Course: <input type="text" name="nameCourse" value="${course.nameCourse}"/> 
            </div>
            <div>
                Title: <input type="text" name="title" value="${course.title}"/> 
            </div>
            <div>
                Price: <input type="number" min="0" name="price" maxlength="9" value="${course.price}"/> 
            </div>
            <div>
                Description:
            </div>
                <textarea name="description" cols="40" rows="10">${course.description}</textarea>          
            <div>
                Category: 
                <select name="categoryId">
                    <c:forEach items="${category}" var="c">
                        <option value="${c.categoryId}" ${c.categoryId==course.categoryId? "selected" : "" }>${c.categoryName}</option>
                    </c:forEach>
                </select>
                
            </div>
                <button type="submit">Edit</button>    
        </form>
    </body>
</html>

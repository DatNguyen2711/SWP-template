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
        <form action="/LearningEnglish/teacher/createCourse" method="post">
            <div>
                Name Course: <input type="text" name="nameCourse"/> 
            </div>
            <div>
                Title: <input type="text" name="title"/> 
            </div>
            <div>
                Price: <input type="number" min="0" maxlength="9" name="price"/> 
            </div>
            <div>
                Description:
            </div>
                <textarea name="description" cols="40" rows="10"></textarea>          
            <div>
                Category: 
                <select name="categoryId">
                    <c:forEach items="${category}" var="c">
                        <option value="${c.categoryId}">${c.categoryName}</option>
                    </c:forEach>
                </select>
            </div>
                <button type="submit">Add</button>    
        </form>
    </body>
</html>

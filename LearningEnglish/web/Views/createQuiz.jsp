<%-- 
    Document   : createQuiz
    Created on : Feb 8, 2023, 11:31:48 AM
    Author     : 84877
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
    <form method="post" action="/LearningEnglish/teacher/createQuiz" enctype="multipart/form-data">
        Type of quiz: <select name="type">
                <option value="multiple choice" selected="">multiple choice</option>
                <option value="listen">Listen</option>
                <option value="reading">Reading</option>
                <option value="Writing">Writing</option>
            </select>
        Name: <input type="text" name="nameQuiz"/><br>  
        Duration: <input type="number" name="duration"/><br>
        File excel: <input type="file" name="file" />
        <input type="submit" value="Upload" />
    </form>
    </body>
</html>

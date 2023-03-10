<%-- 
    Document   : uploadQuiz
    Created on : Feb 5, 2023, 9:58:03 AM
    Author     : 84877
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html> 
<html> 
    <head> 
        <title> Java File Upload </title> 
    </head> 
    <body>
        <form method="post" action="uploadExcelFile" enctype="multipart/form-data">
            <select name="type">
                <option value="multiple choice" selected="">multiple choice</option>
                <option value="listen">Listen</option>
                <option value="reading">Reading</option>
                <option value="Writing">Writing</option>
            </select>  
            <input type="text" name="name"/><br>
            <input type="file" name="file" />
            <input type="submit" value="Upload" />
        </form>
    </body>
</html>
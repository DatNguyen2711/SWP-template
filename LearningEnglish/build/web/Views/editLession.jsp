<%-- 
    Document   : editLession
    Created on : Feb 8, 2023, 8:56:52 AM
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
        <form method="post" action="/LearningEnglish/teacher/editLession" enctype="multipart/form-data">
            <input name="lessionId" value="${lession.lessionId}" readonly=""/><br>
            <input type="text" name="nameLession" value="${lession.nameLession}"/><br>  
            <input type="number" name="stt" value="${lession.stt}"/><br>
            <input type="file" name="file"/>
            <input type="submit" value="Upload" />
        </form>
    </body>
</html>

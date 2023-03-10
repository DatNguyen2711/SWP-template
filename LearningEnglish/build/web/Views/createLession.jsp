<%-- 
    Document   : createLession
    Created on : Feb 7, 2023, 9:03:02 PM
    Author     : 84877
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html> 
<html> 
<head> 
<title> Create Lession </title> 
</head> 
<body>

  <form method="post" action="/LearningEnglish/teacher/createLession" enctype="multipart/form-data">
      <input type="text" name="nameLession"/><br>  
      <input type="number" name="stt"/><br>
    <input type="file" name="file" />
    <input type="submit" value="Upload" />
  </form>

</body>
</html>

<%-- 
    Document   : manageCourse
    Created on : Feb 6, 2023, 11:55:01 AM
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
:root {
  --primColor: #dcdcdc;
  --secoColor: #555555;
  --cornerRad: 4px;
}
body {
  background-color: var(--primColor);
  font-family: Arial, Helvetica, sans-serif;
  font-size: 20px;
}
details {
  margin: 70px;
}
summary {
  writing-mode: vertical-lr;
  text-align: center;
  padding: 12px 10px;
  width: 23px;
  height: 17px;
  background-color: var(--primColor);
  border: 2px solid var(--secoColor);
  border-radius: var(--cornerRad);
  color: var(--secoColor);
  cursor: pointer;
  user-select: none;
  outline: none;
  transition: transform 200ms ease-in-out 0s;
}
summary::before,
summary::after {
  position: static;
  top: 0;
  left: 0;
}
summary::before {
  content: "";
}
summary::after {
  content: "III";
  letter-spacing: -1px;
}
summary:hover {
  transform: scale(1.1);
}
summary::marker {
  font-size: 0;
}
summary::-webkit-details-marker {
  display: none;
}
details[open] .menu {
  animation-name: menuAnim;
}
details[open] summary::before {
  content: "X";
}
details[open] summary::after {
  content: "";
}
.menu {
  height: 0;
  width: fit-content;
  border-radius: var(--cornerRad);
  background-color: var(--primColor);
  box-shadow: 0 4px 12px 0 rgba(0, 0, 0, 0.2);
  margin-top: 8px;
  display: flex;
  flex-direction: column;
  justify-content: space-between;
  overflow: hidden;
  animation: closeMenu 300ms ease-in-out forwards;
}
.menu a {
  padding: 12px 24px;
  margin: 0 16px;
  color: var(--secoColor);
  border-bottom: 2px solid rgba(0, 0, 0, 0.1);
  text-decoration: none;
  text-align: center;
  transition: filter 200ms linear 0s;
  cursor: pointer;
}
.menu a:nth-of-type(1) {
  padding-top: 24px;
}
.menu a:nth-last-of-type(1) {
  border-bottom: none;
}
.menu a:hover {
  filter: brightness(200%);
}
details::before {
  content: "← Let's study";
  color: var(--secoColor);
  position: absolute;
  margin-left: 80px;
  padding: 10px 10px;
  opacity: 0.4;
}
details[open]::before {
  animation: fadeMe 300ms linear forwards;
}
@keyframes menuAnim {
  0% {
    height: 0;
  }
  100% {
    height: 312px;
  }
}
@keyframes fadeMe {
  0% {
    opacity: 0.4;
  }
  100% {
    opacity: 0;
  }
}
#lession{
    position: absolute;
    top: 110px;
    left: 500px;
}
    </style>
    <body>
        <div><a href="/LearningEnglish/home">Home</a></div>

        <details>
            <summary></summary>
            <nav class="menu">
                <c:forEach items="${lession}" var="l">
                  <a onclick="showVideo(${l.lessionId},'${l.nameLession}','${l.path}')">${l.nameLession}</a>      
                </c:forEach>
            </nav>
        </details>
        <div id="lession">
            
        </div>
        
        
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
        <script>
            function showVideo(id,name, path){
                document.getElementById("lession").innerHTML = "<h3>"+name+"</h3><video width=\"600\" height=\"400\" controls>\n" +
"            <source src=\""+path+"\" type=\"video/mp4\">\n" +
"            Your browser does not support the video tag.\n" +
"        </video>";

                $.ajax({
                        type: "get",
                        url: "/LearningEnglish/load",
                        data: {
                            id:id
                        },
                        success: function(data) {
                            document.getElementById("lession").innerHTML += data;
                        }
                        });
            }
        </script>
    </body>
</html>

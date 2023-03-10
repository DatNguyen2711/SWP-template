
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html>
    <head>
        <title>Score</title>
    </head>
<style>
    .button {
        background-color: #4CAF50;
        border: none;
        color: white;
        padding: 15px 32px;
        text-align: center;
        text-decoration: none;
        display: inline-block;
        font-size: 16px;
        margin: 4px 2px;
        cursor: pointer;
        border-radius: 5px;
    }
    table {
  font-family: Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 300px;
}

table td, table th {
  border: 1px solid #ddd;
  padding: 8px;
}

table tr:nth-child(even){background-color: #f2f2f2;}

table tr:hover {background-color: #ddd;}

table th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  background-color: #04AA6D;
  color: white;
}
</style>
    <body>
        <form action="/LearningEnglish/student/quiz" method="post">
            <button class="button"> Doing Quiz</button>
        </form>
        <table>
            <thead>
                <th>Time</th>
                <th>Score</th>
            </thead>
            <tbody>
                <c:forEach items="${score}" var="s">
                    <tr>
                        <td>${s.time}</td>
                        <td>${s.score}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </body>
</html>
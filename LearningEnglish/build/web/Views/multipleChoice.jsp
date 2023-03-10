
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Multiple Choice Quiz</title>
    </head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"/>
    <style>
*{
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body{
    background-color: #333;
}
.container{
    background-color: #555;
    color: #ddd;
    border-radius: 10px;
    padding: 20px;
    font-family: 'Montserrat', sans-serif;
    max-width: 700px;
}
.container > p{
    font-size: 32px;
}
.question{
    width: 75%;
}
.options{
    position: relative;
    padding-left: 40px;
}
#options label{
    display: block;
    margin-bottom: 15px;
    font-size: 14px;
    cursor: pointer;
}
.options input{
    opacity: 0;
}
.checkmark {
    position: absolute;
    top: -1px;
    left: 0;
    height: 25px;
    width: 25px;
    background-color: #555;
    border: 1px solid #ddd;
    border-radius: 50%;
}
.options input:checked ~ .checkmark:after {
    display: block;
}
.options .checkmark:after{
    content: "";
	width: 10px;
    height: 10px;
    display: block;
	background: white;
    position: absolute;
    top: 50%;
	left: 50%;
    border-radius: 50%;
    transform: translate(-50%,-50%) scale(0);
    transition: 300ms ease-in-out 0s;
}
.options input[type="radio"]:checked ~ .checkmark{
    background: #21bf73;
    transition: 300ms ease-in-out 0s;
}
.options input[type="radio"]:checked ~ .checkmark:after{
    transform: translate(-50%,-50%) scale(1);
}
.btn-primary{
    background-color: #555;
    color: #ddd;
    border: 1px solid #ddd;
}
.btn-primary:hover{
    background-color: #21bf73;
    border: 1px solid #21bf73;
}
.btn-success{
    padding: 5px 25px;
    background-color: #21bf73;
}
@media(max-width:576px){
    .question{
        width: 100%;
        word-spacing: 2px;
    } 
}
    </style>
    <body>
        <div class="container mt-sm-5 my-1">
            <c:forEach items="${mul}" var="q">
                <div class="question ml-sm-5 pl-sm-5 pt-2">
                    <div class="py-2 h5"><b>${q.questionId}. ${q.question}</b></div>
                    <c:forEach items="${q.answer}" var="a">
                        <div class="ml-md-3 ml-sm-3 pl-md-5 pt-sm-0 pt-3" id="options">
                            <label class="options">${a}
                                <input type="radio" name="ans" value="${a}">
                                <span class="checkmark"></span>
                            </label>
                        </div>
                    </c:forEach>
                </div>
            </c:forEach>
            <div class="d-flex align-items-center pt-3">
                <div id="prev">
                    <button class="btn btn-primary">Previous</button>
                </div>
                <div class="ml-auto mr-sm-5">
                    <button class="btn btn-success">Next</button>
                </div>
            </div>
        </div>
    </body>
</html>

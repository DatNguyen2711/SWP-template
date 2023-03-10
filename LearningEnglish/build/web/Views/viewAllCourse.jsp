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
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
    </head>
    <style>
        body{
            background:#eee
        }
        .ratings i{
            font-size: 16px;
            color: red
        }
        .strike-text{
            color: red;
            text-decoration: line-through
        }
        .product-image{
            width: 100%
        }
        .dot{
            height: 7px;
            width: 7px;
            margin-left: 6px;
            margin-right: 6px;
            margin-top: 3px;
            background-color: blue;
            border-radius: 50%;
            display: inline-block
        }
        .spec-1{
            color: #938787;
            font-size: 15px
        }
        h5{
            font-weight: 400
        }
        .para{
            font-size: 16px
        }
        .btn{
            margin-top: 30px;
        }
    </style>
    <body>
        <div class="container mt-5 mb-5">
    <div class="d-flex justify-content-center row">
        <div class="col-md-10">
            <c:forEach items="${course}" var="c">
                <div class="row p-2 bg-white border rounded mt-2">
                    <div class="col-md-3 mt-1"><img class="img-fluid img-responsive rounded product-image" src="${c.image}"></div>
                    <div class="col-md-6 mt-1">
                        <h5>${c.nameCourse}</h5>
                        <div class="d-flex flex-row">
                            <div class="ratings mr-2"><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i></div><span>110</span>
                        </div>
                        <div class="mt-1 mb-1 spec-1"><span>100% cotton</span><span class="dot"></span><span>Light weight</span><span class="dot"></span><span>Best finish<br></span></div>
                        <div class="mt-1 mb-1 spec-1"><span>Unique design</span><span class="dot"></span><span>For men</span><span class="dot"></span><span>Casual<br></span></div>
                        <p class="text-justify text-truncate para mb-0">${c.description}<br><br></p>
                    </div>
                    <div class="align-items-center align-content-center col-md-3 border-left mt-1">
<!--                        <div class="d-flex flex-row align-items-center">
                            <h4 class="mr-1">$15.99</h4><span class="strike-text">$21.99</span>
                        </div>
                        <h6 class="text-success">Free shipping</h6>-->
                        <div class="d-flex flex-column mt-4">
                            <button class="btn btn-primary btn-sm" type="button">
                                <a style="color: white; text-decoration: none;" href="/LearningEnglish/student/lession?courseId=${c.courseId}">Go to lessions</a>
                            </button>
                            <!--<button class="btn btn-outline-primary btn-sm mt-2" type="button">Add to wishlist</button>-->
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</div>
    </body>
</html>

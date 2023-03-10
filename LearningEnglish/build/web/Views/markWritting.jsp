
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
            margin: 20px 30px;
        }
        .writting{
            border: 1px solid gray;
            border-radius: 10px;
            padding: 10px 30px;
        }
        button{
            width: 70px;
            padding: 5px 10px;
            border: none;
            background-color: #01BAFD;
            border-radius: 5px;
            box-shadow: 0px 0px 5px #555;
        }
        button:hover{
            box-shadow: 0px 0px 5px #01BAFD;
        }
        #name{
            width: 400px;
            height: 40px;
            padding-top: 20px;
            padding-left: 20px;
            border-radius: 5px;
            box-shadow: 0px 0px 5px #555;
        }
        #name:hover{
            box-shadow: 0px 0px 5px #01BAFD;
        }
        input[type=number]{
            width: 70px;
            height: 25px;
            border-radius: 5px;
        }
    </style>
    <body>
        <a href="/LearningEnglish/home">Home</a>
        <c:forEach items="${write}" var="w">
            <c:forEach items="${listAcc}" var="a">
                <div>
                    <c:if test="${w.username==a.username}">
                        <p id="name">${a.fullname} | ${w.date} 
                            <button onclick="View('${a.username}', this)">View</button>
                        <p>
                        <div class="writting" style="display: none" id="${a.username}">
                            <div>
                                <input placeholder="mark..." type="number" value="${score.getScore(w.quizId, a.username) == -1 ? "" : score.getScore(w.quizId, a.username)}"/>
                                <button onclick="SaveScore('${a.username}', ${w.quizId})">Save</button>
                                <span></span>
                            </div>
                            ${w.content}
                        </div>
                    </c:if>
                </div>
            </c:forEach>
        </c:forEach>
        
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
        <script>
            function View(a, t){
                var x = document.getElementById(a);
                if(x.style.display === "none"){
                    x.style.display = "block";
                    t.innerHTML = "Hide";
                }else{
                    t.innerHTML = "View";
                    x.style.display = "none";
                }
            }
            
            function SaveScore(username, id){
                var x = document.getElementById(username);
                var score = x.getElementsByTagName("input")[0].value;
                if(score < 0 || score > 10){
                    alert("please input score from 0 to 10");
                }else{
                    var content = username+"///"+id+"///"+score;
                    $.ajax({
                        type: "POST",
                        url: "/LearningEnglish/teacher/markWritting",
                        data: {
                            content:content
                        },
                        success: function(data) {
                            x.getElementsByTagName("span")[0].innerHTML = data;
                        }
                    });
                }
            }
        </script>
    </body>
</html>

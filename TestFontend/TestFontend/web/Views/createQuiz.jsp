<%-- 
    Document   : createQuiz
    Created on : Feb 1, 2023, 8:12:24 PM
    Author     : 84877
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <style>
        .question{
            width: 450px;
            border: 1px solid gray;
            border-radius: 10px;
            box-shadow: 0px 0px 5px #2196F3;
            margin-bottom: 10px;
        }
        .question input{
            margin: 10px 10px;
            width: 300px;
            height: 60px;
        }
        .answer input{
            width: 150px;
            height: 40px;
        }
        .add{
            margin: 20px 20px;
            font-size: 30px;
        }
        .add1{
            margin: 10px 20px;
        }
        .checkbox{
            width: 15px !important;
            height: 15px !important;
        }
    </style>
    <body>
        <form action="/TestFontend/load" method="post">
        <div id="quiz">
            <div id="question" class="question">
                <div class="content-question">
                    <input name="question" placeholder="question..." type="text"/>
                </div>
                <div id="all">
                    
                    <div id="content-answer">
                        <div id="answer1" class="answer">
                            <a class="add1" onclick="loadMoreAns(this)">+</a>
                            <input type="text" name="answer"/> 
                            <input name="correctAns" class="checkbox" value="1" type="checkbox"/>
                            <!--<div id="answer1"></div>-->
                        </div>
                    </div>
                </div>
            </div>
            <div id="question1"></div>
        </div>
        <a onclick="loadMore()" class="add">+</a>
        <button type="submit" onclick="GetNum()" >Submit</button>
        <input name="number" hidden id="num"/>
        </form>
        <p>${ss}</p>
        <!--<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>-->
        <script>
            
            function GetNum(){
                var pa = document.getElementsByClassName("question");
                var qq = pa.length;
                var c = 0;
                var ee = "";
                for(let i = 0; i < qq; i++){
                    var el = pa[i].getElementsByTagName("input"); 
                    c = (el.length-1)/2;
                    if(i < qq-1)
                        ee += c+", ";
                    else
                        ee += c+"";
                }
                document.getElementById("num").value = ee;
            }
            
            let count = 1;
            let ans = 1;
            let correct = 1;
            function loadMore(){    
                let s = "question"+count;
                var a = document.getElementById(s);
                count++;
                ans++;
                correct = 1;
                a.innerHTML = "<div id=\"question\" class=\"question\">\n" +
"                <div class=\"content-question\">\n" +
"                    <input name=\"question\" placeholder=\"question...\" type=\"text\"/>\n" +
"                </div>\n" +
"                <div id=\"all\">\n" +
"                    \n" +
"                    <div id=\"content-answer\">\n" +
"                        <div id=\"answer"+ans+"\" class=\"answer\">\n" +
"                            <a class=\"add1\" onclick=\"loadMoreAns(this)\">+</a>\n" +
"                            <input type=\"text\" name=\"answer\"/> \n" +
"                            <input name=\"correctAns\" class=\"checkbox\" value=\"1\" type=\"checkbox\"/>\n" +
"                            <!--<div id=\"answer1\"></div>-->\n" +
"                        </div>\n" +
"                    </div>\n" +
"                </div>\n" +
"            </div>\n" +
"            <div id=\"question"+count+"\"></div>";
            }
            function loadMoreAns(){   
                correct++;
                let an = "answer"+ans;
                const node = document.createElement("input");
                document.getElementById(an).appendChild(node);
                document.getElementById(an).lastChild.setAttribute("name", "answer");
                const node1 = document.createElement("input");
                document.getElementById(an).appendChild(node1);
                document.getElementById(an).lastChild.setAttribute("name", "correctAns");
                document.getElementById(an).lastChild.setAttribute("type", "checkbox");
                document.getElementById(an).lastChild.setAttribute("class", "checkbox");
                document.getElementById(an).lastChild.value = correct;
//                let an = "answer"+ans;
//                var x = document.getElementById(an);
//                an++;
////                var a = s.parentElement;
////                var b = a.firstElementChild;
//                x.innerHTML += "<div id=\"content-answer\">\n" +
//"                    <div id=\"answer\" class=\"answer\">\n" +
//"                        <input type=\"text\" name=\"answer\"/>\n" +
//"                    </div>\n" +
//"                </div>\n" +
//"                <div id=\"answer"+an+"\"></div>";
            }
        </script>
    </body>
</html>

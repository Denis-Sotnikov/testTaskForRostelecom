<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.Collection" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="org.json.JSONArray" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
          integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
            integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
            integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
            integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <title>Цвета</title>
</head>
<body>
<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<div class="container pt-3">
    <div class="card" style="width: 100%">
        <div class="card-header" style="text-align: right">
            <p id="input" class="card-body"></p>
        </div>
        <div class="card-body">
            <table class="table" id="tableColors">
                <p>Цвета</p>
                <tbody>
                <c:forEach items="${posts}" var="post">
                    <tr>
                        <td style="width: 50%">
                            <c:out value="${post.key}"/>
                        <td class="td"  id="<c:out value="${post.key}"/>">
                            <c:out value="${post.value}"/>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <script>
                var list = ['',
                    <c:forEach items="${posts}" var="post">
                    '<c:out value="${post.value}"/>',
                    </c:forEach>
                ];
                var tdr = document.querySelectorAll("tr");
                var tds = document.querySelectorAll("td");
                for (var i=1;i<tds.length;i+=2) {
                    tds[i].addEventListener("click", colors);
                    function colors(){
                        tdr[this.id-1].style.backgroundColor = list[this.id];
                        document.getElementById("input").textContent = this.id + ", " + list[this.id];
                    }
                }
            </script>
        </div>
    </div>
</div>
</div>
</body>
</html>

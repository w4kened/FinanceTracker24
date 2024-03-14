<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>User Account</title>
        <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
        <link href="${contextPath}/resources/css/common.css" rel="stylesheet">
        <style type="text/css">
            .background-pattern {
                background-image: url("data:image/svg+xml,%3Csvg width='6' height='6' viewBox='0 0 6 6' xmlns='http://www.w3.org/2000/svg'%3E%3Cg fill='%23337ab7' fill-opacity='0.4' fill-rule='evenodd'%3E%3Cpath d='M5 0h1L0 6V5zM6 5v1H5z'/%3E%3C/g%3E%3C/svg%3E");
            }
            .custom-signin {
                margin: 150 auto;
                -webkit-box-shadow: 0px 0px 6px 0px rgba(198, 70, 0, 0.8);
                box-shadow: 0px 0px 6px 0px rgba(198, 70, 0, 0.8);
                background-color: #eee;
            }
            .form-logo {
                width: 10rem;
                height: 10rem;
                filter: invert(50%) sepia(13%) saturate(3207%) hue-rotate(180deg) brightness(90%) contrast(80%);

            }
            .form-title, .form-logo {
                display: block;
                margin-left: auto;
                margin-right: auto;
                text-align: center;
            }
            .container {
                display: grid;
                grid-template-columns: 2fr 1fr;
                grid-template-rows: 1fr 1fr;
                gap: 20px;
                width: 130rem;
            }
            .sec2,.sec3,.sec4,.subsec1, .subsec2 {
                background-color: #eee;
                -webkit-box-shadow: 0px 0px 6px 0px rgba(198, 70, 0, 0.8);
                box-shadow: 0px 0px 6px 0px rgba(198, 70, 0, 0.8);
                background-color: #eee;
                border-radius: 3px;
            }
            .sec1 {
                grid-area: 1 / 1 / 2 / 2;
                display: grid;
                grid-template-columns: 1fr 1fr;
                grid-template-rows: 1fr;
                gap: 20px;
            }
            .sec2 {
              grid-area: 1 / 2 / 2 / 3;
            }
            .sec3 {
              grid-area: 2 / 1 / 3 / 2;
            }
            .sec4 {
              grid-area: 2 / 2 / 3 / 3;
            }
            .subsec1 {
              grid-area: 1 / 1 / 2 / 2;
            }
            .subsec2 {
              grid-area: 1 / 2 / 2 / 3;
            }
            .header {
                display: flex;
                flex-direction: row;
                flex-wrap: nowrap;
                justify-content: center;
                align-items: center;
                align-content: center;
                gap: 111rem;
            }

        </style>
    </head>
    <body  class="background-pattern">



                                <div class="header" style="display: flex;">                   
                <h3 >Dashboard</h3>
                <p><a href="${contextPath}/logout">logout</a></p>
                </div> 
        <div class="container">


            <div class="sec1">
                <div class="subsec1">
                    <p class="fs-5">Account Balance:</p>
                </div>
                <div class="subsec2">Spendings</div>
            </div>
            <div class="sec2">Revenue</div>
            <div class="sec3">tyr</div>
            <div class="sec4">tyr</div>
        </div>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
        <script src="${contextPath}/resources/js/bootstrap.min.js"></script>
    </body>
</html>

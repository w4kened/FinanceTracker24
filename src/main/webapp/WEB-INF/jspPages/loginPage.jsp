<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Create an account</title>
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
                border-radius: 3px;
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
        </style>
    </head>
    <body  class="background-pattern">
        <div class="container">
            <form method="POST" action="${contextPath}/login" class="form-signin custom-signin">
                <img alt="logo" src="${contextPath}/resources/images/money-bar-chart.svg"
                class="form-logo">
                <h2 class="form-heading form-title" >Finance Tracker 24</h2>

                <div class="form-group ${error != null ? 'has-error' : ''}">
                    <span>${message}</span>
                    <input name="username" type="text" class="form-control" placeholder="Username"
                           autofocus="true"/>
                    <input name="password" type="password" class="form-control" placeholder="Password"/>
                    <span>${error}</span>
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

                    <button class="btn btn-lg btn-primary btn-block" type="submit">Log In</button>
                    <h4 class="text-center"><a href="${contextPath}/registration">Create an account</a></h4>
                </div>
            </form>
        </div>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
        <script src="${contextPath}/resources/js/bootstrap.min.js"></script>
    </body>
</html>

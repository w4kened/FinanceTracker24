<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>


<!DOCTYPE html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>User Account</title>
        <%-- <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet"> --%>
        <%-- <link href="${contextPath}/resources/css/common.css" rel="stylesheet"> --%>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
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
                width: 7em;
                filter: invert(50%) sepia(13%) saturate(3207%) hue-rotate(180deg) brightness(90%) contrast(80%);
                margin: 1rem !important;
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
                grid-template-rows: 1fr;
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
                display: flex;
            }
            .sec3 {
                grid-area: 2 / 1 / 3 / 2;
                height: 40em;
                overflow-y: auto;
            }
            .sec4 {
              grid-area: 2 / 2 / 3 / 3;
                height: 15em;
            }
            .subsec1 {
                grid-area: 1 / 1 / 2 / 2;
                display: flex;
            }
            .subsec2 {
                grid-area: 1 / 2 / 2 / 3;
                display: flex;

            }
            .header {
                display: flex;
                flex-direction: row;
                flex-wrap: nowrap;
                justify-content: center;
                align-items: center;
                align-content: center;
                gap: 59%;
            }
            .btns-vertical {
                display: grid;
                gap: 1rem;
                padding: 1rem;
            }
            #exchangeForm {
                display: flex;
                margin: 1em;
                gap: 1em;
                width: 100%;
            }
        </style>
    </head>
    <body  class="background-pattern">

        <div class="header" style="display: flex;">                   
            <a href="${contextPath}/home"><p class="fs-4">Dashboard</p></a>
            <p class="fs-6"><a href="${contextPath}/logout">Logout</a></p>
        </div> 
        <div class="container">

            <div class="sec1">
                <div class="subsec1">
                    <img alt="logo" src="${contextPath}/resources/images/money-bar-chart.svg" 
                    class="form-logo">
                    <p class="fs-6" style="flex:1;margin:auto;">Account Balance:</p>
                    <p class="fs-6" style="flex:1;margin:auto;">${user.balance} </p>
                    <p class="fs-6" style="flex:1;margin:auto;"> ${user.currency}</p>
                </div>
                <div class="subsec2">
                    <%-- <p class="fs-6" style="flex:1;margin:auto;">Spendings:</p> --%>
                    <div id="chartContainer" style="height: 200px; width: 100%;"></div>
                </div>

            </div>
            <div class="sec2"><p class="fs-6" style="flex:1;margin:auto;">
                <div id="chartContainer2" style="height: 200px; width: 100%;"></div>
            </p></div>
            <div class="sec3">
                <table id="transactionTable" class="table table-striped table-bordered">
      
                </table>
            </div>
            <div class="sec4" >
                <div class="btns-vertical">
                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#depositModal">

                        <p class="fs-5" style="flex:1;margin:auto;width:300;">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-database-add" viewBox="0 0 16 16">
                          <path d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7m.5-5v1h1a.5.5 0 0 1 0 1h-1v1a.5.5 0 0 1-1 0v-1h-1a.5.5 0 0 1 0-1h1v-1a.5.5 0 0 1 1 0"/>
                          <path d="M12.096 6.223A5 5 0 0 0 13 5.698V7c0 .289-.213.654-.753 1.007a4.5 4.5 0 0 1 1.753.25V4c0-1.007-.875-1.755-1.904-2.223C11.022 1.289 9.573 1 8 1s-3.022.289-4.096.777C2.875 2.245 2 2.993 2 4v9c0 1.007.875 1.755 1.904 2.223C4.978 15.71 6.427 16 8 16c.536 0 1.058-.034 1.555-.097a4.5 4.5 0 0 1-.813-.927Q8.378 15 8 15c-1.464 0-2.766-.27-3.682-.687C3.356 13.875 3 13.373 3 13v-1.302c.271.202.58.378.904.525C4.978 12.71 6.427 13 8 13h.027a4.6 4.6 0 0 1 0-1H8c-1.464 0-2.766-.27-3.682-.687C3.356 10.875 3 10.373 3 10V8.698c.271.202.58.378.904.525C4.978 9.71 6.427 10 8 10q.393 0 .774-.024a4.5 4.5 0 0 1 1.102-1.132C9.298 8.944 8.666 9 8 9c-1.464 0-2.766-.27-3.682-.687C3.356 7.875 3 7.373 3 7V5.698c.271.202.58.378.904.525C4.978 6.711 6.427 7 8 7s3.022-.289 4.096-.777M3 4c0-.374.356-.875 1.318-1.313C5.234 2.271 6.536 2 8 2s2.766.27 3.682.687C12.644 3.125 13 3.627 13 4c0 .374-.356.875-1.318 1.313C10.766 5.729 9.464 6 8 6s-2.766-.27-3.682-.687C3.356 4.875 3 4.373 3 4"/>
                        </svg>
                        Deposit
                        </p>
                    </button>


                    <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#withdrawModal">
                    <p class="fs-5" style="flex:1;margin:auto;width:300;">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-database-dash" viewBox="0 0 16 16">
                          <path d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7M11 12h3a.5.5 0 0 1 0 1h-3a.5.5 0 0 1 0-1"/>
                          <path d="M12.096 6.223A5 5 0 0 0 13 5.698V7c0 .289-.213.654-.753 1.007a4.5 4.5 0 0 1 1.753.25V4c0-1.007-.875-1.755-1.904-2.223C11.022 1.289 9.573 1 8 1s-3.022.289-4.096.777C2.875 2.245 2 2.993 2 4v9c0 1.007.875 1.755 1.904 2.223C4.978 15.71 6.427 16 8 16c.536 0 1.058-.034 1.555-.097a4.5 4.5 0 0 1-.813-.927Q8.378 15 8 15c-1.464 0-2.766-.27-3.682-.687C3.356 13.875 3 13.373 3 13v-1.302c.271.202.58.378.904.525C4.978 12.71 6.427 13 8 13h.027a4.6 4.6 0 0 1 0-1H8c-1.464 0-2.766-.27-3.682-.687C3.356 10.875 3 10.373 3 10V8.698c.271.202.58.378.904.525C4.978 9.71 6.427 10 8 10q.393 0 .774-.024a4.5 4.5 0 0 1 1.102-1.132C9.298 8.944 8.666 9 8 9c-1.464 0-2.766-.27-3.682-.687C3.356 7.875 3 7.373 3 7V5.698c.271.202.58.378.904.525C4.978 6.711 6.427 7 8 7s3.022-.289 4.096-.777M3 4c0-.374.356-.875 1.318-1.313C5.234 2.271 6.536 2 8 2s2.766.27 3.682.687C12.644 3.125 13 3.627 13 4c0 .374-.356.875-1.318 1.313C10.766 5.729 9.464 6 8 6s-2.766-.27-3.682-.687C3.356 4.875 3 4.373 3 4"/>
                        </svg>
                        Withdraw
                    </p>
                    </button>
                    <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exchangeModal">
                        <p class="fs-5" style="flex:1;margin:auto;width:300;">
                        <i class="bi bi-currency-exchange"></i>
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-currency-exchange" viewBox="0 0 16 16">
                          <path d="M0 5a5 5 0 0 0 4.027 4.905 6.5 6.5 0 0 1 .544-2.073C3.695 7.536 3.132 6.864 3 5.91h-.5v-.426h.466V5.05q-.001-.07.004-.135H2.5v-.427h.511C3.236 3.24 4.213 2.5 5.681 2.5c.316 0 .59.031.819.085v.733a3.5 3.5 0 0 0-.815-.082c-.919 0-1.538.466-1.734 1.252h1.917v.427h-1.98q-.004.07-.003.147v.422h1.983v.427H3.93c.118.602.468 1.03 1.005 1.229a6.5 6.5 0 0 1 4.97-3.113A5.002 5.002 0 0 0 0 5m16 5.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0m-7.75 1.322c.069.835.746 1.485 1.964 1.562V14h.54v-.62c1.259-.086 1.996-.74 1.996-1.69 0-.865-.563-1.31-1.57-1.54l-.426-.1V8.374c.54.06.884.347.966.745h.948c-.07-.804-.779-1.433-1.914-1.502V7h-.54v.629c-1.076.103-1.808.732-1.808 1.622 0 .787.544 1.288 1.45 1.493l.358.085v1.78c-.554-.08-.92-.376-1.003-.787zm1.96-1.895c-.532-.12-.82-.364-.82-.732 0-.41.311-.719.824-.809v1.54h-.005zm.622 1.044c.645.145.943.38.943.796 0 .474-.37.8-1.02.86v-1.674z"/>
                        </svg>
                        Currency Converter
                        </p>
                    </button>
    <c:if test="${not empty param.withdrawErr}">
        <div class="text-danger" >${param.withdrawErr}</div>
    </c:if>



                </div>
            </div>
        </div>
        <div class="modal fade" id="depositModal" tabindex="-1" aria-labelledby="depositModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="depositModalLabel">Deposit</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <form onsubmit="return validateInput('Deposit');" action="${contextPath}/depositMoney" method="POST">
                    <div class="modal-body">
                        <!-- Modal content goes here -->
                        <div class="input-group mb-3">
                          <span class="input-group-text">
                              <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-database-add" viewBox="0 0 16 16">
                                  <path d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7m.5-5v1h1a.5.5 0 0 1 0 1h-1v1a.5.5 0 0 1-1 0v-1h-1a.5.5 0 0 1 0-1h1v-1a.5.5 0 0 1 1 0"/>
                                  <path d="M12.096 6.223A5 5 0 0 0 13 5.698V7c0 .289-.213.654-.753 1.007a4.5 4.5 0 0 1 1.753.25V4c0-1.007-.875-1.755-1.904-2.223C11.022 1.289 9.573 1 8 1s-3.022.289-4.096.777C2.875 2.245 2 2.993 2 4v9c0 1.007.875 1.755 1.904 2.223C4.978 15.71 6.427 16 8 16c.536 0 1.058-.034 1.555-.097a4.5 4.5 0 0 1-.813-.927Q8.378 15 8 15c-1.464 0-2.766-.27-3.682-.687C3.356 13.875 3 13.373 3 13v-1.302c.271.202.58.378.904.525C4.978 12.71 6.427 13 8 13h.027a4.6 4.6 0 0 1 0-1H8c-1.464 0-2.766-.27-3.682-.687C3.356 10.875 3 10.373 3 10V8.698c.271.202.58.378.904.525C4.978 9.71 6.427 10 8 10q.393 0 .774-.024a4.5 4.5 0 0 1 1.102-1.132C9.298 8.944 8.666 9 8 9c-1.464 0-2.766-.27-3.682-.687C3.356 7.875 3 7.373 3 7V5.698c.271.202.58.378.904.525C4.978 6.711 6.427 7 8 7s3.022-.289 4.096-.777M3 4c0-.374.356-.875 1.318-1.313C5.234 2.271 6.536 2 8 2s2.766.27 3.682.687C12.644 3.125 13 3.627 13 4c0 .374-.356.875-1.318 1.313C10.766 5.729 9.464 6 8 6s-2.766-.27-3.682-.687C3.356 4.875 3 4.373 3 4"/>
                                </svg>
                          </span>
                          <input type="number"  id="depositAmount" name="amount" class="form-control">
                          <%-- <span class="input-group-text">.00</span> --%>
                        </div>
                    </div>
                    <div class="modal-footer">

                        <button type="submit" id="depositSubmit" class="btn btn-primary">Add money</button>
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <!-- Additional modal action buttons can go here -->
                    </div>
                    </form>
                </div>
            </div>
        </div>
        <div class="modal fade" id="withdrawModal" tabindex="-1" aria-labelledby="withdrawModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="withdrawModalLabel">Withdraw</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <form  onsubmit="return validateInput('Withdraw');" action="${contextPath}/withdrawMoney" method="POST">
                    <div class="modal-body">
                        <!-- Modal content goes here -->
                        <div class="input-group mb-3">
                          <span class="input-group-text">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-database-dash" viewBox="0 0 16 16">
                          <path d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7M11 12h3a.5.5 0 0 1 0 1h-3a.5.5 0 0 1 0-1"/>
                          <path d="M12.096 6.223A5 5 0 0 0 13 5.698V7c0 .289-.213.654-.753 1.007a4.5 4.5 0 0 1 1.753.25V4c0-1.007-.875-1.755-1.904-2.223C11.022 1.289 9.573 1 8 1s-3.022.289-4.096.777C2.875 2.245 2 2.993 2 4v9c0 1.007.875 1.755 1.904 2.223C4.978 15.71 6.427 16 8 16c.536 0 1.058-.034 1.555-.097a4.5 4.5 0 0 1-.813-.927Q8.378 15 8 15c-1.464 0-2.766-.27-3.682-.687C3.356 13.875 3 13.373 3 13v-1.302c.271.202.58.378.904.525C4.978 12.71 6.427 13 8 13h.027a4.6 4.6 0 0 1 0-1H8c-1.464 0-2.766-.27-3.682-.687C3.356 10.875 3 10.373 3 10V8.698c.271.202.58.378.904.525C4.978 9.71 6.427 10 8 10q.393 0 .774-.024a4.5 4.5 0 0 1 1.102-1.132C9.298 8.944 8.666 9 8 9c-1.464 0-2.766-.27-3.682-.687C3.356 7.875 3 7.373 3 7V5.698c.271.202.58.378.904.525C4.978 6.711 6.427 7 8 7s3.022-.289 4.096-.777M3 4c0-.374.356-.875 1.318-1.313C5.234 2.271 6.536 2 8 2s2.766.27 3.682.687C12.644 3.125 13 3.627 13 4c0 .374-.356.875-1.318 1.313C10.766 5.729 9.464 6 8 6s-2.766-.27-3.682-.687C3.356 4.875 3 4.373 3 4"/>
                        </svg>
                          </span>
<%--                             <div class="form-group">
                                <label for="exampleFormControlSelect1">Withdraw Type</label>
                                <select class="form-control" id="exampleFormControlSelect1">
                                  <option>Default withdraw</option>
                                  <option>Spending</option>
                                </select>
                            </div> --%>

                          <input type="number"  id="withdrawAmount" name="amount" class="form-control">
                          <%-- <span class="input-group-text">.00</span> --%>
                        </div>
                                                     <%-- <h1 class="text-center">Withdraw Type</h1> --%>
                            <div class="form-group">
                                <label for="exampleFormControlSelect1">Withdraw Type</label>
                                <select class="form-control" id="withdrawTypeSelect" onchange="toggleOptions()">
                                    <option value="default">Default withdraw</option>
                                    <option value="spending">Spending</option>
                                </select>
                            </div>
                            <div id="spendingOptions" style="display: none;">
                                <!-- Options for spending category -->
                                <div class="form-group">
                                    <label for="spendingCategory">Spending Category</label>
                                    <select class="form-control" id="spendingCategory">
                                        <option>Option 1</option>
                                        <option>Option 2</option>
                                        <option>Option 3</option>
                                        <option>Option 4</option>
                                    </select>
                                </div>
                            </div>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-primary">Withdraw</button>
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    </div>
                    </form>
                </div>
            </div>
        </div>
        <div class="modal fade" id="exchangeModal" tabindex="-1" aria-labelledby="exchangeModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exchangeLabel">Currency converter</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>


                    <div class="modal-body">
                        <!-- Modal content goes here -->
                        <div class="input-group mb-3">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>Base</th>
                                        <th>Currency</th>
                                        <th>Rate</th>
                                    </tr>
                                </thead>
                                <tbody id="currencyTableBody">
                                    <!-- Table rows will be added here dynamically -->
                                </tbody>
                            </table>
                        </div>


                        <button class="btn btn-primary" style="margin-left:30%;" 
                            onclick="fetchCurrencyData()">Fetch Currency Data</button>
                        <form id="exchangeForm" onsubmit="return validateInput('Exchange');" action="${contextPath}/exchangeMoney" method="POST">
                            <p class="fs-6" style="flex:1;margin:auto;">Exchange currency to </p>
                            <div class="row">
                                <div class="col-md-4">
                                    <label for="currencySelect" class="form-label">Select Currency:</label>
                                    <select class="form-select" name="currencySelect" id="currencySelect" aria-label="Select Currency">
                                        <!-- Options will be added dynamically by JavaScript -->
                                    </select>
                                </div>
                                            <div class="col-md-4">
                                    <label for="convertedValue" class="form-label">Converted Value:</label>
                                    <input type="text" class="form-control" name="amount" id="convertedValue" readonly>
                                </div>
                            </div>

                    </div>
                            <div class="modal-footer">
                                <button type="submit" class="btn btn-primary">Exchange</button>
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                <!-- Additional modal action buttons can go here -->
                            </div>
                        </form>

                </div>
            </div>
        </div>



        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <%-- <script src="${contextPath}/resources/js/bootstrap.min.js"></script> --%>
        <%-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script> --%>
        <%-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script> --%>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
        <script type="text/javascript">
            function fetchTransactionHistory() {
                fetch('/api/getTransactionHistory')
                    .then(response => response.json())
                    .then(data => {
                        displayTransactionHistory(data) ;
                        displaySpendingsChart(filterLastMonthTransactionsSpendings(data));
                        displayRevenueChart(filterLastMonthTransactionsRevenue(data));
                    })
                    .catch(error => console.error('Error fetching transaction history:', error));
            }
            window.onload = fetchTransactionHistory;        
            function fetchCurrencyData() {
                fetch('/api/getCurrency')
                    .then(response => response.json())
                    .then(data => displayCurrencyData(data))
                    .catch(error => console.error('Error fetching currency data:', error));
            }
            function filterLastMonthTransactionsSpendings(transactionData) {
                return transactionData.filter(transaction => {
                    return transaction.transactionCategory === 'WITHDRAW';
                });
            }
            function filterLastMonthTransactionsRevenue(transactionData) {
                return transactionData.filter(transaction => {
                    return transaction.transactionCategory === 'DEPOSIT'
                });
            }



            let globalData;
            function displayTransactionHistory(transactionData) {
                var transactionTable = document.getElementById('transactionTable');
                transactionTable.innerHTML = ''; 

                var headers = '<thead><tr><th>Transaction category</th>'+
                                        '<th>Amount</th><th>Date</th>'+
                                '</tr></thead>';
                transactionTable.innerHTML += headers;

                if (transactionData.length === 0) {
                    transactionTable.innerHTML += '<tr><p class="fs-6" style="margin:1em;text-align:right;">'+
                                        'No Transactions Performed</p></tr>';
                    return;
                }

                globalData = transactionData;

                var tbody = '<tbody>';
                <%-- transactionData.reverse(); --%>
                transactionData.forEach(transaction => {
                    var rowColor = '';
                    var sign = '';

                    if (transaction.transactionCategory === "WITHDRAW") {
                        rowColor = 'table-danger'; // Red color for WITHDRAW
                        sign = '-';
                    } else if (transaction.transactionCategory === "DEPOSIT") {
                        rowColor = 'table-success'; // Green color for DEPOSIT
                        sign = '+'
                    } else if (transaction.transactionCategory === "EXCHANGE") {
                        sign = '&#128177;'
                    }
                    var row = 
                        '<tr class="' + rowColor + '">' +
                            '<td>' + transaction.transactionCategory    + '</td>' +
                            '<td>' + sign + transaction.amount+
                                                ' '+transaction.currency+ '</td>' +
                            '<td>' + transaction.createdDate            + '</td>' +
                        '</tr>';

                    tbody += row;
                });
                tbody += '</tbody>';
                transactionTable.innerHTML += tbody;
            }




            function displaySpendingsChart(transactionData) {
                const withdrawalAmounts = {};

                transactionData.forEach(transaction => {
                    const date = new Date(transaction.createdDate).toLocaleDateString();
                    withdrawalAmounts[date] = (withdrawalAmounts[date] || 0) + transaction.amount;
                });

                const dataPoints = [];
                for (const date in withdrawalAmounts) {
                    dataPoints.push({ x: new Date(date), y: withdrawalAmounts[date] });
                }

                const chart = new CanvasJS.Chart("chartContainer", {
                    theme: "light2",
                    backgroundColor: "#eee",
                    title: {
                        text: "Spendings"
                    },
                    axisX: {
                        title: "Date",
                        valueFormatString: "D", // Adjust the format to show day and month
                        interval: 1,
                        intervalType: "day" // Set interval to show one label per day
                        
                    },
                    axisY: {
                        title: "Amount"
                    },
                    data: [{
                        type: "spline", // Use 'spline' for a smooth curve line
                        lineDashType: "solid", // Set lineDashType to 'solid' for a solid line
                        dataPoints: dataPoints,
                        color: "red"
                    }]
                });

                chart.render();
            }

            function displayRevenueChart(transactionData) {
                const revenueAmounts = {};


                transactionData.forEach(transaction => {
                    const date = new Date(transaction.createdDate).toLocaleDateString();
                    revenueAmounts[date] = (revenueAmounts[date] || 0) + transaction.amount;
                });

                const dataPoints = [];
                for (const date in revenueAmounts) {
                    dataPoints.push({ x: new Date(date), y: revenueAmounts[date] });
                }

                const chart = new CanvasJS.Chart("chartContainer2", {
                    theme: "light2",
                    backgroundColor: "#eee",
                    title: {
                        text: "Revenue"
                    },
                    axisX: {
                        title: "Date",
                        valueFormatString: "D", // Adjust the format to show day and month
                        interval: 1,
                        intervalType: "day" // Set interval to show one label per day
                        
                    },
                    axisY: {
                        title: "Amount"
                    },
                    data: [{
                        type: "spline", // Use 'spline' for a smooth curve line
                        lineDashType: "solid", // Set lineDashType to 'solid' for a solid line
                        dataPoints: dataPoints,
                        color: "green"
                    }]
                });

                chart.render();
            }



            function displayCurrencyData(data) {

                var tableBody = document.getElementById('currencyTableBody');

                // Clear previous data
                tableBody.innerHTML = '';


                // Iterate over the object and create table rows
                for (var currency in data) {
                    if (data.hasOwnProperty(currency)) {
                        var row = document.createElement('tr');
                        var baseCell = document.createElement("td");
                        var currencyCell = document.createElement('td');
                        var rateCell = document.createElement('td');
                        
                        // Set currency and rate

                        baseCell.textContent = '1 ${user.currency}';
                        currencyCell.textContent = currency;
                        rateCell.textContent = data[currency];

                        // Append cells to the row
                        row.appendChild(baseCell);
                        row.appendChild(currencyCell);
                        row.appendChild(rateCell);

                        // Append row to the table body
                        tableBody.appendChild(row);
                    }
                }
                populateCurrencyOptions(data);
            }

            // Function to populate currency options in select element
            function populateCurrencyOptions(data) {
                var selectElement = document.getElementById('currencySelect');

                // Clear previous options
                selectElement.innerHTML = '';


                // Iterate over the object and create options
                for (var currency in data) {
                    if (data.hasOwnProperty(currency)) {
                        var option = document.createElement('option');
                        option.value = currency;
                        option.textContent = currency;
                        selectElement.appendChild(option);
                    }
                }


                // Add event listener to handle currency selection
                selectElement.addEventListener('change',  function(event) {
                    handleCurrencySelection(event, data)
                });
            }

            // Function to handle currency selection
            function handleCurrencySelection(event, currencyData) {
                var selectedCurrency = event.target.value;
                var inputValue = parseFloat(`${user.balance}`);
                var convertedValueInput = document.getElementById('convertedValue');
                console.log(selectedCurrency);

                var convertedValue = inputValue * currencyData[selectedCurrency];

                convertedValueInput.value = convertedValue.toFixed(2); // Displaying value up to 2 decimal places
            }

            // Display currency options when the page loads

            function toggleOptions() {
                var withdrawType = document.getElementById("withdrawTypeSelect").value;
                var spendingOptions = document.getElementById("spendingOptions");

                if (withdrawType === "spending") {
                    spendingOptions.style.display = "block";
                } else {
                    spendingOptions.style.display = "none";
                }
            }

            function confirmDelete() {
                var word = prompt("Type word 'delete' to delete history");
                if (word === 'delete') {
                    return true;
                } else {
                    return false;
                }
            }

            function validateInput(formName) {
                var depositValue = document.getElementById('depositAmount');
                var withdrawValue = document.getElementById('withdrawAmount');
                var exchangeValue = document.getElementById('convertedValue');
                <%-- var Value = document.getElementById('depositAmount'); --%>
                if (formName === 'Deposit' && depositValue.value.trim() === "") {
                    alert("Please enter a value.");
                    return false; // Prevent form submission
                }
                if (formName === 'Withdraw' && withdrawValue.value.trim() === "") {
                    alert("Please enter a value.");
                    return false; // Prevent form submission
                }
                if (formName === 'Exchange' && exchangeValue.value.trim() === "") {
                    alert("Converted field is empty or data has not fetched yet");
                    return false; // Prevent form submission
                }
                return true;
            }
        </script>
    </body>
</html>

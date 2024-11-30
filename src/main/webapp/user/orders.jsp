<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<%@ page import="com.salemart.entity.User" %>
<%@ page import="com.salemart.entity.Order" %>
<%@ page import="com.salemart.db.DB" %>
<html>
<head>
    <title>Your Orders</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #f9f9f9;
        }

        h1 {
            color: #333;
            text-align: center;
        }

        .order-list {
            list-style: none;
            padding: 0;
            max-width: 600px;
            margin: 20px auto;
        }

        .order-item {
            background: #ffffff;
            margin: 10px 0;
            padding: 15px;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .order-details {
            display: flex;
            flex-direction: column;
        }

        .order-details span {
            margin: 2px 0;
            font-size: 14px;
        }

        .order-details span strong {
            color: #555;
        }

        .view-items {
            background: #007bff;
            color: #fff;
            border: none;
            border-radius: 4px;
            padding: 10px 15px;
            cursor: pointer;
            text-decoration: none;
            font-size: 14px;
        }

        .view-items:hover {
            background: #0056b3;
        }

        .back-button {
            display: block;
            max-width: 600px;
            margin: 20px auto;
            text-align: center;
        }

        .back-button a {
            background: #28a745;
            color: #fff;
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 4px;
            font-size: 16px;
        }

        .back-button a:hover {
            background: #218838;
        }
    </style>
</head>
<body>
<%
    User user=(User)Objects.requireNonNullElse(session.getAttribute("user"),new User());
%>

<%

%>

<h1>Your Orders</h1>
<ul class="order-list">
    <%
        boolean ordersFound = false;
        for (Order order : DB.orders) {
            if (order.getUser_id() == user.getId()) {
                ordersFound = true;
    %>
    <li class="order-item">
        <div class="order-details">
            <span><strong>Order ID:</strong> <%= order.getOrder_id() %></span>
            <span><strong>Date:</strong> <%= order.getDate() %></span>
            <span><strong>Status:</strong> <%= order.getOrder_status() %></span>
        </div>
        <a href="orderItems.jsp?orderId=<%= order.getOrder_id() %>" class="view-items">View Items</a>
    </li>
    <%
            }
        }
        if (!ordersFound) {
    %>
    <li class="order-item">
        <div class="order-details">
            <span>No orders found.</span>
        </div>
    </li>
    <% } %>
</ul>

<div class="back-button">
    <a href="../mainPage.jsp">Go Back to Main Page</a>
</div>
</body>
</html>

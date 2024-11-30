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
            background-color: #eef2f3; /* Sof ko'k va oq orasidagi aralash rang */
        }

        h1 {
            color: #004085; /* To'q ko'k */
            text-align: center;
            margin-bottom: 20px;
        }

        .order-list {
            list-style: none;
            padding: 0;
            max-width: 700px;
            margin: 20px auto;
        }

        .order-item {
            background: #ffffff;
            margin: 10px 0;
            padding: 15px;
            border-radius: 8px;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
            display: flex;
            justify-content: space-between;
            align-items: center;
            transition: transform 0.2s, box-shadow 0.2s;
        }

        .order-item:hover {
            transform: scale(1.02);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.15);
        }

        .order-details {
            display: flex;
            flex-direction: column;
        }

        .order-details span {
            margin: 5px 0;
            font-size: 15px;
            color: #495057; /* To'q kulrang */
        }

        .order-details span strong {
            color: #343a40; /* To'qroq kulrang */
        }

        .view-items {
            background: #17a2b8; /* Sof ko'k-yashil */
            color: #fff;
            border: none;
            border-radius: 4px;
            padding: 10px 15px;
            cursor: pointer;
            text-decoration: none;
            font-size: 14px;
            transition: background 0.2s;
        }

        .view-items:hover {
            background: #138496; /* To'qroq ko'k-yashil */
        }

        .back-button {
            display: block;
            max-width: 700px;
            margin: 20px auto;
            text-align: center;
        }

        .back-button a {
            background: #28a745; /* Yashil */
            color: #fff;
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 4px;
            font-size: 16px;
            transition: background 0.2s;
        }

        .back-button a:hover {
            background: #218838; /* To'qroq yashil */
        }
    </style>
</head>
<body>
<%
    // Foydalanuvchini sessiyadan olish
    User user = (User) Objects.requireNonNullElse(session.getAttribute("user"), new User());
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

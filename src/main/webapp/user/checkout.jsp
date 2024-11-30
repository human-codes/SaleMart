<%@ page import="java.util.Map" %>
<%@ page import="java.util.Optional" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.Objects" %>
<%@ page import="static com.salemart.db.DB.orderItems" %>
<%@ page import="static com.salemart.db.DB.orders" %>
<%@ page import="com.salemart.entity.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Order Notification</title>
    <!-- Include Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #f8f9fa;
            margin: 0;
        }

        .notification-container {
            text-align: center;
            padding: 30px;
            border: 1px solid #ddd;
            border-radius: 10px;
            background-color: #fff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .notification-container h1 {
            margin-bottom: 20px;
            color: #007bff;
        }
    </style>
</head>
<body>

<%
    Basket basket=(Basket) Objects.requireNonNullElse(session.getAttribute("basket"),new Basket());
    User user=(User)Objects.requireNonNullElse(session.getAttribute("user"),new User());
%>

<%
    Order order = new Order();
    order.setDate(new Date());
    order.setUser_id(user.getId());
    for (Map.Entry
            <Product, Integer> productIntegerEntry : basket.getBasket().entrySet()) {
        OrderItem orderItem = new OrderItem();
        orderItem.setOrderId(order.getOrder_id());
        orderItem.setQuantity(productIntegerEntry.getValue());
        orderItem.setProductId(productIntegerEntry.getKey().getId());
        orderItems.add(orderItem);
    }
    orders.add(order);
    basket.getBasket().clear();

%>

<div class="notification-container">
    <h1>We Received Your Order!</h1>
    <p>Thank you for shopping with us. Your order has been successfully placed.</p>
    <!-- Main Page Button -->
    <a href="../mainPage.jsp" class="btn btn-primary mt-3">Back to Main Page</a>
</div>

<!-- Include Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

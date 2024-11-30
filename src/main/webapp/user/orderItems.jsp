<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<%@ page import="com.salemart.entity.Product" %>
<%@ page import="com.salemart.entity.OrderItem" %>
<%@ page import="static com.salemart.db.DB.products" %>
<%@ page import="com.salemart.db.DB" %>

<html>
<head>
    <title>Order Items</title>
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

        .item-list {
            list-style: none;
            padding: 0;
            max-width: 600px;
            margin: 20px auto;
        }

        .item {
            background: #ffffff;
            margin: 10px 0;
            padding: 15px;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .item-details {
            display: flex;
            flex-direction: column;
        }

        .item-details span {
            margin: 2px 0;
            font-size: 14px;
        }

        .item-details span strong {
            color: #555;
        }

        .button-container {
            display: flex;
            justify-content: center;
            gap: 10px;
            margin-top: 20px;
        }

        .button-container a {
            background: #007bff;
            color: #fff;
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 4px;
            font-size: 16px;
        }

        .button-container a:hover {
            background: #0056b3;
        }

        .button-container .back-button {
            background: #28a745;
        }

        .button-container .back-button:hover {
            background: #218838;
        }
    </style>
</head>
<body>
<h1>Order Items</h1>
<%
    String orderIdParam = request.getParameter("orderId");
    int orderId = Integer.parseInt(orderIdParam);

    List<OrderItem> orderItems = DB.orderItems;
%>
<ul class="item-list">
    <%
        boolean itemsFound = false;
        for (OrderItem orderItem : orderItems) {
            if (orderItem.getOrderId() == orderId) {
                itemsFound = true;
                // Safely fetch the product using Optional
                Optional<Product> productOptional = products.stream()
                        .filter(product -> product.getId().equals(orderItem.getProductId()))
                        .findFirst();
                Product product = productOptional.orElse(null);
    %>
    <li class="item">
        <div class="item-details">
            <span><strong>Order Item ID:</strong> <%= orderItem.getOrderItemId() %></span>
            <span><strong>Product Name:</strong>
                <%= (product != null) ? product.getName() : "Unknown Product" %>
            </span>
            <span><strong>Quantity:</strong> <%= orderItem.getQuantity() %></span>
            <span><img style="width: 60px; margin:10px" src="/file/<%=product.getId()%>" alt=""></span>
        </div>
    </li>
    <%
            }
        }
        if (!itemsFound) {
    %>
    <li class="item">
        <div class="item-details">
            <span>No items found for this order.</span>
        </div>
    </li>
    <% } %>
</ul>


<div class="button-container">
    <a href="orders.jsp" class="back-button">Go Back to Orders</a>
    <a href="../mainPage.jsp">Go Back to Main Page</a>
</div>
</body>
</html>

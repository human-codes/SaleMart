
<%@ page import="java.util.Map" %>
<%@ page import="java.util.Objects" %>
<%@ page import="com.salemart.entity.Basket" %>
<%@ page import="com.salemart.entity.Product" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Basket</title>
    <!-- Include Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .basket-item {
            border-bottom: 1px solid #ddd;
            padding: 15px 0;
        }
        .basket-item:last-child {
            border-bottom: none;
        }
        .total-section {
            font-size: 1.2rem;
            font-weight: bold;
        }
        .quantity-controls button {
            width: 30px;
            height: 30px;
            text-align: center;
            padding: 0;
            margin: 0 5px;
        }
        .action-buttons {
            margin-top: 20px;
        }
    </style>
</head>
<body>
<div class="container">
    <h1 class="my-4">Your Basket</h1>
    <%
        Basket basket = (Basket) Objects.requireNonNullElse(session.getAttribute("basket"), new Basket());
        if (basket.getBasket().isEmpty()) {
    %>
    <div class="alert alert-warning" role="alert">
        Your basket is empty.
    </div>
    <a href="mainPage.jsp" class="btn btn-secondary">Go Back</a>
    <%
    } else {
    %>
    <div class="row">
        <!-- Display Basket Items -->
        <div class="col-md-12">
            <ul class="list-unstyled">
                <%
                    double totalPrice = 0;
                    for (Map.Entry<Product, Integer> entry : basket.getBasket().entrySet()) {
                        Product product = entry.getKey();
                        int quantity = entry.getValue();
                        double productTotal = product.getPrice() * quantity;
                        totalPrice += productTotal;
                %>
                <li class="basket-item">
                    <div class="d-flex justify-content-between align-items-center">
                        <div>
                            <img style="width: 60px; margin-right: 10px" src="/files/<%= product.getId() %>" alt="Product">
                            <h5 class="d-inline-block"><%= product.getName() %></h5>
                            <p>Price: $<%= product.getPrice() %> x <%= quantity %></p>
                            <p>Total: $<%= productTotal %></p>
                        </div>
                        <div class="d-flex align-items-center">
                            <!-- Quantity Controls -->
                            <div class="quantity-controls d-flex align-items-center">
                                <form action="/ProductQuantityServlet" method="get" style="display: inline;">
                                    <input type="hidden" name="productId" value="<%= product.getId() %>">
                                    <input type="hidden" name="action" value="decrement">
                                    <button type="submit" class="btn btn-outline-secondary" <%= quantity == 1 ? "disabled" : "" %>>-</button>
                                </form>
                                <span class="mx-2"><%= quantity %></span>
                                <form action="/ProductQuantityServlet" method="get" style="display: inline;">
                                    <input type="hidden" name="productId" value="<%= product.getId() %>">
                                    <input type="hidden" name="action" value="increment">
                                    <button type="submit" class="btn btn-outline-secondary">+</button>
                                </form>
                            </div>
                            <a href="basketServlet?productId=<%= product.getId() %>&action=remove" class="btn btn-danger ms-3">Remove</a>
                        </div>
                    </div>
                </li>
                <%
                    }
                %>
            </ul>
        </div>
    </div>
    <div class="total-section mt-4 text-end">
        <p>Total Price: $<%= totalPrice %></p>
    </div>

    <!-- Action Buttons -->
    <div class="action-buttons d-flex justify-content-between">
        <!-- Go Back Button -->
        <a href="mainPage.jsp" class="btn btn-secondary">Go Back</a>
        <!-- Checkout Button -->
        <form action="user/checkout.jsp" method="post">
            <button class="btn btn-primary">Checkout</button>
        </form>
    </div>
    <%
        }
    %>
</div>

<!-- Include Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

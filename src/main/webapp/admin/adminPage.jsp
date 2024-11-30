
<%@ page import="java.util.Optional" %>

<%@ page import="static com.salemart.db.DB.categories" %>
<%@ page import="com.salemart.entity.Product" %>
<%@ page import="static com.salemart.db.DB.products" %>
<%@ page import="com.salemart.entity.Category" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sidebar Layout</title>
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            display: flex;
            height: 100vh;
        }

        /* Sidebar */
        .sidebar {
            width: 200px;
            background-color: #f5f5f5;
            padding: 10px;
            box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1);
            display: flex;
            flex-direction: column;
            gap: 10px;
        }

        .sidebar a {
            text-decoration: none;
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            background-color: white;
            border-radius: 5px;
            text-align: center;
            color: black;
            font-weight: bold;
            cursor: pointer;
        }

        .sidebar a.active {
            background-color: #007bff;
            color: white;
        }

        .sidebar a:hover {
            background-color: #ddd;
        }

        /* Main Content */
        .main {
            flex: 1;
            display: flex;
            flex-direction: column;
            background-color: #f9f9f9;
            padding: 20px;
        }

        .main .header {
            display: flex;
            justify-content: space-between; /* Space between the buttons */
            align-items: center; /* Vertically center the items */
            padding: 10px;
        }

        .main .header a {
            display: inline-block;
            width: 60px;
            height: 50px;
            text-align: center;
            line-height: 50px;
            background-color: #007bff;
            color: white;
            font-size: 15px;
            text-decoration: none;
            border-radius: 50%;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            transition: background-color 0.3s ease, transform 0.2s ease;
        }

        .main .header a:hover {
            background-color: #0056b3;
            transform: scale(1.1);
        }

        .main .content {
            margin-top: 20px;
            display: flex;
            flex-direction: column;
            gap: 10px;
        }

        .main .content .item {
            width: 100%;
            height: 40px;
            border: 1px solid #ccc;
            background-color: white;
            border-radius: 5px;
            display: flex;
            align-items: center;
            padding-left: 10px;
        }

        /* Updated Sign Out Button */
        .sign-out {
            background-color: #007bff; /* Primary blue color */
            color: white;
            font-size: 2px; /* Adjusted font size for clarity */
            padding: 10px 15px; /* Adjusted padding for balance */
            border-radius: 25px; /* Rounded edges for a pill-like button */
            text-decoration: none; /* Remove underline */
            font-weight: bold; /* Bold text for emphasis */
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); /* Add subtle shadow */
            transition: background-color 0.3s ease, transform 0.2s ease; /* Smooth transitions */
            border: 1px solid #007bff; /* Border matching background */
            display: inline-flex; /* Flex for vertical centering */
            align-items: center;
            justify-content: center;
        }

        .sign-out:hover {
            background-color: #0056b3; /* Darker shade on hover */
            transform: scale(1.1); /* Slight zoom effect */
        }

        .sign-out:active {
            background-color: #004085; /* Even darker shade on click */
            transform: scale(1); /* Reset scale */
        }

    </style>
</head>
<body>
<%
    String current = request.getParameter("current");
    if (current == null) {
        current = "1";
    }
%>
<div class="sidebar">
    <a href="adminPage.jsp?current=1" class="<%= "1".equals(current) ? "active" : "" %>">Category</a>
    <a href="adminPage.jsp?current=0" class="<%= "0".equals(current) ? "active" : "" %>">Product</a>
</div>

<!-- Main Content -->
<div class="main">
    <div class="header">
        <%
            if ("1".equals(current)) {
        %>
        <a href="/admin/categoryAdd.jsp">+</a>
        <%
        } else {
        %>
        <a href="/admin/productAdd.jsp">+</a>
        <%
            }
        %>
        <!-- Sign Out Button -->
        <a href="/loginOutServlet" class="sign-out">Log Out</a>
    </div>

    <div class="content">
        <%
            if ("1".equals(current)) {
                for (Category category : categories) {
        %>
        <div class="item"><%= category.getName() %></div>
        <%
            }
        } else if ("0".equals(current)) {
            for (Product product : products) {
        %>
        <div class="item"><%= product.getName() %></div>
        <%
                }
            }
        %>
    </div>
</div>
</body>
</html>

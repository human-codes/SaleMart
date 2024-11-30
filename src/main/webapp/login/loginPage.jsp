<%@ page import="static com.salemart.db.DB.categories" %>
<%@ page import="com.salemart.entity.Category" %>
<%@ page import="static com.salemart.db.DB.products" %>
<%@ page import="com.salemart.entity.Product" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Category-based Product Page</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #fdf3e4;
        }

        .header {
            background-color: #4a3f35;
            color: #ffdd7e;
        }

        .header h1 {
            font-family: 'Georgia', serif;
        }

        .sidebar {
            background-color: #ffdd7e;
            min-height: 100vh;
        }

        .sidebar .btn {
            width: 100%;
            margin-bottom: 10px;
            text-align: left;
            background-color: #4a3f35;
            color: #ffdd7e;
            border: none;
        }

        .sidebar .btn:hover {
            background-color: #f58c1f;
            color: #fff;
        }

        .main-content {
            padding: 20px;
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .category-title {
            font-size: 1.5rem;
            color: #f58c1f;
            font-family: 'Georgia', serif;
        }

        .header button {
            background-color: #f58c1f;
            color: #fff;
            border: none;
        }

        .header button:hover {
            background-color: #4a3f35;
            color: #ffdd7e;
        }
    </style>
</head>
<body>
<!-- Header -->
<header class="header p-3 d-flex justify-content-between align-items-center">
    <h1 class="m-0">My Vibrant Store</h1>
    <div>
        <button class="btn btn-sm me-2">Log In</button>
        <button class="btn btn-sm">Basket</button>
    </div>
</header>

<div class="container-fluid">
    <div class="row">
        <!-- Sidebar -->
        <aside class="col-md-3 col-lg-2 sidebar p-3">
            <h5 class="text-dark">Categories</h5>

            <form method="GET" action="loginPage.jsp.">
                <button name="categoryId" value=<%=0%> class="btn"> All Products</button>
            </form>

            <form method="GET" action="loginPage.jsp">
                <%
                    for (Category category : categories) {
                %>
                <button name="categoryId" value=<%=category.getId()%> class="btn"><%=category.getName()%></button>
                <%
                }
                %>
            </form>
        </aside>


        <main class="col-md-9 col-lg-10">
            <div class="main-content">
                <%
                    String category = request.getParameter("categoryId");
                    for (Product product : products) {
                        if (category.equals("0") || category.equals(product.getCategoryId()+"")) {
                %>



                <%
                } else {
                %>
                <h2 class="category-title"><%= category.substring(0, 1).toUpperCase() + category.substring(1) %>
                    Products</h2>
                <p>Here are the products for the <%= category %> category...</p>
                <%
                    }
                    }
                %>
            </div>
        </main>
    </div>
</div>

<!-- Bootstrap JS Bundle -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

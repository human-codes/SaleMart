<%@ page import="com.salemart.entity.Product" %>
<%@ page import="static com.salemart.db.DB.products" %>
<%@ page import="com.salemart.entity.Basket" %>
<%@ page import="java.util.Objects" %>
<%@ page import="static com.salemart.db.DB.categories" %>
<%@ page import="com.salemart.entity.Category" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Centered Product Display</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f8f9fa; /* Soft background */
        }

        .header {
            background-color: #2c3e50; /* Dark blue */
            color: #ecf0f1; /* Light grey text */
            padding: 20px;
        }

        .header h1 {
            font-family: 'Georgia', serif;
            font-size: 2.5rem;
            margin: 0;
        }

        .header .btn {
            background-color: #e67e22; /* Orange */
            color: white;
            border: none;
            font-size: 1rem;
            padding: 10px 15px;
            border-radius: 5px;
        }

        .header .btn:hover {
            background-color: #d35400; /* Darker orange */
        }

        .header .btn-basket {
            margin-left: 10px;
        }

        .sidebar {
            background-color: #34495e; /* Deep blue-grey */
            color: #ecf0f1;
            min-height: 100vh;
            padding: 20px;
        }

        .sidebar h5 {
            text-align: center;
            margin-bottom: 20px;
        }

        .sidebar .btn {
            width: 100%;
            margin-bottom: 10px;
            background-color: #16a085; /* Teal */
            color: white;
            border: none;
            font-size: 1rem;
        }

        .sidebar .btn:hover {
            background-color: #1abc9c; /* Lighter teal */
        }

        .main-content {
            padding: 20px;
        }

        .card {
            border: none;
            background-color: #ffffff; /* White for clean design */
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Soft shadow */
            overflow: hidden;
            transition: transform 0.3s, box-shadow 0.3s;
            text-align: center;
        }

        .card:hover {
            transform: translateY(-10px); /* Slight lift on hover */
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
        }

        .card img {
            display: block;
            margin: 0 auto;
            max-width: 100%;
            height: auto;
            object-fit: contain; /* Maintain aspect ratio without cropping */
            max-height: 200px; /* Prevent oversized images */
            margin-bottom: 15px;
        }

        .card-body {
            padding: 15px;
        }

        .card-title {
            font-size: 1.2rem;
            font-weight: bold;
            color: #2c3e50;
        }

        .card-text {
            font-size: 1rem;
            color: #7f8c8d; /* Subtle grey */
            margin-bottom: 15px;
        }

        .btn-primary, .btn-danger {
            width: 100%;
            padding: 10px;
            border-radius: 5px;
            border: none;
        }

        .btn-primary {
            background-color: #2980b9; /* Blue */
            color: white;
        }

        .btn-primary:hover {
            background-color: #3498db; /* Lighter blue */
        }

        .btn-danger {
            background-color: #c0392b; /* Red */
            color: white;
        }

        .btn-danger:hover {
            background-color: #e74c3c; /* Lighter red */
        }
    </style>
</head>
<body>
<!-- Header -->
<header class="header d-flex justify-content-between align-items-center">
    <h1>Centered Product Display</h1>
    <div>
        <a class="btn">Log In</a>
        <a href="basket.jsp" class="btn btn-basket">Basket</a>
    </div>
</header>

<div class="container-fluid">
    <div class="row">
        <!-- Sidebar -->
        <aside class="col-md-3 col-lg-2 sidebar">
            <h5>Categories</h5>
            <form method="GET" action="mainPage.jsp">
                <button name="categoryId" value="0" class="btn">All Products</button>
            </form>

            <form method="GET" action="mainPage.jsp">
                <%
                    for (Category category : categories) {
                %>
                <button name="categoryId" value="<%=category.getId()%>" class="btn"><%=category.getName()%></button>
                <%
                    }
                %>
            </form>
        </aside>

        <!-- Main Content -->
        <main class="col-md-9 col-lg-10 main-content">
            <div class="row g-4">
                <%
                    String categoryIdParam = request.getParameter("categoryId");
                    int categoryId = (categoryIdParam != null) ? Integer.parseInt(categoryIdParam) : 0;

                    for (Product product : products) {
                        if (categoryId == 0 || product.getCategoryId() == categoryId) {
                %>
                <div class="col-md-6 col-lg-4">
                    <div class="card">
                        <img src="/files/<%=product.getId()%>" alt="<%=product.getName()%>">
                        <div class="card-body">
                            <h5 class="card-title"><%=product.getName()%></h5>
                            <p class="card-text">$<%=product.getPrice()%></p>
                            <%
                                Basket basket = (Basket) Objects.requireNonNullElse(session.getAttribute("basket"), new Basket());
                                boolean isProductInBasket = basket.getBasket().keySet().stream()
                                        .anyMatch(p -> p.getId() == product.getId());
                                if (isProductInBasket) {
                            %>
                            <a class="btn btn-danger" href="basketServlet?productId=<%=product.getId()%>&categoryId=<%=categoryId%>">Remove</a>
                            <%
                            } else {
                            %>
                            <a class="btn btn-primary" href="basketServlet?productId=<%=product.getId()%>&categoryId=<%=categoryId%>">Add to Basket</a>
                            <%
                                }
                            %>
                        </div>
                    </div>
                </div>
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

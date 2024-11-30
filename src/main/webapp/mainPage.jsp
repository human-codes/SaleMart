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
    <title>Category-based Product Page</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #ffe6d1; /* Soft peach background */
        }

        .header {
            background-color: #6a994e; /* Fresh green */
            color: #ffe6d1; /* Peach contrast */
        }

        .header h1 {
            font-family: 'Georgia', serif;
        }

        .sidebar {
            background-color: #f4a261; /* Warm coral */
            min-height: 100vh;
        }

        .sidebar .btn {
            width: 100%;
            margin-bottom: 10px;
            text-align: left;
            background-color: #2a9d8f; /* Cool teal */
            color: #ffffff;
            border: none;
        }

        .sidebar .btn:hover {
            background-color: #e76f51; /* Deep coral */
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
            color: #264653; /* Rich slate blue */
            font-family: 'Georgia', serif;
        }

        .header button {
            background-color: #e9c46a; /* Warm yellow */
            color: #264653; /* Rich slate blue */
            border: none;
        }

        .header button:hover {
            background-color: #2a9d8f; /* Cool teal */
            color: #fff;
        }

        .card {
            background-color: #fdf3e4; /* Light cream */
            border: 1px solid #e9c46a; /* Yellow border */
        }

        .card .btn-primary {
            background-color: #264653; /* Rich slate blue */
            border: none;
        }

        .card .btn-primary:hover {
            background-color: #6a994e; /* Fresh green */
        }

        .card .btn-danger {
            background-color: #e76f51; /* Deep coral */
            border: none;
        }

        .card .btn-danger:hover {
            background-color: #6a994e; /* Fresh green */
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
            <h5 class="text-white">Categories</h5>

            <form method="GET" action="mainPage.jsp">
                <button name="categoryId" value="0" class="btn">All Products</button>
            </form>

            <form method="GET" action="mainPage.jsp">
                <%
                    for (Category category : categories) {
                %>
                <button name="categoryId" value="<%=category.getId()%>" class="btn"><%=category.getName()%>
                </button>
                <%
                    }
                %>
            </form>
        </aside>


        <main class="col-md-9 col-lg-10">
            <div class="row g-3">
                <%
                    String categoryIdParam = request.getParameter("categoryId");
                    int categoryId = (categoryIdParam != null) ? Integer.parseInt(categoryIdParam) : 0;

                    for (Product product : products) {
                        if (categoryId == 0 || product.getCategoryId() == categoryId) {
                %>
                <div class="col-md-6 col-lg-4">
                    <div class="card h-100 p-3 d-flex justify-content-between">
                        <div>
                            <h5 class="card-title"><%= product.getName() %></h5>
                            <div class="d-flex align-items-center">
                                <p class="mb-0 me-3"><strong>Price:</strong> $<%= product.getPrice() %></p>
                                <img style="width: 60px; margin:10px" src="/file/<%=product.getId()%>" alt="">
                                <%
                                    Basket basket = (Basket) Objects.requireNonNullElse(session.getAttribute("basket"), new Basket());

                                    boolean isProductInBasket = basket.getBasket().keySet().stream()
                                            .anyMatch(p -> p.getId() == product.getId());
                                    if (isProductInBasket) {
                                %>
                                <a class="btn btn-danger"
                                   href="basketServlet?productId=<%=product.getId()%>&categoryId=<%=categoryId%>">Remove</a>
                                <%
                                } else {
                                %>
                                <a class="btn btn-primary"
                                   href="basketServlet?productId=<%=product.getId()%>&categoryId=<%=categoryId%>">Select</a>
                                <%
                                    }
                                %>
                            </div>
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

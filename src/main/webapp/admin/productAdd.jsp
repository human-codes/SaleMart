<%@ page import="com.salemart.entity.Category" %>
<%@ page import="static com.salemart.db.DB.categories" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Product</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .form-container {
            width: 400px;
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .form-container h2 {
            margin: 0 0 20px;
            text-align: center;
            color: #333;
        }

        .form-container label {
            display: block;
            margin-bottom: 5px;
            color: #555;
        }

        .form-container input[type="text"],
        .form-container input[type="number"],
        .form-container select {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        /* Add margin to the product image input */
        .form-container input[type="file"] {
            margin-top: 10px;
            margin-bottom: 20px; /* Added space below the image input */
        }

        .form-container button {
            width: 100%;
            padding: 10px;
            background-color: #007bff;
            border: none;
            color: white;
            font-size: 16px;
            border-radius: 4px;
            cursor: pointer;
        }

        .form-container button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
<div class="form-container">
    <h2>Add New Product</h2>
    <form action="addProductServlet" method="POST" enctype="multipart/form-data">
        <label for="productName">Product Name</label>
        <input type="text" id="productName" name="productName" placeholder="Enter product name" required>

        <label for="productPrice">Product Price</label>
        <input type="number" id="productPrice" name="productPrice" placeholder="Enter product price" required>

        <label for="productImage">Product Image</label>
        <input type="file" id="productImage" name="productImage" accept="image/*" required>

        <label for="categoryId">Category</label>
        <select id="categoryId" name="categoryId" required>
            <option value="" disabled selected>Select a category</option>
            <%
                for (Category category : categories) {
            %>
            <option value="<%= category.getId() %>"><%= category.getName() %></option>
            <%
                }
            %>
        </select>

        <button type="submit">Add Product</button>
    </form>
</div>
</body>
</html>

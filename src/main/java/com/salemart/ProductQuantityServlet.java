package com.salemart;

import com.salemart.entity.Basket;
import com.salemart.entity.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Objects;
import java.util.Optional;

import static com.salemart.db.DB.products;

@WebServlet("/ProductQuantityServlet")
public class ProductQuantityServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String productIdParam = req.getParameter("productId");
        String action = req.getParameter("action");

        // Parse productId to an integer
        int productId = Integer.parseInt(productIdParam);


        Optional<Product> productOptional = products.stream()
                .filter(product -> product.getId() == productId)
                .findFirst();
        Basket basket=(Basket) Objects.requireNonNullElse(req.getSession().getAttribute("basket"),new Basket());
        if (productOptional.isPresent()) {
            Product product = productOptional.get();

            // Perform action based on 'increment' or 'decrement'
            if ("decrement".equals(action)) {

                int currentQuantity = basket.getBasket().getOrDefault(product, 0);

                if (currentQuantity > 1) {
                    // Decrement the quantity
                    basket.getBasket().put(product, currentQuantity - 1);
                } else {
                    // Optional: Remove the product if quantity becomes 0
                    basket.getBasket().remove(product);
                }
            } else if ("increment".equals(action)) {
                // Increment the quantity
                basket.getBasket().put(product, basket.getBasket().getOrDefault(product, 0) + 1);
            }
        }
        req.setAttribute("basket", basket);
        resp.sendRedirect("/basket.jsp");
    }
}

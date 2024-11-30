package com.salemart;

import com.salemart.entity.Basket;
import com.salemart.entity.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Objects;
import java.util.Optional;

import static com.salemart.db.DB.products;

@WebServlet("/basketServlet")
public class BasketServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String productIdParam = req.getParameter("productId");
        String categoryIdParam = req.getParameter("categoryId");

        Integer productId = Integer.parseInt(productIdParam);
        Optional<Product> first = products.stream().filter(product -> product.getId().equals(productId)).findFirst();

        HttpSession session = req.getSession();
        Basket basket=(Basket) Objects.requireNonNullElse(session.getAttribute("basket"),new Basket());


        boolean isProductInBasket = basket.getBasket().keySet().stream()
                .anyMatch(p -> p.getId() == productId);

        if (isProductInBasket) {
            basket.getBasket().remove(first.get());
        } else {
            basket.getBasket().put(first.get(), 1);
        }

        session.setAttribute("basket", basket);
        resp.sendRedirect("/mainPage.jsp?categoryId=" + (categoryIdParam != null ? categoryIdParam : "0"));
    }
}

package com.salemart;

import com.salemart.entity.Category;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import static com.salemart.db.DB.categories;


@WebServlet("/admin/addCategoryServlet")
public class addCategoryServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String categoryName = req.getParameter("categoryName");
        categories.add(new Category(categoryName));
        resp.sendRedirect("adminPage.jsp");
    }
}

package com.salemart;

import com.salemart.entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String username = req.getParameter("username");
        String password = req.getParameter("password");

        User user = new User();
        user.setUsername(username);
        user.setPassword(password);
        user.setStatus(false);

        req.getSession().setAttribute("user", user);
        if (req.getSession().getAttribute("basket") != null) {
            resp.sendRedirect("/basket.jsp");
        }
        else {
            resp.sendRedirect("mainPage.jsp");
        }
    }
}

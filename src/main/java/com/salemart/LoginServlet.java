package com.salemart;


import com.salemart.entity.Basket;
import com.salemart.entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.Optional;


import static com.salemart.db.DB.users;
@WebServlet("/loginServlet")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        User user = (User) req.getSession().getAttribute("user");
        if (user != null) {
            req.getSession().invalidate();
            resp.sendRedirect("mainPage.jsp");
            return;
        }

        String username = req.getParameter("username");
        String password = req.getParameter("password");

        Optional<User> first = users.stream().filter(u -> u.getUsername().equals(username) && u.getPassword().equals(password)).findFirst();
        if (first.isPresent()) {
            if (first.get().getStatus()){
                HttpSession session = req.getSession();
                session.setAttribute("user", first.get());
                resp.sendRedirect("admin/adminPage.jsp");
            }
            else {
                HttpSession session = req.getSession();
                session.setAttribute("user", first.get());
                Basket basket = (Basket)session.getAttribute("basket");
                if (basket != null) {
                    resp.sendRedirect("/basket.jsp");
                }
                else resp.sendRedirect("mainPage.jsp");
            }
        }
        else{
            resp.sendRedirect("login/loginPage.jsp");
        }
    }
}

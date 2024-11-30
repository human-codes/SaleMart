package com.salemart;
import com.salemart.entity.User;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;

@WebFilter("/*")
public class Filter extends HttpFilter {
    @Override
    protected void doFilter(HttpServletRequest req, HttpServletResponse res, FilterChain chain) throws IOException, ServletException {
        User user = (User) req.getSession().getAttribute("user");



        List<String> openPages = Arrays.asList(
                "/mainPage.jsp",
                "/login/loginPage.jsp"
        );

        String requestURI = req.getRequestURI();

        // Allow access to open pages
        if (openPages.contains(requestURI)) {
            chain.doFilter(req, res);
            return;
        }


        if (requestURI.contains("/admin")) {

            if (user == null || !user.getStatus()) {
                res.sendRedirect("/login/loginPage.jsp");
                return;
            }
        }

        if (requestURI.contains("/user")) {
            if (user == null) { // Ensure user is logged in
                res.sendRedirect("/login/loginPage.jsp");
                return;
            }
        }

        chain.doFilter(req, res);
    }
}

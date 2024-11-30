package com.salemart;

import com.salemart.entity.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.UUID;

import static com.salemart.db.DB.products;


@WebServlet("/admin/addProductServlet")
@MultipartConfig
public class addProductServlet extends HttpServlet {
    String absolutPage="D:\\CODELIFE\\SaleWebPage\\files\\";
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Part productImage = req.getPart("productImage");
        byte[] bytes = productImage.getInputStream().readAllBytes();
        Path path = Files.write(Path.of(absolutPage + UUID.randomUUID() + ".jpg"), bytes);
        String photoUrl = path.toString();
        String productName = req.getParameter("productName");
        String productPrice = req.getParameter("productPrice");
        int i = Integer.parseInt(productPrice);
        String categoryId = req.getParameter("categoryId");
        int i1 = Integer.parseInt(categoryId);

        products.add(new Product(i1,productName,i,photoUrl));
        resp.sendRedirect("adminPage.jsp");
    }
}

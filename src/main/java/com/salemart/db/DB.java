package com.salemart.db;

import com.salemart.entity.*;


import java.util.*;

public interface DB {
    List<User> users = new ArrayList<>(List.of(
            new User("1", "1", false),
            new User("2", "2", false),
            new User("3", "3", true)
    ));

    List<Category> categories = new ArrayList<>(List.of(
            new Category("Fruits"),
            new Category("Drinks")
    ));

    List<Product> products = new ArrayList<>(List.of(
            new Product(1, "Apple", 2, "D:\\CODELIFE\\SaleMart\\files\\3f36678f-af55-4ac5-b3d7-f04597869b2e.jpg"),
            new Product(1, "Peach", 1, "D:\\CODELIFE\\SaleMart\\files\\6d3f3247-bfcc-4b48-8dc3-007fb8bd72f0.jpg"),

            new Product(2, "Aqua", 3, "D:\\CODELIFE\\SaleMart\\files\\113e3e1f-854e-418c-a4e1-79313c620cc4.jpg"),
            new Product(2, "Dena", 5, "D:\\CODELIFE\\SaleMart\\files\\20c8b09f-4cb9-4c73-8a5e-b99696c96e92.jpg")

    ));

    List<Order> orders = new ArrayList<>();
    List<OrderItem> orderItems = new ArrayList<>();
}

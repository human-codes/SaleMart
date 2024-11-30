package com.salemart.entity;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor

public class Product {
    private Integer id=genId++;
    private int categoryId;
    private String name;
    private int price;
    private static Integer genId=1;
    private String productImage;

    public Product(int categoryId, String name,int price,String productImage) {
        this.name = name;
        this.price=price;
        this.productImage=productImage;
        this.categoryId = categoryId;
    }
}
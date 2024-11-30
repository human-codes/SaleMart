package com.salemart.entity;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class OrderItem {
    private Integer orderItemId=++genId;
    private static Integer genId=0;
    private Integer orderId;
    private Integer productId;
    private Integer quantity;

}
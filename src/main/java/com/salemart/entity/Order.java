package com.salemart.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


import java.util.Date;


@Data
@AllArgsConstructor
@NoArgsConstructor
public class Order {
    private Integer order_id=++genId;
    private static Integer genId=0;
    private int user_id;
    private Date date;
    private String order_status="new";
}
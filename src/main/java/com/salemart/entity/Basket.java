package com.salemart.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.LinkedHashMap;
import java.util.Map;
@Data
@AllArgsConstructor
@NoArgsConstructor

public class Basket {
    private Map<Product,Integer> basket=new LinkedHashMap<>();

}
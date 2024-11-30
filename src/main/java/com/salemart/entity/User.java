package com.salemart.entity;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.servlet.http.Cookie;
import java.util.UUID;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class User {
    private int id=genId++;
    private String username;
    private String password;
    private Boolean status;



    public User(String password, String username,Boolean status) {
        this.password = password;
        this.username = username;
        this.status = status;
    }

    private static Integer genId=1;

    public User(User user) {
    }
}
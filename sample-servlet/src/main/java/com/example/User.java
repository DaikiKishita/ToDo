// src/main/java/com/example/User.java
package com.example;

public class User {
    private String username;
    private String password; // 本番ではハッシュにしましょう

    public User(String username, String password) {
        this.username = username;
        this.password = password;
    }

    public String getUsername() { return username; }
    public String getPassword() { return password; }
}

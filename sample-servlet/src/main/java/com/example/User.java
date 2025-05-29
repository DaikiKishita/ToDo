package com.example;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.*;
import java.util.*;

public class User {
    private String username;
    private String password;
    private List<Task> tasks = new ArrayList<>();

    public User(String username, String password) {
        this.username = username;
        this.password = password;
    }

    public String getUsername() {
        return username;
    }

    public String getPassword() {
        return password;
    }

    public List<Task> getTasks() { return tasks; }
    public void addTask(Task task) { tasks.add(task); }
}
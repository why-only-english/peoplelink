package com.example.peoplelink;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

@WebServlet(name = "mainServlet", value = "/main-servlet")
public class MainServlet extends HttpServlet {
    private String message;

    public void init() {
        message = "Main Page111!";
    }
    Date today = new Date();

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");

        // Main
        PrintWriter out = response.getWriter();
        out.println("<html><body>");
        out.println("<h1>" + message +"</h1>");
        out.println("<h1>" + today +"</h1>");
        out.println("</body></html>");
    }

    public void destroy() {
    }
}
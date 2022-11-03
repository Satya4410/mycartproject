package com.learn.mycart.servlets;

import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
public class Delete extends HttpServlet
{
     public void service(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException
     {
          //set response content type
          res.setContentType("text/html");
          //get printWrite obj
          PrintWriter pw = res.getWriter();
          //write request processing logic to generate wish message
        

          pw.println("<br><br><a href= delete.jsp></a>");
          //close stream object
          pw.close();
     }
}
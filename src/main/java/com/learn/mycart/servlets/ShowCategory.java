package com.learn.mycart.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/Show-Category")
public class ShowCategory extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public ShowCategory() {
        super();
        // TODO Auto-generated constructor stub
    }

    
   	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
   		
   		try( PrintWriter out = response.getWriter()){
   			 HttpSession httpSession = request.getSession();
   			  
   			  response.sendRedirect("category.jsp");
   			  
   			  return ;
   		}
   	}
   	
   	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
   		// TODO Auto-generated method stub
   		doGet(request, response);
   	}

   }

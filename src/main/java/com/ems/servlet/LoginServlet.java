package com.ems.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.ems.dao.AdminDao;
import com.ems.model.Admin;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		AdminDao adminDao = new AdminDao();
		Admin admin = adminDao.validateAdmin(username, password);
		
		if(admin != null) {
			// Login Successful
			HttpSession session = request.getSession(true);
			session.setAttribute("admin",admin);
			response.sendRedirect("dashboard.jsp");
		}else {
			response.sendRedirect("index.jsp?error=1");
		}

	}

}

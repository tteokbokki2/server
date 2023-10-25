package com.test.ajax.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.ajax.respository.AjaxDAO;

@WebServlet("/ex02.do")
public class Ex02 extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//Ex02.java

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/ex02.jsp");
		dispatcher.forward(req, resp);
	}

}


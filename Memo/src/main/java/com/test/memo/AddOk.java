package com.test.memo;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.memo.model.MemoDTO;
import com.test.repository.MemoDAO;

@WebServlet("/addok.do")
public class AddOk extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//AddOk.java
		
		//1. 데이터 가져오기(name, pw, memo)
		//2. DB 작업 > insert
		//3. 피드백(X) > JSP 호출하기
		
		//1.
		req.setCharacterEncoding("UTF-8");
		
		String name = req.getParameter("name");
		String pw = req.getParameter("pw");
		String memo = req.getParameter("memo");
		
		//2.
		Connection conn = null;
		PreparedStatement stat = null;
		
		//2. DB
		//- 계층(ADDOK - Controller, Servlet) > 데이터(포장 - HashMap or 객체)ㅇ > 계층(MemoDAO)
		MemoDAO dao = new MemoDAO();
				
		MemoDTO dto = new MemoDTO();
		dto.setName(name);
		dto.setPw(pw);
		dto.setMemo(memo);
		
		//dao.add(name, pw, memo);
		int result = dao.add(dto); //넘기는 데이터가 2개 이상이면 무조건 DTO에 담아서 넘기기(매개변수의 순서가 헷갈리니까 계층을 이용)
		
		//3.
		req.setAttribute("result", result);		

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/addok.jsp");
		dispatcher.forward(req, resp);
	}

}


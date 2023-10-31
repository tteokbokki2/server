package com.test.toy.board;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.test.toy.board.model.BoardDAO;
import com.test.toy.board.repository.BoardDTO;

@WebServlet("/board/add.do")
public class Add extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//Add.java

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/board/add.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//AddOk.java 역할
		
		/*
			1. 데이터 가져오기
			2. DB 작업 > insert
			3. 피드백
		*/
		
		//세션에 있는 아이디 저장
		HttpSession session = req.getSession();
		
		//1.
		req.setCharacterEncoding("UTF-8");
		
		String subject = req.getParameter("subject");
		String content = req.getParameter("content");
		
		//2.
		BoardDAO dao = new BoardDAO();
		
		BoardDTO dto = new BoardDTO();
		dto.setSubject(subject);
		dto.setContent(content);
		dto.setId(session.getId());
		
		int result = dao.add(dto);
		
		//3.
		if(result == 1) {
			
			resp.sendRedirect("/toy/board/list.do");
			
	    } else {
	    	
	    	PrintWriter writer = resp.getWriter();
		    writer.print("<script>alert('failed');history.back();</script>");
		    writer.close();
	    }
	}

}


package com.test.toy.board;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.test.toy.board.model.BoardDTO;
import com.test.toy.board.repository.BoardDAO;

@WebServlet("/board/view.do")
public class View extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//View.java
	
		HttpSession session = req.getSession();
		
		//1. 글 번호 가져오기
		String seq = req.getParameter("seq");
		
		//2.
		BoardDAO dao = new BoardDAO();
		
		//2.3 list를 거쳐서 올 때만 조회수 증가 
		if (session.getAttribute("read") != null && session.getAttribute("read").toString().equals("n")) {
			dao.updateReadcount(seq);
			
			session.setAttribute("read", "y");
		}
		
		BoardDTO dto = dao.get(seq);
		
		//2.5 데이터 조작
		
		//내용 태그 비활성화: <div> 태그를 &lt;div&gt;로 변경
		String content = dto.getContent();
		content = content.replace("<", "&lt;");
		content = content.replace(">", "&gt;");

		
		//내용 개행문자 처리
		content = content.replace("\r\n", "<br>");
		
		dto.setContent(content);
		
		//제목 태그 비활성화: <div> 태그를 &lt;div&gt;로 변경
		String subject = dto.getSubject();
		
		subject = subject.replace("<", "&lt;");
		subject = subject.replace(">", "&gt;");
		
		dto.setSubject(subject);
		
		//3.
		req.setAttribute("dto", dto);

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/board/view.jsp");
		dispatcher.forward(req, resp);
	}

}

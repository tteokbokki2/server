package com.test.memo;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.memo.model.MemoDTO;
import com.test.repository.MemoDAO;

@WebServlet("/view.do")
public class View extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//View.java
		
		/*		
			1. 데이터 가져오기(seq)
			2. DB 작업 > select > DAO 위임
			3. 결과값 반환 > JSP 호출하기(+전달)
		*/
		
		//1.
		String seq = req.getParameter("seq");
		
		//2.
		MemoDAO dao = new MemoDAO();
		
		MemoDTO dto = dao.get(seq);
		
		//메모 줄바꿔서 출력하기
		dto.setMemo(dto.getMemo().replace("\r\n", "<br>"));
		
		//3.
		req.setAttribute("dto", dto);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/view.jsp");
		dispatcher.forward(req, resp);
	}

}


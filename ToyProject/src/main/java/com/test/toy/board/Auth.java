package com.test.toy.board;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.test.toy.board.model.BoardDTO;
import com.test.toy.board.repository.BoardDAO;

public class Auth {

	public static boolean check(HttpServletRequest req, HttpServletResponse resp) {
		
		HttpSession session = req.getSession();
		String seq = req.getParameter("seq");
		
		BoardDAO dao = new BoardDAO();
		BoardDTO dto = dao.get(seq);
		
		if (!session.getAttribute("id").toString().equals(dto.getId())
				&& !session.getAttribute("lv").toString().equals("2")) {
			
			try {
				
				PrintWriter writer = resp.getWriter();
				writer.print("<script>alert('failed');history.back();</script>");
				writer.close();
				
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			
			return true;
		}
		
		return false;
	}

	
	
}

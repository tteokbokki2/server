package com.test.toy.board;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.test.toy.board.model.BoardDTO;
import com.test.toy.board.repository.BoardDAO;

@WebServlet("/board/list.do")
public class List extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//List.java
		
		/*
			A. list.do > 호출(목록보기)
			B. list.do?column=content&word=검색어 > 호출(검색하기)
		*/
		
		String column = req.getParameter("column");
		String word = req.getParameter("word");
		String search = "n"; //검색 중("Y"), 목록보기("n")
		
		if (column == null || word == null && (column.equals("")) && (word.equals(""))) {
			search = "n";
		} else {
			search = "y"; 
		}
		
		HashMap<String, String> map = new HashMap<String, String>();
		
		map.put("colum", column);
		map.put("word", word);
		map.put("search", search);
		
		//페이징
		//- list.do > 1 페이지 간주
		//- list.do?page=1, list.do?page=5
		
		int nowPage = 0;		//현재 페이지 번호
		int totalCount = 0;		//총 게시물 수
		int pageSize = 10;		//한 페이지에서 출력할 게시물 수
		int totalPage = 0;		//총 페이지 수
		int begin = 0;			//페이징 시작 위치
		int end = 0;			//페이징 끝 위치
		int n = 0;
		int loop = 0;
		int blockSize = 10;
		
		String page = req.getParameter("page");
		
		if (page == null || page.equals("")) {
			nowPage = 1;
		} else {
			nowPage = Integer.parseInt(page);
		}
		
		//list.do?page=1 > where rnum between 1 and 10
		//list.do?page=2 > where rnum between 11 and 20
		//list.do?page=3 > where rnum between 21 and 30
		
		begin = ((nowPage - 1) * pageSize) + 1;
		end = begin + pageSize - 1;
		
		map.put("begin", begin + "");
		map.put("end", end + "");
		

		/*
			1. DB 작업 > select
			2. 반환 > JSP 호출하기
		*/
		
		HttpSession session = req.getSession();
		
		//조회수 티켓
		session.setAttribute("read", "n");
		
		//1.
		BoardDAO dao = new BoardDAO();

				
		ArrayList<BoardDTO> list = dao.list(map);
		
		
		//1.5 데이터 가공
		for (BoardDTO dto:list) {
			
			//날짜 자르기
			//String regdate = dto.getRegdate();			
			//dto.setRegdate(regdate.substring(0, 10));
			
			
			//제목 길이 자르기
			String subject = dto.getSubject();
			
			if (subject.length() > 20) {
				subject = subject.substring(0, 20) + "..";
			}
			
			
			//제목 태그 비활성화: <div> 태그를 &lt;div&gt;로 변경
			
			subject = subject.replace("<", "&lt;");
			subject = subject.replace(">", "&gt;");
			
			dto.setSubject(subject);
			
		}
		
		
		//페이징 - 총 게시물 수
		totalCount = dao.getTotalCount();
		totalPage = (int)Math.ceil((double)totalCount / pageSize);
		
		StringBuilder sb = new StringBuilder();
		
		/*
		for (int i=1; i<=totalPage; i++) {
			if (i == nowPage) {				
				sb.append(String.format(" <a href='#!' style:'color:tomato;'>%d</a> ", i, i));
			} else {
				sb.append(String.format(" <a href='/toy/board/list.do?page=%d'>%d</a> ", i, i));
			}
		}
		*/
		
		//list.do?page=1
		//[이전] 1 2 3 4 5 6 7 8 9 10 [다음]

		//list.do?page=5
		//[이전] 1 2 3 4 5 6 7 8 9 10 [다음]
		
		//list.do?page=10
		//[이전] 1 2 3 4 5 6 7 8 9 10 [다음]
		
		//list.do?page=11
		//[이전] 11 12 13 14 15 16 17 18 19 20 [다음]
		
		loop = 1; //루프를 돌리기 위한 변수
		//n = 1; //출력 페이지 번호
		n = ((nowPage - 1) / blockSize) * blockSize + 1;
		
		while (!(loop > blockSize)) {
			
			if (n == nowPage) {				
				sb.append(String.format(" <a href='#!' style:'color:tomato;'>%d</a> ", n, n));
			} else {
				sb.append(String.format(" <a href='/toy/board/list.do?page=%d'>%d</a> ", n, n));
			}
			
			loop++;
			n++;
		}
		
		//다음 10페이지
		/*
		if () {
			sb.append(String.format("<a href='/toy/board/list.do?page=%d'>[다음 %d페이지]</a>", n, blockSize));
		} else {
			sb.append(String.format("<a href='/toy/board/list.do?page=%d'>[다음 %d페이지]</a>", n, blockSize));
		}
		*/

		//2.
		req.setAttribute("list", list);
		req.setAttribute("map", map);
		
		//페이징 넘기기
		req.setAttribute("totalCount", totalCount);
		req.setAttribute("totalPage", totalPage);
		req.setAttribute("nowPage", nowPage);
		
		req.setAttribute("pagebar", sb.toString());
		

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/board/list.jsp");
		dispatcher.forward(req, resp);
	}

}


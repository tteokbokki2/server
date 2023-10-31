package com.test.toy.board.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.test.toy.DBUtil;
import com.test.toy.board.repository.BoardDTO;

public class BoardDAO {

	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	public BoardDAO() {
		this.conn = DBUtil.open();
	}

	public int add(BoardDTO dto) {
		
		//queryParamNoReturn
		try {

			String sql = "insert into tblBoard (seq, subject, content, regdate, readcount, id) values (seqBoard.nextVal, ?, ?, default, default, ?);";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getSubject());
			pstat.setString(2, dto.getContent());
			pstat.setString(3, dto.getId()); //null

			return pstat.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}

//	public ArrayList<BoardDTO> list() {
//
//		try {
//			
//			String sql = "sql";
//			
//			pstat = conn.prepareStatement(sql);
//			pstat.setString(1, value);
//			
//			rs = pstat.executeQuery();
//			
//			if (rs.next()) {
//				
//				dto dto = new dto();
//				
//				setter
//				
//				return dto;
//				
//			}
//			
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return null;
//	}
//
//	public ArrayList<BoardDTO> list() {
//		// TODO Auto-generated method stub
//		return null;
//	}
}

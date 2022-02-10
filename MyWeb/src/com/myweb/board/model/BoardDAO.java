package com.myweb.board.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.myweb.util.JdbcUtil;

public class BoardDAO {
	
	//1. 스스로 객체를 멤버변수로 선언하고 1개로 제한 - 싱글톤
	private static BoardDAO instance = new BoardDAO();
	
	//2. 외부에서 객체를 생성할 수 없도록 private 설정함.
	
	private BoardDAO() {
		try {
			InitialContext ctx = new InitialContext();
			// Context.xml값에 저장된 설정을 저장하기 위한 공간 확보
			ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
		} catch (Exception e) {
			System.out.println("커넥션 풀링 에러 발생");
		}
	}
	
	//3. 외부에서 객체를 요구할 때에 getter메서드만 써서 반환
	
	public static BoardDAO getInstance() {
		return instance;
	}
	
	// 중복되는 코드를 멤버변수로 선언
	
	private DataSource ds;
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	//--------------메서드 구현---------------
	
	// 글 등록 메서드
	
	public void regist(String writer, String title, String content) {
		String sql = "insert into board (writer, title, content) values (?,?,?)";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, writer);
			pstmt.setString(2, title);
			pstmt.setString(3, content);
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn, pstmt, rs);
		}
		
	}
	
	// 게시물 목록 조회 메서드
	
	public List<BoardVO> getList() {
		ArrayList<BoardVO> list = new ArrayList<>();
		String sql = "select * from board order by num desc";
	
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				// 데이터를 vo에 담고, 이 데이터를 list에 저장할 코드를 작성
				/*
					방법 1
					BoardVo vo = new BoardVO();
					vo.setNum(rs.getInt("num"));
					...
					list.add(vo);
					방법 2
				*/
				int num = rs.getInt("num");
				String writer = rs.getString("writer");
				String title = rs.getString("title");
				String content = rs.getString("content");
				Timestamp regdate = rs.getTimestamp("regdate");
				int hit = rs.getInt("hit");
				
				BoardVO vo = new BoardVO(num, writer, title, content, regdate, hit);
				list.add(vo);
			}
						
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn, pstmt, rs);
		}
		
		return list;
	}
	
	// num을 이용한 게시글 조회 메서드
	
	public BoardVO getContent (String num) {
		BoardVO vo = null;
		String sql = "select * from board where num = ?";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, num);
			
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				int num2 = rs.getInt("num");
				String writer = rs.getString("writer");
				String title = rs.getString("title");
				String content = rs.getString("content");
				Timestamp regdate = rs.getTimestamp("regdate");
				int hit = rs.getInt("hit");
				
				vo = new BoardVO(num2, writer, title, content, regdate, hit);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn, pstmt, rs);
		}
		
		return vo;
	}
	
	// 게시글 수정 메서드
	
	public void updateContent (String num , String title, String content) {
		String sql = "update board set title = ?, content = ? where num = ?";
	
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.setInt(3, Integer.parseInt(num));
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn, pstmt, rs);
		}
	}
	
	// 게시글 삭제 메서드
	
	public void deleteContent (int num) {
		String sql = "delete from board where num = ?";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn, pstmt, rs);
		}
		
	}
	
	// 조회수 상승 메서드
	
	public void upHit (String num) {
		String sql = "update board set hit = hit + 1 where num = ?";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, Integer.parseInt(num));
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn, pstmt, rs);
		}
		
	}
	
	
	
	// 게시글 검색 메서드
	
	public List<BoardVO> search (String com, String title2) {
		ArrayList<BoardVO> list = new ArrayList<>();
		String sql = "select * from board where " + com + " like '%" + title2 + "%' order by num desc";
		
		try {
			conn = ds.getConnection();
			Statement st = conn.createStatement();
			
			rs = st.executeQuery(sql);
			
			while (rs.next()) {
				
				int num = rs.getInt("num");
				String writer = rs.getString("writer");
				String title = rs.getString("title");
				String content = rs.getString("content");
				Timestamp regdate = rs.getTimestamp("regdate");
				int hit = rs.getInt("hit");
				
				BoardVO vo = new BoardVO(num, writer, title, content, regdate, hit);
				list.add(vo);
			}
				
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn, pstmt, rs);
		}
		
		return list;
	}
	
}

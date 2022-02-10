package com.myweb.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// 컨트롤러를 생성할 때는 매핑형식을 확장자 패턴방식으로 변경... (ddd.xxx)

//@WebServlet("/TestController")
@WebServlet("*.test")
public class TestController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public TestController() {
        super();
    }
    
    // doAction 메소드에 어떤 방법으로든 전달하게 설정
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAction(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAction(request, response);
	}
	
	protected void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();
		
		String path = request.getContextPath();
		
		String command = uri.substring(path.length());
		
		System.out.println("URI 정보 :" + uri);
		
		System.out.println("ContextPath 정보 :" + path);
		
		System.out.println(command);
		
		if(command.equals("/controller/join.test")) {
			// ... 회원가입 관련 동작 ...
			System.out.println("조인 동작 구현....");
		} else if(command.equals("/controller/login.test")) {
			System.out.println("로그인 동작 구현...");
		} else if(command.equals("/controller/update.test")) {
			System.out.println("업데이트 동작 구현...");
		} else if(command.equals("/controller/delete.test")) {
			System.out.println("삭제 동작 구현...");
		}
		
	}
	
}

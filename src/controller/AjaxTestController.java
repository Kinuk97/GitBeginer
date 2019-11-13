package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import dto.Member;

@WebServlet("/ajax/test")
public class AjaxTestController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/WEB-INF/views/ajax/test.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		PrintWriter out = resp.getWriter();
		
		Gson gson = new Gson();
		
//		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("data", "Map Response Send");
//		
//		// Map -> JsonText 마샬링
//		String jsonText = gson.toJson(map);
//		out.println(jsonText);
		
		// DTO를 이용한 응답
//		Member mem = new Member();
//		mem.setId("AAAAAApple");
//		mem.setPw("Baaaaaaaaaaaaaaaanana");
//		
//		out.println(gson.toJson(mem));
		
		// List를 이용한 응답

		List<Member> list = new ArrayList<>();
		
		Member m1 = new Member();
		m1.setId("A");
		m1.setPw("Alice");
		
		Member m2 = new Member();
		m2.setId("B");
		m2.setPw("Bob");
		
		list.add(m1);
		list.add(m2);
		
		out.println(gson.toJson(list));
		
		// 왜 충돌이 안나는가...
	}
}

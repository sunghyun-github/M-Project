package mvc.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import mvc.dao.UserDAO;
import mvc.dto.UserDTO;

@WebServlet("*.api")
public class UserApiController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doProcess");
		request.setCharacterEncoding("utf-8"); // 한글처리

		String uri = request.getRequestURI();
		String action = uri.substring(uri.lastIndexOf("/"));
		System.out.println(uri);
		if(action.equals("/userList.api")) { // main.jsp
			// service : dao
			UserDAO dao = new UserDAO();
			List<UserDTO> userList =  dao.getUsers();

			// json
			Gson gson = new Gson();
			String json = gson.toJson(userList);

			response.setContentType("application/json; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.print(json);
		}else if(action.equals("/joinProc.api")) { // main.jsp

			// 1. 값을 받음
			request.setCharacterEncoding("utf-8");
			String id = request.getParameter("id");
			String password = request.getParameter("password");
			String name = request.getParameter("name");
			String role = request.getParameter("role");

			// 2. 받은 값 찍어보기
			//System.out.printf("%s,%s,%s,%s",id,password,name,role);

			// 3. db 처리
			UserDAO dao = new UserDAO();
			UserDTO dto = new UserDTO(id, password, name, role);
			String cnt = dao.insertUser(dto) +"";// s:1 / f:0

			Map<String, String> rs = new HashMap<String, String>();
			rs.put("rs", cnt);

			// json
			Gson gson = new Gson();
			String json = gson.toJson(rs);
			System.out.println(json);

			response.setContentType("application/json; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.print(json);
		}else if(action.equals("/idCheck.api")) { // main.jsp
			// idcheck
			String id = request.getParameter("id");
			UserDTO dto = new UserDTO();
			dto.setId(id);

			UserDAO dao = new UserDAO();
			dto = dao.getUser(dto);
			String cnt = "0";
			if(dto != null) {
				cnt = "1";
			}

			Map<String, String> rs = new HashMap<String, String>();
			rs.put("rs", cnt);

			// json
			Gson gson = new Gson();
			String json = gson.toJson(rs);

			response.setContentType("application/json; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.print(json);
		}else if(action.equals("/loginProc.api")) { // main.jsp

			// login 처리
			// 1. 값을 받고 찍어 본다. 꼭~~
			request.setCharacterEncoding("utf-8"); // 한글 처리
			String id = request.getParameter("id");
			String password = request.getParameter("password");

			int idx = 0;
			String name="";
			String role="";
			boolean isLogin = false;

			// 2. DB 처리를 한다.
			UserDAO dao = new UserDAO();
			UserDTO dto = new UserDTO();
			dto.setId(id);
			dto = dao.getUser(dto);
			if(dto != null) {
				if(password.equals(dto.getPassword())) {
					isLogin = true;
				}
			}		

			String jspFile = "";
			String cnt = "0"; // fail
			if (isLogin){ // 꼭 써야하는거 

				HttpSession session =  request.getSession();
				session.setAttribute("idx", dto.getIdx());
				session.setAttribute("id", id);
				session.setAttribute("name", dto.getName());
				session.setAttribute("role", dto.getRole());
				cnt = "1"; // success
			}


			Map<String, String> rs = new HashMap<String, String>();
			rs.put("rs", cnt);

			// json
			Gson gson = new Gson();
			String json = gson.toJson(rs);

			response.setContentType("application/json; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.print(json);
		}else if(action.equals("/updateProc.api")) { // main.jsp

			HttpSession session = request.getSession();

			request.setCharacterEncoding("utf-8"); // 한글 처리
			String id = (String)session.getAttribute("id");
			String password = request.getParameter("password");
			String name = request.getParameter("name");
			String role = request.getParameter("role");

			// 2. DB 처리를 한다.
			UserDAO dao = new UserDAO();
			UserDTO dto = new UserDTO(id, password, name, role);
			int cnt = dao.update(dto);

			session.setAttribute("name",name);

			Map<String, String> rs = new HashMap<String, String>();
			rs.put("rs", cnt+"");

			// json
			Gson gson = new Gson();
			String json = gson.toJson(rs);
			System.out.println(json);

			response.setContentType("application/json; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.print(json);
		}else if(action.equals("/deleteProc.api")) { // main.jsp

			HttpSession session = request.getSession();

			request.setCharacterEncoding("utf-8"); // 한글 처리
			String id = (String)session.getAttribute("id");
			String password = request.getParameter("password");
			int cnt = 0;
			
			// 2. DB 처리를 한다.			
			UserDAO dao = new UserDAO();
			UserDTO dto = new UserDTO();
			dto.setId(id);
			dto = dao.getUser(dto);
			
			if(dto != null) {
				// pass 확인
				if(password.equals(dto.getPassword())) {
					cnt = dao.delete(dto);
					session.invalidate();
				}
			}

			Map<String, String> rs = new HashMap<String, String>();
			rs.put("rs", cnt+"");

			// json
			Gson gson = new Gson();
			String json = gson.toJson(rs);
			System.out.println(json);

			response.setContentType("application/json; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.print(json);
		}
	}




}

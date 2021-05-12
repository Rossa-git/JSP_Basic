package servlet.example;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/OutServlet")
public class OutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public OutServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		//서블릿에서 아웃객체를 이용해서 브라우저 화면으로 보내는 방법
		//블라우저에 아웃객체를 이용해서 데이터를 보낼 때, 문서에 대한 타입을 반드시 지정해야한다 (content-type)
		//크롬 F12 - Network - Header서 문서를 확인할 수 있다.
		response.setContentType("text/html"); //응답문서 형식 지정
		response.setCharacterEncoding("utf-8"); //응답문서 인코딩형식 지정
		
		PrintWriter out = response.getWriter();
		out.println("<h3>her!</h3>");
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

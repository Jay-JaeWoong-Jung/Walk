package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import controller.HandlerMapping;
import controller.ModelAndView;
import model.MemberDAO;


public class DispatcherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
      MemberDAO dao=MemberDAO.getInstance();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cmd = request.getParameter("command");
		System.out.println("디스패쳐 서블릿 명령어:"+cmd);
		Controller controller=HandlerMapping.getInstance().createController(cmd);

		try{
			ModelAndView mv =controller.HandleRequest(request, response);
			System.out.println("디스패쳐 controller에서 뷰페이지로 이동");
			if(mv.isRedirect()) response.sendRedirect(mv.getPath());
			else request.getRequestDispatcher(mv.getPath()).forward(request, response);
		}catch(Exception e){
			e.printStackTrace();
		}//
	}

}

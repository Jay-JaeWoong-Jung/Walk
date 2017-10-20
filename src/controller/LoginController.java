package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.MemberDAO;
import model.MemberVO;

public class LoginController implements Controller {

	@Override
	public ModelAndView HandleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
	System.out.println("로그인 컨트롤러 입장");
		String userId = request.getParameter("userId");
		String userPass = request.getParameter("userPass");
		System.out.println(userId+", "+userPass);
		//boolean flag=request.getParameter("login");
		MemberVO vo = MemberDAO.getInstance().login(userId, userPass);

		if (vo != null) {
			HttpSession session = request.getSession();
			session.setAttribute("mvo", vo);
			
		} 
			return new ModelAndView("main.jsp");
	}

}

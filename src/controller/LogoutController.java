package controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.MemberDAO;

public class LogoutController implements Controller {

	@Override
	public ModelAndView HandleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		/////세션 무효화///////
		String userId = request.getParameter("userId");
		HttpSession session =request.getSession();
		session.invalidate();
		/*//////쿠키추가////////
		Cookie[] cookies=request.getCookies();
		if (cookies!=null) {
			for (int i = 0; i < cookies.length; i++) {
				if (cookies[i].getName().equals("userId")) {
					cookies[i].setMaxAge(0);
					response.addCookie(cookies[i]);
				}
			}
		}*/
		
		return new ModelAndView("main.jsp");
	}

}

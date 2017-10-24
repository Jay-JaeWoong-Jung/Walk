package controller;

import javax.servlet.http.Cookie;
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
		
		System.out.println(userId + ", " + userPass);
		
		MemberVO vo = MemberDAO.getInstance().login(userId, userPass);

		if (vo.getUserId() == null) {
			
			return new ModelAndView("main.jsp",true);
		/*	/////// 쿠키 생성/////////
			Cookie cookie = new Cookie("userId", userId);
			cookie.setMaxAge(60 * 60 * 24 * 15);// 15일 저장
			response.addCookie(cookie);
			response.sendRedirect("cookieLoginConfirm.jsp");
			String id = "";
			try {
				Cookie[] cookies = request.getCookies();

				if (cookies != null) {
					for (int i = 0; i < cookies.length; i++) {
						if (cookies[i].getName().equals("userId")) {
							id = cookies[i].getValue();
						}
					}
					if (id.equals("")) {
						response.sendRedirect("main.jsp");
					}
				} else {
					response.sendRedirect("main.jsp");
				}
			} catch (Exception e) {
			}
*/
		}else {
			HttpSession session = request.getSession();
			session.setAttribute("mvo", vo);
			return new ModelAndView("main.jsp",true);
		}
		
	}

}

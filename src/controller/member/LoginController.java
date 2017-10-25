package controller.member;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Controller;
import controller.ModelAndView;
import model.member.MemberDAO;
import model.member.MemberVO;

public class LoginController implements Controller {

	@Override
	public ModelAndView HandleRequest(HttpServletRequest request, HttpServletResponse response) 
			throws Exception {
		System.out.println("로그인 컨트롤러 입장");
		String userId = request.getParameter("userId");
		String userPass = request.getParameter("userPass");
		String retainId = request.getParameter("retainId");
//		if(retainId == null) {
//			retainId="n";
//		}
		System.out.println(userId + ", " + userPass);

		MemberVO vo = MemberDAO.getInstance().login(userId, userPass);


		if(vo.getUserId() != null) {
			HttpSession session =request.getSession();
			session.setAttribute("mvo", vo);
			//			ServletContext application = session.getServletContext();
			//			application.setAttribute("retainId", vo.getUserId());
			//			application.setAttribute("retainPass", vo.getUserPass());
			System.out.println("mvo 바인딩 완료!");
			System.out.println("retainId:"+retainId);
			if (retainId !=null) {

				/////// 쿠키 생성/////////
				Cookie cookie = new Cookie("retainInfo", vo.getUserId());
				cookie.setMaxAge(60 * 60 * 24 * 15);// 15일 저장
				response.addCookie(cookie);
				System.out.println("쿠키 생성 및 밸류"+vo.getUserId());
				
				return new ModelAndView("newMain.jsp",true);
				
			}else{
				Cookie[] cookies=request.getCookies();
				if (cookies!=null) {
					for (int i = 0; i < cookies.length; i++) {
						if (cookies[i].getName().equals("retainInfo")) {
							cookies[i].setMaxAge(0);
							response.addCookie(cookies[i]);
						}
					}
				}
				
			}

			return new ModelAndView("newMain.jsp",true);

		}else {
			return new ModelAndView("newMain.jsp?loginfail=true",true);
		}
		
	}

}

//
//if (retainId.equals("y")) {
//	
//	
//	/////// 쿠키 생성/////////
//	Cookie cookie = new Cookie("retainInfo", "retainInfo");
//	cookie.setMaxAge(60 * 60 * 24 * 15);// 15일 저장
//	response.addCookie(cookie);
//	response.sendRedirect("main.jsp");
//	String id = "";
//	try {
//		Cookie[] cookies = request.getCookies();
//
//		if (cookies != null) {
//			for (int i = 0; i < cookies.length; i++) {
//				if (cookies[i].getName().equals("userId")) {
//					id = cookies[i].getValue();
//				}
//			}
//			if (id.equals("")) {
//				response.sendRedirect("main.jsp");
//			}
//		} else {
//			response.sendRedirect("main.jsp");
//		}
//	} catch (Exception e) {
//	}
//
//}else {
//	HttpSession session = request.getSession();
//	session.setAttribute("mvo", vo);
//}


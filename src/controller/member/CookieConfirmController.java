package controller.member;


import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import controller.ModelAndView;
import model.member.MemberDAO;
import model.member.MemberVO;

public class CookieConfirmController implements Controller {

	@Override
	public ModelAndView HandleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("쿠키 컨트롤러 입장");
		

		Cookie[] cookies = request.getCookies();
		System.out.println("cookies:"+cookies);
		String userId="";
		if (cookies == null) {
			
	
	
		}else if(cookies != null){
			for (int i = 0; i < cookies.length; i++) {
				if (cookies[i].getName().equals("retainInfo")){
					userId = cookies[i].getValue();
					System.out.println("cookie명:"+userId);
//					cookies[i].setMaxAge(0);
					MemberVO vo = MemberDAO.getInstance().getMemberInfo(userId);
					request.setAttribute("retainId", vo.getUserId());
					request.setAttribute("retainPass",vo.getUserPass());
					
				}//if
			}//for
		}
		
	return new ModelAndView("cookie_confirm_view.jsp");
	}//request
	
	}//class



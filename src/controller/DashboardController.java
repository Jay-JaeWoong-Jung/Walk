package controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.MemberDAO;
import model.MemberVO;

/*
 * 주석...
 * 폼의 값 받아서
 * pvo 생성
 * biz() 호출
 * 네비게이션..redirect
 */
public class DashboardController implements Controller{

	@Override
	public ModelAndView HandleRequest(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		String userId =request.getParameter("userId");
		
		
		
		
		
		
		
		
		
		String path = "rsuccess.jsp";
		return new ModelAndView(path);
	}
}



















package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.MemberDAO;

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
		int selectedTime =Integer.parseInt(request.getParameter("selectedTime"));
		String userId =request.getParameter("userId");
		
		
		
		
		
		String path = "";
		return new ModelAndView(path);
	}
}



















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
public class ReserveController implements Controller{

	@Override
	public ModelAndView HandleRequest(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		int selectedTime =Integer.parseInt(request.getParameter("selectedTime"));
		System.out.println("selectedTime:"+selectedTime);
		String userId = request.getParameter("userId");
		int attendace = 1;
		System.out.println("컨트롤러 입성");
		
		MemberDAO.getInstance().chooseTimeSlot(selectedTime, userId);
		
		MemberDAO.getInstance().setReserveDate(userId,attendace);
		
		String path = "rsuccess.jsp";
		return new ModelAndView(path);
	}
}



















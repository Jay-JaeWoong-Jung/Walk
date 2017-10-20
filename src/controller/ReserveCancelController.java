package controller;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.MemberDAO;
import model.MemberVO;


public class ReserveCancelController implements Controller{

	@Override
	public ModelAndView HandleRequest(HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		//String userId =request.getParameter("userId");
		// String selectedTime =request.getParameter("selectedTime");
		String userId ="myId1";
		int selectedTime=0;
		


		//selectedTime 수정!!! 시간대 변경!!!
		int cancelReserve=MemberDAO.getInstance().cancelReservation(userId);
		
		
			request.setAttribute("cancelReserve", cancelReserve);
		
		
		
		String path = "dashboard.jsp";


		return new ModelAndView(path);
	}
}



















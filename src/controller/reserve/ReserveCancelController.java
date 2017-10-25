package controller.reserve;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import controller.ModelAndView;
import model.member.MemberDAO;


public class ReserveCancelController implements Controller{

	@Override
	public ModelAndView HandleRequest(HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String userId =request.getParameter("userId");
		 int selectedTime =Integer.parseInt(request.getParameter("selectedTime"));
		
		


		//selectedTime 수정!!! 시간대 변경!!!
		int cancelReserve=MemberDAO.getInstance().cancelReservation(userId);
		int cancelLog=MemberDAO.getInstance().deleteLog(userId);
		
		
		request.setAttribute("cancelReserve", cancelReserve);
		
		
		
		String path = "dashboard.jsp";


		return new ModelAndView(path);
	}
}



















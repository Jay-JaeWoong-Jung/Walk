package controller;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.MemberDAO;
import model.MemberVO;


public class DashboardController implements Controller{

	@Override
	public ModelAndView HandleRequest(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		//String userId =request.getParameter("userId");
		// String timeSlot =request.getParameter("timeSlot");
		String userId ="myId1";
		int selectedTime=1;
		
		//userId,falg,selectedTime 추출
		MemberVO vo=MemberDAO.getInstance().getReservationInfo(userId);
		
		
		
		//해당 userId 해당하는 selectedTime에 해당하는 같은 그룹(flag) count 수
		System.out.println("vo.getSelectedTime():"+vo.getSelectedTime());
		System.out.println("vo.getFlag():"+vo.getFlag());
		
		int count=MemberDAO.getInstance().getFlagCout(vo.getSelectedTime(), vo.getFlag());
		
		
		//selectedTime 수정!!! 시간대 변경!!!
		//MemberDAO.getInstance().updateTimeSlot(selectedTime,userId);
		
		MemberDAO.getInstance().cancelReservation(userId);
		
		
		System.out.println("count:"+count);
		
		request.setAttribute("VO", vo);
		request.setAttribute("count", count);
		
		String path = "dashboard.jsp";
		

		return new ModelAndView(path);
	}
}



















package controller;



import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.MemberDAO;
import model.MemberVO;


public class DashboardController implements Controller{

	@Override
	public ModelAndView HandleRequest(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		String userId =request.getParameter("userId");
		 int selectedTime =Integer.parseInt(request.getParameter("selectedTime"));
//		String userId ="myId1";
//		int selectedTime=2;
		
		System.out.println("DashboardController에서 selectedTime:"+selectedTime);
		
	
		
		//userId,falg,selectedTime 추출
		MemberVO vo=MemberDAO.getInstance().getReservationInfo(userId);
		
		
		
		//해당 userId 해당하는 selectedTime에 해당하는 같은 그룹(groupColor) count 수
    	System.out.println("vo.getSelectedTime():"+vo.getSelectedTime());
		System.out.println("vo.getgroupColor():"+vo.getgroupColor());
		
		int count=MemberDAO.getInstance().getgroupColorCout(selectedTime, vo.getgroupColor());
		
		
		
		ArrayList<MemberVO> rvo=MemberDAO.getInstance().getNameInGroup(selectedTime, vo.getgroupColor());
		
		Date date=MemberDAO.getInstance().getReserveDate(userId);
		
		
		
		System.out.println("count:"+count);
		System.out.println("vo:"+vo);
		System.out.println("rvo:"+rvo);
		
		request.setAttribute("vo", vo);
		request.setAttribute("rvo", rvo);
		request.setAttribute("count", count);
		request.setAttribute("date", date);
		
		String path = "dashboard.jsp";
		

		return new ModelAndView(path);
	}
}



















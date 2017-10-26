package controller.dashboard;



import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import controller.ModelAndView;
import model.member.MemberDAO;
import model.member.MemberVO;


public class DashboardController implements Controller{

	@Override
	public ModelAndView HandleRequest(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		String userId =request.getParameter("userId");
		
		 
//		String userId ="myId1";
//		int selectedTime=2;
		
		
		
	
		
		//userId,falg,selectedTime 추출
		MemberVO vo=MemberDAO.getInstance().getReservationInfo(userId);
		
		System.out.println("DashboardController에서 selectedTime:"+vo.getSelectedTime());
		
		//해당 userId 해당하는 selectedTime에 해당하는 같은 그룹(groupColor) count 수
    	System.out.println("vo.getSelectedTime():"+vo.getSelectedTime());
		System.out.println("vo.getgroupColor():"+vo.getgroupColor());
		
		int count=MemberDAO.getInstance().getgroupColorCout(vo.getSelectedTime(), vo.getgroupColor());
		
		
		//같은 그룹 사람들 이름 추출
		ArrayList<MemberVO> rvo=MemberDAO.getInstance().getNameInGroup(vo.getSelectedTime(), vo.getgroupColor());
		
		Date date=MemberDAO.getInstance().getReserveDate(userId);
		
		
		
		System.out.println("Dash count:"+count);
		System.out.println("Dash  vo:"+vo);
		System.out.println("Dash  rvo:"+rvo);
		
		request.setAttribute("vo", vo);
		request.setAttribute("rvo", rvo);
		request.setAttribute("count", count);
		request.setAttribute("date", date);
		
		String path = "dashboard.jsp";
		

		return new ModelAndView(path);
	}
}



















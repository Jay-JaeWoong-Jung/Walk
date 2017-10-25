package controller.reserve;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import controller.ModelAndView;
import model.member.MemberDAO;


public class ReserveController implements Controller{

	@Override
	public ModelAndView HandleRequest(HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		int selectedTime =Integer.parseInt(request.getParameter("selectedTime"));
		
		String userId = request.getParameter("userId");
		String change = request.getParameter("change");
		String path =null;
		int attendace = 1;
		
		
		
		boolean isReserve=MemberDAO.getInstance().isReservation(userId);
		System.out.println(" 맨처음 reserveController selectedTime:"+selectedTime);
		
		System.out.println("최초  리저브 컨트롤러 change값:"+change);
		System.out.println("isReserve:"+isReserve);
		//기존 예약자면  메인페이지 이동 , 최초 예약자는 로그에 넣고 성공페이지 이동, 예약변경자는 로그 없이 성공페이지 이동
		
		//예약이 처음이라면..
		if(isReserve == false ){
			MemberDAO.getInstance().chooseTimeSlot(selectedTime,userId);
			MemberDAO.getInstance().setReserveDate(userId,attendace);
			System.out.println("첫 예약후 reserveController selectedTime:"+selectedTime);
			path = "rsuccess.jsp?selectedTime="+selectedTime;
			

		//기존 예약자라면..
		}else{
			
			// 기존 예약자가 예약 변경이 아니고 다시 예약하려고 하면..
			if(change == null){
				path ="reserve.jsp?reserve=true&selectedTime="+selectedTime;
				
				//기존 예약자가 예약 변경이라면	
			}else if(change.equals("true")){
				MemberDAO.getInstance().chooseTimeSlot(selectedTime, userId);
				path = "rsuccess.jsp?change=true&selectedTime="+selectedTime;
			}

		}



		return new ModelAndView(path);
	}

}

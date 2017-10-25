package controller.dashboard;





import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import controller.ModelAndView;
import model.member.MemberDAO;



public class StopWatchController implements Controller{

	@Override
	public ModelAndView HandleRequest(HttpServletRequest request,HttpServletResponse response) throws Exception {
		
		String userId =request.getParameter("userId");
		String command =request.getParameter("command");
		
		System.out.println("StopWatchController의 userId:"+userId);
		System.out.println("StopWatchController의 command:"+command);
		
		
		
	
		
		//startTime ,finishTime 누를시 로그에 입력됨!
		
		if(command.equals("startTime")){
			
			MemberDAO.getInstance().updateStartTime(userId);
		}else if(command.equals("finishTime")){
			MemberDAO.getInstance().updateFinishTime(userId);
			
		}
		
		
		
		
		String path = "starTime.jsp";
		

		return new ModelAndView(path);
	}
}



















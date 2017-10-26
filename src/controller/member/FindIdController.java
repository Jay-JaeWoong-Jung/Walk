package controller.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import controller.ModelAndView;
import model.member.MemberDAO;

public class FindIdController implements Controller {

	@Override
	public ModelAndView HandleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("findId 컨트롤러 실행...");
		
	
		//폼에서 3개 받아서
		String userName = request.getParameter("userName");
		String emailId = request.getParameter("emailId");
		String emailAdd = request.getParameter("emailAdd");
		//메소드 호출해서 Id 알아내고
		String userId=MemberDAO.getInstance().findIdByEmail(userName, emailId, emailAdd);
		
		request.setAttribute("userName", userName);
		request.setAttribute("emailId", emailId);
		request.setAttribute("emailAdd", emailAdd);
		//Id 바인딩해서  호출한 화면에 게시!
		request.setAttribute("userId", userId);
		
		return new ModelAndView("findId.jsp");
	}

}

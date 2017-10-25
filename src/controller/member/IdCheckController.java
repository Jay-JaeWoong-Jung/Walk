package controller.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import controller.ModelAndView;
import model.member.MemberDAO;

public class IdCheckController implements Controller {
	
	@Override
	public ModelAndView HandleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("idcheck 컨트롤러입성");
		String userId = request.getParameter("userId");
		boolean result=MemberDAO.getInstance().idCheck(userId);
		
		request.setAttribute("userId", userId);
		request.setAttribute("result", result);
		
		return new ModelAndView("idCheck.jsp");
	}

}

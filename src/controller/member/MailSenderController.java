package controller.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import controller.ModelAndView;
import model.member.MemberDAO;

public class MailSenderController implements Controller {

	@Override
	public ModelAndView HandleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MailSenderController 실행중....");
		String userId = request.getParameter("userId");
		
		MailSender ms=null;
		ms.sendTemporaryPassword(userId);
		request.setAttribute("userId", userId);

		
		return new ModelAndView("mailSenderProc.jsp");
	}
}

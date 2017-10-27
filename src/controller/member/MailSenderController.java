package controller.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import controller.ModelAndView;
import model.member.MemberDAO;
import model.member.MemberVO;

public class MailSenderController implements Controller {
	boolean result = false;

	@Override
	public ModelAndView HandleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MailSenderController 실행중....");
		String userName = request.getParameter("userName");
		String emailId = request.getParameter("emailId");
		String emailAdd = request.getParameter("emailAdd");

		System.out.println("userName: " + userName);
		System.out.println("emailId: " + emailId);
		System.out.println("emailAdd: " + emailAdd);

		String userId = MemberDAO.getInstance().findIdByEmail(userName, emailId, emailAdd);

		if (MemberDAO.getInstance().isExist(userId)) {
			MailSender.sendTemporaryPassword(userId, emailId + emailAdd);
			result = true;
			System.out.println(userId + "에게 임시비번 전송");

			request.setAttribute("userName", userName);
			request.setAttribute("emailId", emailId);
			request.setAttribute("emailAdd", emailAdd);
			
			return new ModelAndView("mailSender.jsp");

		} else {
			System.out.println("userId없어서 전송 안됨....");
			result = false;
		}


		request.setAttribute("result", result);
		


		return new ModelAndView("newMain.jsp");
	}
}

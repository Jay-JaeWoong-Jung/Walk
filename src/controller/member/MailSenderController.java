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
			result = true;
			MailSender.sendTemporaryPassword(userId);
			return new ModelAndView("mailSender.jsp");
			} else {
			result = false;
		}
		String authNum = request.getParameter("authNum");
		MemberVO vo=MemberDAO.getInstance().getMemberInfo(userId);
		String tempPass=vo.getUserPass();
		if (tempPass.equals(authNum)) {
			result = true;
		}
		request.setAttribute("result", result);
		// return new ModelAndView(DispatcherServlet?command=..&result=+result);
		return new ModelAndView("newMain.jsp");
	}
}

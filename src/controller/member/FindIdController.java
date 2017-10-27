package controller.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import controller.ModelAndView;
import model.member.MemberDAO;

public class FindIdController implements Controller {

	@Override
	public ModelAndView HandleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String userId = "";
		System.out.println("findId 컨트롤러 실행...");

		String userName = request.getParameter("userName");
		String emailId = request.getParameter("emailId");
		String emailAdd = request.getParameter("emailAdd");

		System.out.println("userName: " + userName);
		System.out.println("emailId: " + emailId);
		System.out.println("emailAdd: " + emailAdd);
		boolean findIdResult = MemberDAO.getInstance().nameExist(userName);
		if (findIdResult) {

			// 메소드 호출해서 Id 알아내고
			userId = MemberDAO.getInstance().findIdByEmail(userName, emailId, emailAdd);
			System.out.println(userId);
			
			request.setAttribute("userName", userName);
			request.setAttribute("emailId", emailId);
			request.setAttribute("emailAdd", emailAdd);
			// Id 바인딩해서 호출한 화면에 게시!
			request.setAttribute("userId", userId);
			// findIdResult = MemberDAO.getInstance().isExist(userId);
			// 폼에서 3개 받아서
			request.setAttribute("findIdResult", findIdResult);
			return new ModelAndView("findIdProc.jsp?userId=" + userId+"&&findIdResult="+findIdResult);
		} else {
			return new ModelAndView("findIdProc.jsp?userId=" + userId+"&&findIdResult="+findIdResult);
		}
	}
}

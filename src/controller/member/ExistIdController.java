package controller.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import controller.ModelAndView;
import model.member.MemberDAO;

public class ExistIdController implements Controller {

	@Override
	public ModelAndView HandleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("ExistIdController 실행중....");

		String findId = request.getParameter("findId");
		boolean result = false;
		System.out.println("findId" + findId);
		result = MemberDAO.getInstance().isExist(findId);
		if (result) {
			return new ModelAndView("mailSender.jsp");

		}

		return new ModelAndView("mailSender.jsp");
	}
}

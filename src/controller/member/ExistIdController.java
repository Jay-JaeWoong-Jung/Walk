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

		String findIdforfindPass = request.getParameter("findIdforfindPass");
		boolean result = false;

		System.out.println("findIdforfindPass:" + findIdforfindPass);

		result = MemberDAO.getInstance().isExist(findIdforfindPass);
		if (result) {

			return new ModelAndView("mailSender.jsp");

		} else {
			request.setAttribute("result", result);
			System.out.println("아이디 없음.. 비밀번호찾기 프로세스 실패....");
			return new ModelAndView("ExistId.jsp?result="+result);
		}
	}
}

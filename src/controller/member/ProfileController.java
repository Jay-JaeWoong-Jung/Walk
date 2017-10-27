package controller.member;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Controller;
import controller.ModelAndView;
import model.member.LogDAO;
import model.member.MemberVO;

public class ProfileController implements Controller {

	@Override 
	public ModelAndView HandleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// get statistics
		System.out.println("프로파일 컨트롤러 입장");

		HttpSession session = request.getSession();
		MemberVO vo = (MemberVO) session.getAttribute("mvo");
		String userId = vo.getUserId();
		int wk = LogDAO.getInstance().getWeeklyAttananceById(userId);
		int mth = LogDAO.getInstance().getMonthlyAttananceById(userId);

		vo.setWeeklyAttendance(wk);
		vo.setMonthlyAttendance(mth);
		return new ModelAndView("newProfile.jsp", false);
	}

}

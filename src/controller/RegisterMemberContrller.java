package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.MemberDAO;
import model.MemberVO;

public class RegisterMemberContrller implements Controller {

	@Override
	public ModelAndView HandleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		MemberVO vo=null;
		boolean flag=MemberDAO.getInstance().registerMember(vo);
		request.setAttribute("flag", flag);
		
		return new ModelAndView("main.jsp");
	}

}

package controller;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.MemberDAO;
import model.MemberVO;

public class RegisterMemberContrller implements Controller {

	@Override
	public ModelAndView HandleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
				  
		String userName=request.getParameter("userName");
		String userId=request.getParameter("userId");
		String userPass=request.getParameter("userPass");
		String phone1=request.getParameter("phone1");
		String phone2=request.getParameter("phone2");
		String phone3=request.getParameter("phone3");
		String emailId=request.getParameter("emailId");
		String emailAdd=request.getParameter("emailAdd");
		String birth=request.getParameter("birthday");
		int gender=Integer.parseInt(request.getParameter("gender"));
		String emailAccept=request.getParameter("emailAccept");
		/*if(birth == "") {
			
			birth="1983-09-15";
		}*/
		
		if(emailAccept == null) {
			emailAccept="n";
		}
		String profile=request.getParameter("profile");
		MemberVO vo=new MemberVO(userId, userPass, userName, phone1, phone2, phone3, gender, emailId, emailAdd, birth,emailAccept,profile);
		System.out.println(vo);
		int regResult=MemberDAO.getInstance().registerMember(vo);
		System.out.println("regResult:"+regResult);
		System.out.println("emailAccept:"+emailAccept);
		request.setAttribute("regResult", regResult);
		
		return new ModelAndView("regProc.jsp");
	}

}

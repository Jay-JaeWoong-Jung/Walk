package controller.member;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import controller.ModelAndView;
import model.member.MemberDAO;
import model.member.MemberVO;

public class RegisterMemberController implements Controller {

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
	
		if(emailAccept == null) {
			emailAccept="n";
		}
		
		
		System.out.println("username:"+userName);
		System.out.println("userId:"+userId);
		System.out.println("userPass:"+userPass);
		System.out.println("phone1:"+phone1);
		System.out.println("phone2:"+phone2);
		System.out.println("phone3:"+phone3);
		System.out.println("emailId:"+emailId);
		System.out.println("emailAdd:"+emailAdd);
		System.out.println("birth:"+birth);
		System.out.println("gender:"+gender);
		System.out.println("emailAccept:"+emailAccept);
		
		String profile=request.getParameter("profile");
		MemberVO vo=new MemberVO(userId, userPass, userName, phone1, phone2, phone3, gender, emailId, emailAdd, birth,emailAccept,profile);
		System.out.println("회원가입후 VO:"+vo);
		int regResult=MemberDAO.getInstance().registerMember(vo);
		System.out.println("regResult:"+regResult);
		System.out.println("emailAccept:"+emailAccept);
		request.setAttribute("regResult", regResult);
		
		
		if(regResult=='0') {
			PrintWriter out = response.getWriter();
			
			response.setContentType("text/html; charset=utf-8");
			out.println("<script language='javascript'>");
			out.println("alert('다시 입력하여 주세요!');");
			out.println("</script>");
			out.flush();
		}
		
		
		
		
		return new ModelAndView("newMain.jsp"); // regProc로 안가고 newMain으로 이동
	}

}
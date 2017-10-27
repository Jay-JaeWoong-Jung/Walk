package controller.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import controller.ModelAndView;
import model.member.MemberDAO;
import model.member.MemberVO;

public class tempPassAuthController implements Controller {
	
	@Override
	public ModelAndView HandleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("tempPassAuthController 실행중....");
		boolean authNumResult=false;
		String authNum = request.getParameter("authNum");
		System.out.println("authNum: " + authNum);
		
		
		//MemberVO vo=MemberDAO.getInstance().getMemberInfo(userId);
		String userPass = vo.getUserPass();
		if (authNum.equals(userPass)) {
			
			authNumResult=true;
			
			return new ModelAndView("mailSenderProc.jsp?authNumResult="+ authNumResult);
		} else {
			
			authNumResult = false;
		}
		
	
		request.setAttribute("authNumResult", authNumResult);
		return new ModelAndView("mailSenderProc.jsp?authNumResult="+ authNumResult);
	}
}

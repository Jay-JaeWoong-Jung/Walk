package controller.member;

import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import controller.Controller;
import controller.ModelAndView;
import model.member.MemberDAO;
import model.member.MemberVO;

public class UpdateController implements Controller {

	@Override
	public ModelAndView HandleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String upload_path="c:/upload";
		int size=10*1024*1024; 
		MultipartRequest multi = new MultipartRequest(
			      request, upload_path, size, "utf-8",
			      new DefaultFileRenamePolicy());
		Enumeration files=multi.getFileNames();
		 String file=(String)files.nextElement();//1번 파일
		 String profile=multi.getFilesystemName(file);
		 System.out.println("profile 이름:"+profile);
		String userName=multi.getParameter("userName");
		String userId=multi.getParameter("userId");
		String userPass=multi.getParameter("userPass");
		String phone1=multi.getParameter("phone1");
		String phone2=multi.getParameter("phone2");
		String phone3=multi.getParameter("phone3");
		String emailId=multi.getParameter("emailId");
		String emailAdd=multi.getParameter("emailAdd");
		String birth=multi.getParameter("birthday");
		int gender=Integer.parseInt(multi.getParameter("gender"));
		String emailAccept=multi.getParameter("emailAccept");
		
		System.out.println("업데이트 컨트로러 입성");
	System.out.println("userId"+userId);
		if(emailAccept == null) {
			emailAccept="n";
		}
		
		MemberVO vo=new MemberVO(userId, userPass, userName, phone1, phone2, phone3, gender, emailId, emailAdd, birth,emailAccept,profile);
		System.out.println(vo);
		int updateResult=MemberDAO.getInstance().updateMember(vo);
		System.out.println("regResult:"+updateResult);
		System.out.println("emailAccept:"+emailAccept);
		request.setAttribute("regResult", updateResult);
		
		return new ModelAndView("updateProc.jsp");
	}

}

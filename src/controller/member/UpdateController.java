package controller.member;

import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import controller.Controller;
import controller.ModelAndView;
import model.member.MemberDAO;
import model.member.MemberVO;

public class UpdateController implements Controller {

	@Override
	public ModelAndView HandleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("업데이트 컨트로러 입성");
		int size=10*1024*1024;
		int updateResult=0;
		String upload="upload";
		//String upload_path="C:/Intel\\jwj\\webProgram\\eclipse\\workspace\\project_Walk\\WebContent\\upload";
		
		
		ServletContext context= request.getServletContext();
        String upload_path=request.getRealPath(upload);
        System.out.println("upload_path:"+upload_path);
        
		MultipartRequest multi = new MultipartRequest(
			      request, upload_path, size, "utf-8",
			      new DefaultFileRenamePolicy());
		
		String profile =multi.getFilesystemName("file");
		
		 /*String file=(String)files.nextElement();//1번 파일
		 String profile=multi.getFilesystemName(file);*/
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
		
		
		System.out.println("userId:"+userId);
		if(emailAccept == null) {
			emailAccept="n";
		}
		MemberVO vo=new MemberVO(userId, userPass, userName, phone1, phone2, phone3, gender, emailId, emailAdd, birth,emailAccept,profile);
		System.out.println(vo);
		updateResult=MemberDAO.getInstance().updateMember(vo);
		System.out.println("updateResult:"+updateResult);
		System.out.println("emailAccept:"+emailAccept);
		request.setAttribute("updateResult", updateResult);
		
		HttpSession session =request.getSession(false);
		session.setAttribute("mvo", vo);
		

		
		return new ModelAndView("updateProc.jsp");
	}

}

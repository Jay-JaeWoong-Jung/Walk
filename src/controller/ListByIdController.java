package controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.BoardDao;
import model.BoardVO;
import model.MemberDAO;
import model.MemberVO;

public class ListByIdController implements Controller {

	@Override
	public ModelAndView HandleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//String userId =request.getParameter("userId");
		
		HttpSession session = request.getSession();
		//System.out.println("$$$$$$ListByIdController....sessionid :: "+session.getId());
		MemberVO mvo = (MemberVO)session.getAttribute("mvo");
		
		
		
		System.out.println("==============================================111"+mvo.getUserId());
		ArrayList<BoardVO> rlist=BoardDao.getInstance().getAllPostById(mvo.getUserId());
		System.out.println("rlist출력````````````````````"+rlist);
		request.setAttribute("list",rlist );
		
		return new ModelAndView("blog_show_list.jsp");
	}

}

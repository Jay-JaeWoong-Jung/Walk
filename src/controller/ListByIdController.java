package controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.BoardDao;
import model.BoardVO;
import model.MemberDAO;

public class ListByIdController implements Controller {

	@Override
	public ModelAndView HandleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		System.out.println("$$$$$$ListByIdController....sessionid :: "+session.getId());
		String userId = (String) session.getAttribute("userId");
		
		System.out.println("=============================================="+userId);
		ArrayList<BoardVO> rlist=BoardDao.getInstance().getAllPostById(userId);
		System.out.println("rlist출력````````````````````"+rlist);
		request.setAttribute("list",rlist );
		
		return new ModelAndView("blog_show_list.jsp");
	}

}

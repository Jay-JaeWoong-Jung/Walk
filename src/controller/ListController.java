package controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import model.BoardDao;
import model.BoardVO;

public class ListController implements Controller {

	@Override
	public ModelAndView HandleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String date = request.getParameter("date");
		System.out.println("무엇이 온건가 "+ date);
		if(date.charAt(4)=='-') {
			date = date.replaceAll("-", "/");
		}
		System.out.println("바뀌면 대박"+ date);

		ArrayList<BoardVO> rlist=BoardDao.getInstance().getAllpostByDate(date);
		
		System.out.println("getAllPost()...call...");
		
		request.setAttribute("list", rlist);
		return new ModelAndView("blog_show_list.jsp");
	}

}

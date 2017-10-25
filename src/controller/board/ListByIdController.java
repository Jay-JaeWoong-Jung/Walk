package controller.board;	

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Controller;
import controller.ModelAndView;
import model.board.BoardDao;
import model.board.BoardVO;

public class ListByIdController implements Controller {

	@Override
	public ModelAndView HandleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userId");
		
		ArrayList<BoardVO> rlist=BoardDao.getInstance().getAllPostById(userId);
		
		request.setAttribute("list",rlist );
		
		return new ModelAndView( "blog_show_list.jsp");
	}

}

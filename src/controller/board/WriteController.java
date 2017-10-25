package controller.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import controller.ModelAndView;
import model.board.BoardDao;
import model.board.BoardVO;

public class WriteController implements Controller {
	@Override
	public ModelAndView HandleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String content = request.getParameter("content");
		String userId = request.getParameter("userId");
//		String userId = "asdfcc";Session("writer")
		
		
		
		BoardVO pvo = new BoardVO(userId, content);
		
		BoardDao.getInstance().posting(pvo);
		
		String path = "DispatcherServlet?command=todayDate";
		return new ModelAndView(path, true); // 전형적인 Redirect 방식
	}
}

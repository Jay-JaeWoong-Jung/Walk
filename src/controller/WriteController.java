package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BoardDao;
import model.BoardVO;

public class WriteController implements Controller {
	@Override
	public ModelAndView HandleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String content = request.getParameter("content");
		String writer = request.getParameter("writer");
		String password = request.getParameter("password");
		
		
		BoardVO pvo = new BoardVO(writer, password, content);
		
		BoardDao.getInstance().posting(pvo);
		
		String path = "DispatcherServlet?command=todayDate";
		return new ModelAndView(path, true); // 전형적인 Redirect 방식
	}
}

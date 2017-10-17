package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BoardDao;
import model.BoardVO;

public class WriteController implements Controller {
	@Override
	public ModelAndView HandleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String title = request.getParameter("title");
		String writer = request.getParameter("writer");
		String password = request.getParameter("password");
		String content = request.getParameter("content");
		
		BoardVO pvo = new BoardVO(title, writer, password, content);
		
		BoardDao.getInstance().posting(pvo);
		
		String path = "DispatcherServlet?command=showContent&&no="+pvo.getNo();
		

		return new ModelAndView(path, true); // 전형적인 Redirect 방식
	}
}

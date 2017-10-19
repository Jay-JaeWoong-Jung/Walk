package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BoardDao;
import model.BoardVO;

public class EditContentController implements Controller {

	@Override
	public ModelAndView HandleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int no = Integer.parseInt(request.getParameter("no"));
		String content = request.getParameter("content");
		
		BoardVO pvo = new BoardVO(no, content);
		BoardDao.getInstance().updateContent(pvo);
		
//		String path = "DispatcherServlet?command=list";
		
//		return new ModelAndView(path, true); // 전형적인 Redirect 방식
		String path ="blog_edit_update_result.jsp";
		return new ModelAndView(path);
	}

}

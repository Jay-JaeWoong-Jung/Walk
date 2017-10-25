package controller.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import controller.ModelAndView;
import model.board.BoardDao;
import model.board.BoardVO;

public class EditContentController implements Controller {

	@Override
	public ModelAndView HandleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int no = Integer.parseInt(request.getParameter("no"));
		String content = request.getParameter("content");
		String date = request.getParameter("date");
		
		System.out.println("edit cont no::"+no);
		System.out.println("edit cont date::"+date);
		System.out.println("content!!!!::"+content);
		BoardVO pvo = new BoardVO(no, content);
		BoardDao.getInstance().updateContent(pvo);
		
		String path = "DispatcherServlet?command=list&&date="+date;
		
//		return new ModelAndView(path, true); // 전형적인 Redirect 방식
	
		return new ModelAndView(path, true);
	}

}

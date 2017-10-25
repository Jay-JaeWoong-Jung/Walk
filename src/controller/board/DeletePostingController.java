package controller.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import controller.ModelAndView;
import model.board.BoardDao;

public class DeletePostingController implements Controller {

	@Override
	public ModelAndView HandleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int no = Integer.parseInt(request.getParameter("no"));
		System.out.println("deletePosting::"+no);
		BoardDao.getInstance().deletePosting(no);
		
		String path = "DispatcherServlet?command=todayDate";  // HandlerMapping 거쳐서 ListController 가기위함.
		
		return new ModelAndView(path,true);
	}

}

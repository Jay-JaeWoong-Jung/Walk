package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.BoardDao;
import model.BoardVO;

public class CheckIdController implements Controller {

	@Override
	public ModelAndView HandleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		boolean flag;
		String path = "";
		int no =Integer.parseInt(request.getParameter("no"));
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userId");
		
		BoardVO pvo = new BoardVO(no, userId);
		flag = BoardDao.getInstance().checkId(no, userId);
		
		if(flag==true) {
			path = "DispathcerServlet?command=editContent";
		}
		
		return new ModelAndView(path,true);
	}

}

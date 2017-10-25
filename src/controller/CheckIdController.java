package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.BoardDao;


public class CheckIdController implements Controller {

	@Override
	public ModelAndView HandleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		boolean flag;
		String path = "";
		int no =Integer.parseInt(request.getParameter("no"));
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userId");
		
		
		flag = BoardDao.getInstance().checkId(no, userId);
		
		if(flag==true) {
			path = "blog_show_list.jsp?#${bvo.no}";
		}
		
		return new ModelAndView(path,true);
	}

}

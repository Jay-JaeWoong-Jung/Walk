package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BoardDao;

public class DeleteCheckPasswordController implements Controller {

	@Override
	public ModelAndView HandleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//no, password
		int no = Integer.parseInt(request.getParameter("no"));
		System.out.println("no ::"+no);
		String pass = request.getParameter("password");
		
		boolean flag= BoardDao.getInstance().checkPassword(no, pass);
		request.setAttribute("flag", flag);
		
		return new ModelAndView("blog_delete_checkpass_result.jsp",false);
	}

}

package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BoardDao;
import model.BoardVO;

public class EditCheckPasswordController implements Controller {

	@Override
	public ModelAndView HandleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int no = Integer.parseInt(request.getParameter("no"));
		/*String date =request.getParameter("timePosted");*/
		
		System.out.println("no ::"+no);
		
		String pass = request.getParameter("password");
		String path = "";
		boolean flag= BoardDao.getInstance().checkPassword(no, pass);
		if(flag==true) {
			BoardVO list = BoardDao.getInstance().getPostingByNo(no);
			
			request.setAttribute("list", list);
			path = "blog_edit_updateform.jsp?result=ok";
		}else{
			path = "blog_edit_updateform.jsp?";
		}
		
		
		
		return new ModelAndView(path,false);
	}

}

package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BoardDao;

public class TodayDateController implements Controller {

	@Override
	public ModelAndView HandleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String date = BoardDao.getInstance().getTodayDate();
		System.out.println("controller date"+date);
		
		//request.setAttribute("date", date);
		String path ="DispatcherServlet?command=list&&date="+date;
		
		
		return new ModelAndView(path, true); 
	}

}

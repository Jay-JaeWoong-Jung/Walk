package controller;

import java.util.ArrayList;
import java.util.Collections;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.MagicNumbers;
import model.MemberDAO;

public class GenerateGroups implements Controller{

	@Override
	public ModelAndView HandleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ArrayList<String> list = MemberDAO.getInstance().getUserIDsByTimeSlot(1);
		String path = "dashboard.jsp";
		if (list.size()==1) {
			path="singleReservationCase.jsp";
		} else {
			Collections.shuffle(list);
			for(int i=0; i<list.size(); i++) {
				int flag = i % MagicNumbers.GROUP_SIZE;
				MemberDAO.getInstance().updateAssignedGroup(list.get(i), flag);
			}
		}
		return new ModelAndView(path, false);
	}
	

}

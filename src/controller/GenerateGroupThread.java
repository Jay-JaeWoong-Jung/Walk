package controller;

import java.util.ArrayList;
import java.util.Collections;

import javafx.util.Pair;
import model.MagicNumbers;
import model.MemberDAO;

public class GenerateGroupThread implements Runnable {

	@Override
	public void run(){
		try {
			ArrayList<String> list = MemberDAO.getInstance().getUserIDsByTimeSlot(1);

			Collections.shuffle(list);
			for(int i=0; i<list.size(); i++) {
				int flag = i % MagicNumbers.GROUP_SIZE;
				MemberDAO.getInstance().updateAssignedGroup(list.get(i), flag);
			}
			ArrayList<Pair<String, Integer>> resultList = MemberDAO.getInstance().getUserIdFlagPairByTimeSlot(1);
			System.out.println(resultList);
			
		} catch(Exception e) {
			
		}
		
	}
		
	
	

}

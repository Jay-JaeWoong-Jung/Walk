package controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.TimerTask;

import javafx.util.Pair;
import model.MagicNumbers;
import model.MemberDAO;

public class JobTimer extends TimerTask{
	
private int timeSlot;
	
	
	public JobTimer(int timeSlot) {
		super();
		this.timeSlot = timeSlot;
	}


	
	public void run(){
		try {
			ArrayList<String> list = MemberDAO.getInstance().getUserIDsByTimeSlot(timeSlot);
			
			Collections.shuffle(list);
			System.out.println("선택시간:" + timeSlot);
			
			for(int i=0; i<list.size(); i++) {
				int flag = i % MagicNumbers.GROUP_SIZE;
				MemberDAO.getInstance().updateAssignedGroup(list.get(i), flag);
			}
			ArrayList<Pair<String, Integer>> resultList = MemberDAO.getInstance().getUserIdFlagPairByTimeSlot(timeSlot);
			System.out.println("그룹할당 결과:" + resultList);
			
		} catch(Exception e) {
			
		}
		
	}
}
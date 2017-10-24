package controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.TimerTask;

import constants.MagicNumbers;
import javafx.util.Pair;
import model.MemberDAO;

public class JobTimer extends TimerTask{
	
private int timeSlot;
	
	
	public JobTimer(int timeSlot) {
		super();
		this.timeSlot = timeSlot;
	}


	
	public void run(){
		try {
			if(timeSlot != 0){
				
			
			ArrayList<String> list = MemberDAO.getInstance().getUserIDsByTimeSlot(timeSlot);
			
			Collections.shuffle(list);
			System.out.println("선택시간:" + timeSlot);
			System.out.println("현재 list.size():"+list.size());
			for(int i=0; i<list.size(); i++) {
				int groupColor = i % (list.size() / MagicNumbers.GROUP_SIZE)+1 ;
				MemberDAO.getInstance().updateAssignedGroup(list.get(i), groupColor);
				
				
			}
			ArrayList<Pair<String, Integer>> resultList = MemberDAO.getInstance().getUserIdgroupColorPairByTimeSlot(timeSlot);
			System.out.println("그룹할당 결과:" + resultList);
			
			}else if(timeSlot == 0){
				System.out.println("슬럿 0:" + timeSlot);
				MemberDAO.getInstance().cleargroupColorNTime(timeSlot, timeSlot);
				
			}
		} catch(Exception e) {
			
		}
		
	}
}
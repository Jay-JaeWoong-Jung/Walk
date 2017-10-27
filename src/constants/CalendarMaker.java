package constants;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class CalendarMaker {
	public String calendar;
	
	private static CalendarMaker ck = new CalendarMaker();
	
	private CalendarMaker() {
		
	}
	
	public  static CalendarMaker  getInstance(){
		return ck;
	}
	
	
	public String setCalendar(int hour, int minute){
		
		Calendar date= Calendar.getInstance();
		date.set(Calendar.HOUR_OF_DAY, hour);
		date.set(Calendar.MINUTE, minute);	
		Date d= date.getTime();
		SimpleDateFormat sdf = new java.text.SimpleDateFormat("HHmm");
		String time = sdf.format(d);
		
		return time;
		
		
	}
	
	
public Date makeCalendar(int hour, int minute){
		
		Calendar date= Calendar.getInstance();
		date.set(Calendar.HOUR_OF_DAY, hour);
		date.set(Calendar.MINUTE, minute);	
		date.set(Calendar.SECOND, 00);	
		Date d= date.getTime();
		
		
		
		return d;
		
		
	}
	
	
	
	

}

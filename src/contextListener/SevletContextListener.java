package contextListener;


import java.util.Date;
import java.util.Timer;


import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import constants.CalendarMaker;
import constants.MagicNumbers;
import contextListener.jobScheduler.JobTimer;

public class SevletContextListener implements ServletContextListener{


	
	@Override
	public void contextDestroyed(ServletContextEvent event) {

	}
 
	@Override
	public void contextInitialized(ServletContextEvent event) {



//		Timer timer = new Timer();
//		
//		Date date1 = CalendarMaker.getInstance().makeCalendar(23,28);
//		timer.schedule(new JobTimer(1), date1 ,24*60*60*1000);
		
		

//		Date date1 = CalendarMaker.getInstance().makeCalendar(11,15);
//		Date date2 = CalendarMaker.getInstance().makeCalendar(11,45);
//		Date date3 = CalendarMaker.getInstance().makeCalendar(12,15);
//		Date date4 = CalendarMaker.getInstance().makeCalendar(12,45);
//		Date date5 = CalendarMaker.getInstance().makeCalendar(13,15);
//		Date date6 = CalendarMaker.getInstance().makeCalendar(13,45);
//		Date date7 = CalendarMaker.getInstance().makeCalendar(23,59);
//		

		


//		timer.schedule(new JobTimer(1), date1 ,24*60*60*1000);
//		timer.schedule(new JobTimer(2), date2 ,24*60*60*1000);
//		timer.schedule(new JobTimer(3), date3 ,24*60*60*1000);
//		timer.schedule(new JobTimer(4), date4 ,24*60*60*1000);
//		timer.schedule(new JobTimer(5), date5 ,24*60*60*1000);
//		timer.schedule(new JobTimer(6), date6 ,24*60*60*1000);	

//		timer.schedule(new JobTimer(MagicNumbers.RESET_VAL_SELECTEDTIME_FLAG), date7 ,24*60*60*1000);

		
		
	}

}

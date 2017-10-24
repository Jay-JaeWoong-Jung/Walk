package servlet;

import java.util.Calendar;
import java.util.Timer;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import constants.MagicNumbers;
import controller.JobTimer;

public class SevletContextListener implements ServletContextListener{

//	private ScheduledExecutorService scheduler;
	
	@Override
	public void contextDestroyed(ServletContextEvent event) {
//		scheduler.shutdownNow();
	}

	@Override
	public void contextInitialized(ServletContextEvent event) {

		Timer timer = new Timer();
		Calendar date1 = Calendar.getInstance();
		date1.set(Calendar.HOUR_OF_DAY,19);
		date1.set(Calendar.MINUTE,34);
		date1.set(Calendar.SECOND,5);
		date1.set(Calendar.MILLISECOND,0);
		
		Calendar date2 = Calendar.getInstance();
		date2.set(Calendar.HOUR_OF_DAY,19);
		date2.set(Calendar.MINUTE,34);
		date2.set(Calendar.SECOND,10);
		date2.set(Calendar.MILLISECOND,0);
		
		Calendar date3 = Calendar.getInstance();
		date3.set(Calendar.HOUR_OF_DAY,19);
		date3.set(Calendar.MINUTE,34);
		date3.set(Calendar.SECOND,15);
		date3.set(Calendar.MILLISECOND,0);
		
		Calendar date4 = Calendar.getInstance();
		date4.set(Calendar.HOUR_OF_DAY,19);
		date4.set(Calendar.MINUTE,34);
		date4.set(Calendar.SECOND,20);
		date4.set(Calendar.MILLISECOND,0);
		
		Calendar date5 = Calendar.getInstance();
		date5.set(Calendar.HOUR_OF_DAY,19);
		date5.set(Calendar.MINUTE,34);
		date5.set(Calendar.SECOND,25);
		date5.set(Calendar.MILLISECOND,0);
		
		Calendar date6 = Calendar.getInstance();
		date6.set(Calendar.HOUR_OF_DAY,19);
		date6.set(Calendar.MINUTE,34);
		date6.set(Calendar.SECOND,30);
		date6.set(Calendar.MILLISECOND,0);
		
		
		
		
		
		Calendar date7 = Calendar.getInstance();
		date7.set(Calendar.HOUR_OF_DAY,23);
		date7.set(Calendar.MINUTE,59);
		date7.set(Calendar.SECOND,59);
		date7.set(Calendar.MILLISECOND,0);

//		timer.schedule(new JobTimer(1), date1.getTime() ,60*1000);
//		timer.schedule(new JobTimer(2), date2.getTime() ,60*1000);
//		timer.schedule(new JobTimer(3), date3.getTime() ,60*1000);
//		timer.schedule(new JobTimer(4), date4.getTime() ,60*1000);
//		timer.schedule(new JobTimer(5), date5.getTime() ,60*1000);
//		timer.schedule(new JobTimer(6), date6.getTime() ,60*1000);	
//		timer.schedule(new JobTimer(MagicNumbers.RESET_VAL_SELECTEDTIME_FLAG), date7.getTime() ,60*1000);
		
		
		
//		scheduler = Executors.newSingleThreadScheduledExecutor();
//		scheduler.schedule(new GenerateGroupThread(1), 5, TimeUnit.SECONDS);
//		scheduler.schedule(new GenerateGroupThread(2), 10, TimeUnit.SECONDS);
//		scheduler.schedule(new GenerateGroupThread(3), 15, TimeUnit.SECONDS);
//		scheduler.schedule(new GenerateGroupThread(4), 20, TimeUnit.SECONDS);
//		scheduler.schedule(new GenerateGroupThread(5), 25, TimeUnit.SECONDS);
//		scheduler.schedule(new GenerateGroupThread(6), 30, TimeUnit.SECONDS);

		//scheduler.schedule(new ResetGroupThread(), 10, unit)
	}

}

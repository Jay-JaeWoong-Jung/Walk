package servlet;

import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import controller.GenerateGroupThread;

public class SevletContextListener implements ServletContextListener{

	private ScheduledExecutorService scheduler;
	
	@Override
	public void contextDestroyed(ServletContextEvent event) {
		scheduler.shutdownNow();
	}

	@Override
	public void contextInitialized(ServletContextEvent event) {

		scheduler = Executors.newSingleThreadScheduledExecutor();
		scheduler.schedule(new GenerateGroupThread(1), 5, TimeUnit.SECONDS);
		scheduler.schedule(new GenerateGroupThread(2), 10, TimeUnit.SECONDS);
		scheduler.schedule(new GenerateGroupThread(3), 15, TimeUnit.SECONDS);
		scheduler.schedule(new GenerateGroupThread(4), 20, TimeUnit.SECONDS);
		scheduler.schedule(new GenerateGroupThread(5), 25, TimeUnit.SECONDS);
		scheduler.schedule(new GenerateGroupThread(6), 30, TimeUnit.SECONDS);

		//scheduler.schedule(new ResetGroupThread(), 10, unit)
	}

}

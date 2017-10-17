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
		scheduler.schedule(new GenerateGroupThread(), 5, TimeUnit.SECONDS);
		System.out.println("scheduled!");
	}

}

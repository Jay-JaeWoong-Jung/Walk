package controller;

public class HandlerMapping {
	private static HandlerMapping hm = new HandlerMapping();
	private HandlerMapping() {}
	public static HandlerMapping getInstance() {
		return hm;
	}
	
	public Controller createController(String command){
		Controller controller = null;

		System.out.println("handler 입성");
		if(command.equals("reserve")){
			controller = new ReserveController();
		
		} else if(command.equals("dashboard")){
			controller = new DashboardController();
		}
		
		 
//		if(command.equals("")) controller = new ();
 
		return controller;
	}
}

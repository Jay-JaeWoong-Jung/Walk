package controller;

public class HandlerMapping {
	private static HandlerMapping hm = new HandlerMapping();
	private HandlerMapping() {}
	public static HandlerMapping getInstance() {
		return hm;
	}
	
	public Controller createController(String command){
		Controller controller = null;
<<<<<<< HEAD
		//if(command.equals("reserve")) controller = new ();
=======
		System.out.println("handler 입성");
		if(command.equals("reserve")){
			controller = new ReserveController();
		}else if(command.equals("Dashboard")){
			controller = new DashboardController();
		}
		
		
//		if(command.equals("")) controller = new ();
>>>>>>> 3455f91a5fe7fabfaeab92be0abddfc456788fde
//		if(command.equals("")) controller = new ();
//		if(command.equals("")) controller = new ();

		return controller;
	}
}

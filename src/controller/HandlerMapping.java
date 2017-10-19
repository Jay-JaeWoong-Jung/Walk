package controller;

public class HandlerMapping {
	private static HandlerMapping hm = new HandlerMapping();
	private HandlerMapping() {}
	public static HandlerMapping getInstance() {
		return hm;
	}
	
	public Controller createController(String command){
		Controller controller = null;
		
		if(command.equals("idCheck")) controller = new IdCheckController();
		if(command.equals("register")) controller = new RegisterMemberContrller();
		if(command.equals("login")) controller = new LoginController();
//		if(command.equals("")) controller = new ();

		return controller;
	}
}

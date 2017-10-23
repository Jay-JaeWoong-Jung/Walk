package controller;

public class HandlerMapping {
	private static HandlerMapping hm = new HandlerMapping();

	private HandlerMapping() {
	}

	public static HandlerMapping getInstance() {
		return hm;
	}

	public Controller createController(String command){
		Controller controller = null;

		System.out.println("handler 입성");
		if(command.equals("reserve")){
			controller = new ReserveController();
		}else if(command.equals("dashboard")){
			controller = new DashboardController();
		}else if(command.equals("reserveCancel")){
			controller = new ReserveCancelController();
		}else if (command.equals("register")) {
			controller = new RegisterMemberContrller();
		}else if (command.equals("login")){
			controller = new LoginController();
		}else if (command.equals("idCheck")) {
			controller = new IdCheckController();
		}else if (command.equals("logout")){
		controller = new LogoutController();
		}
	return controller;
	}
}


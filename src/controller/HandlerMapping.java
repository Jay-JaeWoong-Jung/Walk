package controller;

public class HandlerMapping {
	private static HandlerMapping hm = new HandlerMapping();

	private HandlerMapping() {
	}

	public static HandlerMapping getInstance() {
		return hm;
	}

	public Controller createController(String command) {
		Controller controller = null;


		
		
		if(command.equals("reserve")){


			controller = new ReserveController();
		} else if (command.equals("dashboard")) {
			controller = new DashboardController();
		} else if (command.equals("reserveCancel")) {
			controller = new ReserveCancelController();
		} else if (command.equals("register")) {
			controller = new RegisterMemberContrller();
		} else if (command.equals("login")) {
			controller = new LoginController();
		} else if (command.equals("idCheck")) {
			controller = new IdCheckController();
		} else if (command.equals("logout")) {
			controller = new LogoutController();
		} else if (command.equals("updateMember")) {
			controller = new UpdateController();
		} else if (command.equals("deleteMember")) {
			controller = new DeleteController();
		}else if (command.equals("startTime")) {
			controller = new StopWatchController();
		}else if (command.equals("finishTime")) {
			controller = new StopWatchController();	
		}else if (command.equals("cookieConfirm")) {
			controller = new CookieConfirmController();
			
			
		}else if(command.equals("write")) {
			controller = new WriteController();		
		}else if(command.equals("list") || command.equals("date")) {
			controller = new ListController();
		}else if(command.equals("deletePosting")) {
			controller = new DeletePostingController();
		}else if(command.equals("editContent")) {
			controller = new EditContentController();
		}else if(command.equals("todayDate")) {
			controller = new TodayDateController();
		}else if(command.equals("checkId")) {
			controller = new CheckIdController();
		}
		System.out.println("handler 입성"+controller+"컨트롤러 객체 생성");
		return controller;
	}
}

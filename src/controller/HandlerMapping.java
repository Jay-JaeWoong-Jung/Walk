package controller;

import controller.board.DeletePostingController;
import controller.board.EditContentController;
import controller.board.ListByIdController;
import controller.board.ListController;
import controller.board.TodayDateController;
import controller.board.WriteController;
import controller.dashboard.DashboardController;
import controller.dashboard.StopWatchController;

import controller.member.CookieConfirmController;
import controller.member.DeleteController;
import controller.member.IdCheckController;
import controller.member.LoginController;
import controller.member.LogoutController;
import controller.member.RegisterMemberController;
import controller.member.UpdateController;
import controller.reserve.ReserveCancelController;
import controller.reserve.ReserveController;

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
			controller = new RegisterMemberController();
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
		}else if(command.equals("listById")) {
			controller = new ListByIdController();
			System.out.println("ListByIdController 생성됬습니다..");
		}
		System.out.println("handler 입성"+controller+"컨트롤러 객체 생성");
		return controller;
	}

	/*public Controller createController(String command) {
		Controller controller = null;


		if(command.equals("reserve")){
			controller = new ReserveController();
		} else if (command.equals("dashboard")) {
			controller = new DashboardController();
		} else if (command.equals("reserveCancel")) {
			controller = new ReserveCancelController();
		} else if (command.equals("register")) {
			controller = new RegisterMemberController();
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
		}else if(command.equals("listById")) {
			controller = new ListByIdController();
		}
		System.out.println("handler 입성"+controller+"컨트롤러 객체 생성");
		return controller;
	}*/
}

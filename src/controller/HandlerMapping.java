package controller;

public class HandlerMapping {
	private static HandlerMapping hm = new HandlerMapping();
	private HandlerMapping() {}
	public static HandlerMapping getInstance() {
		return hm;
	}
	
	public Controller createController(String command){
		Controller controller = null;
//		if(command.equals("")) controller = new ();
//		if(command.equals("")) controller = new ();
//		if(command.equals("")) controller = new ();
		if(command.equals("write")) {
			controller = new WriteController();
		}else if(command.equals("list")) {
			controller = new ListController();
		}else if(command.equals("deleteCheckPassword")) {
			controller = new DeleteCheckPasswordController();
		}else if(command.equals("deletePosting")) {
			controller = new DeletePostingController();
		}else if(command.equals("editCheckPassword")) {
			controller = new EditCheckPasswordController();
		}else if(command.equals("editcontent")) {
			controller = new EditContentController();
		}

		return controller;
	}
}

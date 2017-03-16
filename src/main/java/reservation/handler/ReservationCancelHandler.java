package reservation.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.controller.CommandHandler;

public class ReservationCancelHandler implements CommandHandler {
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
			int rno = Integer.parseInt(req.getParameter("rno"));
			
			
		
			return "/WEB-INF/reservation/reservationConfirmForm.jsp";
		
	}

}

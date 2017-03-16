package reservation.handler;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.controller.CommandHandler;

public class ReservationCancelHandler implements CommandHandler {
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
			int rno = Integer.parseInt(req.getParameter("rno"));
			String rtimeString = req.getParameter("rtime");
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
			Date rtime = sdf.parse(rtimeString);
		
			return "/WEB-INF/reservation/reservationConfirmForm.jsp";
		
	}

}

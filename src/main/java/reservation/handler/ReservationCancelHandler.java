package reservation.handler;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import festival.model.Days;
import festival.model.DaysDao;
import festival.model.Seat;
import festival.model.SeatDao;
import member.model.MemberDao;
import member.model.User;
import mvc.controller.CommandHandler;
import mvc.util.MySqlSessionFactory;
import reservation.model.Reservation;
import reservation.model.ReservationDao;

public class ReservationCancelHandler implements CommandHandler {
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if (req.getMethod().equalsIgnoreCase("get")) {			
			return "/WEB-INF/reservation/reservationConfirmForm.jsp";
		}else if (req.getMethod().equalsIgnoreCase("post")) {			
			return "reservationModify.do";
		}
		return null;
	}

}

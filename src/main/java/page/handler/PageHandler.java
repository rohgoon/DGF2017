package page.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.User;
import mvc.controller.CommandHandler;

public class PageHandler implements CommandHandler  {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		String page = req.getParameter("page");
		User auth = (User)req.getSession().getAttribute("auth");

		if(page.equalsIgnoreCase("home")){
			return "template/home.jsp";
		}else if(page.equalsIgnoreCase("line-up")){
			return "lineupList.do";
		}else if(page.equalsIgnoreCase("tickets")){
			return "reservation.do?fesno=4&id=" + auth.getId();
		}else if(page.equalsIgnoreCase("info")){
			return "festivalList.do";
		}else if(page.equalsIgnoreCase("community")){
			return "community.do";
		}else if(page.equalsIgnoreCase("manager")){
			return "manager.jsp";
		}
		return null;
	}

}

package biz.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.controller.CommandHandler;

public class BizHandler implements CommandHandler {
	private final String FORM_VIEW = "/WEB-INF/biz/bizFront.jsp";
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if (req.getMethod().equalsIgnoreCase("get")) {			
			
			return FORM_VIEW;
		}else if (req.getMethod().equalsIgnoreCase("post")) {
			
		}
		return null;
	}

}

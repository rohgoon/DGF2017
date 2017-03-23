package admin.handler;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.controller.CommandHandler;

public class afNewHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if (req.getMethod().equalsIgnoreCase("get")) {
			return "/WEB-INF/admin/afNewForm.jsp";
		} else if (req.getMethod().equalsIgnoreCase("post")) {
			int no = Integer.parseInt(req.getParameter("no"));
			switch (no) {
			case 1:				
				return "/WEB-INF/admin/afNewForm.jsp";
			case 2:
				String sdate = req.getParameter("sdate");
				String edate = req.getParameter("edate");
				String place = req.getParameter("place");
				String[] grade = req.getParameterValues("grade");
				String[] price = req.getParameterValues("price");
				String[] ticket = req.getParameterValues("ticket");
				
				String[] sdArr = sdate.split("-");
				int[] sdIntArr = new int[3];					
				for (int i = 0; i < sdArr.length; i++) {
					sdIntArr[i] = Integer.parseInt(sdArr[i]);
				}
				String[] edArr = edate.split("-");
				int[] edIntArr = new int[3];
				for (int i = 0; i < edArr.length; i++) {
					edIntArr[i] = Integer.parseInt(edArr[i]);
				}
							
				//Date 클래스로 변환
				Date sd = new Date(sdIntArr[0], (sdIntArr[1]-1), sdIntArr[2]);
				Date ed = new Date(edIntArr[0], (edIntArr[1]-1), edIntArr[2]);
				long diff= ed.getTime() - sd.getTime();
				int gapDate = (int)(diff/ (1000 * 60 * 60 * 24));
				//Date 타입 List에 삽입
				List<Date> fesTypeDate = new ArrayList<>();
				fesTypeDate.add(sd);
				if (gapDate >1) {
					for (int i = 1; i < gapDate; i++) {
						sd.setDate(sd.getDate()+i);
						fesTypeDate.add(sd); //sd가 변화하니 주의
					}//
				} 
				fesTypeDate.add(ed);
				String[] fesDate = new String[fesTypeDate.size()];
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				int i =0;
				for (Date date : fesTypeDate) {
					fesDate[i] = sdf.format(date);
					i++;
				}
				req.setAttribute("fesDate", fesDate);
				return "/WEB-INF/admin/afNewForm2.jsp";

			default:
				
				return "/WEB-INF/admin/afNewForm.jsp";
			}

			
		}
		return null;
	}

}

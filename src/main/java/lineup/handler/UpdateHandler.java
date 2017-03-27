package lineup.handler;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import lineup.model.Lineup;
import lineup.model.LineupDao;
import mvc.controller.CommandHandler;
import mvc.util.MySqlSessionFactory;

public class UpdateHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if (req.getMethod().equalsIgnoreCase("get")){
			SqlSession sqlSession = MySqlSessionFactory.openSession();
			try {
				LineupDao dao = sqlSession.getMapper(LineupDao.class);
				int lno = Integer.parseInt(req.getParameter("lno"));
				Lineup lineup = dao.selectListById(lno);
				
				req.setAttribute("updateLineup", lineup);
				
			} finally {
				sqlSession.close();
			}
			return "/WEB-INF/view/lineupUpdate.jsp";
			
		} else if(req.getMethod().equalsIgnoreCase("post")){
			
			//---------------------------upload---------------------------//
			String uploadPath = req.getRealPath("upload");
			File dir = new File(uploadPath);
			if(dir.exists() == false){
				dir.mkdirs();
			}
			String filename1 = "";
			String filename2 = "";
			String origfilename1 = "";
			String origfilename2 = "";
			String keyfile1 = "";
			String keyfile2 = "";
			
			try{
				int size = 1024*1024*10;
				MultipartRequest multi = new MultipartRequest(req, uploadPath,
						size,
						"utf-8",
						new DefaultFileRenamePolicy());
				Enumeration files = multi.getFileNames(); //실제 업로드된 파일 정보
				/*ArrayList<String> arrfile = new ArrayList<>();*/
				
				keyfile1 = (String) files.nextElement(); //key1 받음
				filename1 = multi.getFilesystemName(keyfile1);
				origfilename1 = multi.getOriginalFileName(keyfile1);
				/*if(filename1 != null && !filename1.isEmpty()){
					arrfile.add(filename1);
				}*/
				
				/*keyfile2 = (String) files.nextElement(); //key2 받음
				filename2 = multi.getFilesystemName(keyfile2);
				origfilename2 = multi.getOriginalFileName(keyfile2);
				if(filename2 != null && !filename2.isEmpty()){
					arrfile.add(filename2);
				}*/
				//form name값 받아오기
				
				int lno = Integer.parseInt(multi.getParameter("lno"));
				int dno = Integer.parseInt(multi.getParameter("dno"));
				String aname = multi.getParameter("aname");
				String contents = multi.getParameter("contents");
				String song1 = multi.getParameter("song1");
				String song2 = multi.getParameter("song2");
				String song3 = multi.getParameter("song3");
				/*String file = "upload&#92" + filename1;*/
				String file = filename1;
				
				Lineup lineup = new Lineup(lno,dno, aname, contents, song1, song2, song3, file);
				SqlSession session = null;
				
				try {
					session = MySqlSessionFactory.openSession();
					LineupDao dao = session.getMapper(LineupDao.class);
					dao.updateLineup(lineup);
					session.commit();
				} catch (Exception e) {
					session.rollback();
					e.printStackTrace();
				} finally {
					session.close();
				}			
				/*req.setAttribute("uploadPath", uploadPath);*/
				/*req.setAttribute("file", arrfile);*/	
			}catch(Exception e){
				e.printStackTrace();
			}
			return "lineupSelected.do";
		}
		return null;
	}

}

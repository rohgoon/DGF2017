package file.handler;

import java.io.File;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import mvc.controller.CommandHandler;

public class UploadHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if(req.getMethod().equalsIgnoreCase("get")){
			return "/WEB-INF/lineupRegister.jsp";					
		}else if(req.getMethod().equalsIgnoreCase("post")){
			return postProcess(req, res);
		}
		return null;
	}

	private String postProcess(HttpServletRequest req, HttpServletResponse res) {
		String uploadPath = req.getRealPath("upload");
		File dir = new File(uploadPath);
		if(dir.exists() == false){
			dir.mkdirs();
		}
		
		try{
			int size = 1024*1024*10;
			MultipartRequest multi = new MultipartRequest(req, uploadPath,
					size,
					"utf-8",
					new DefaultFileRenamePolicy());
			Enumeration files = multi.getFileNames(); //실제 업로드된 파일 정보
			ArrayList<String> arrfile = new ArrayList<>();
			
			String filename1 = "";
			String filename2 = "";
			String origfilename1 = "";
			String origfilename2 = "";
			String keyfile1 = "";
			String keyfile2 = "";
			
			keyfile1 = (String) files.nextElement(); //key1 받음
			filename1 = multi.getFilesystemName(keyfile1);
			origfilename1 = multi.getOriginalFileName(keyfile1);
			if(filename1 != null && !filename1.isEmpty()){
				arrfile.add(filename1);
			}
			
			keyfile2 = (String) files.nextElement(); //key2 받음
			filename2 = multi.getFilesystemName(keyfile2);
			origfilename2 = multi.getOriginalFileName(keyfile2);
			if(filename2 != null && !filename2.isEmpty()){
				arrfile.add(filename2);
			}
			
			req.setAttribute("file", arrfile);
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return "lineupList.do";
	}

}

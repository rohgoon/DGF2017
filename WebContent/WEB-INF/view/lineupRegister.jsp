<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript">
	

</script>
</head>
<body>
	<form action="registerUpload.do" method="post" enctype="multipart/form-data">
		<fieldset>
			<legend>뉴 라인업 등록</legend>
			출연진 번호 : <input type="text" name="lno" readonly="readonly" placeholder="입력ㄴㄴ해"><br>
			일정 번호 : <input type="text" name="dno"><br>
			아티스트 명 : <input type="text" name="aname"><br>
			아티스트 설명 : <textarea rows="10" cols="30" name="contents"></textarea><br>
			대표곡1 : <input type="text" name="song1"><br>
			대표곡2 : <input type="text" name="song2"><br>
			대표곡3 : <input type="text" name="song3"><br>
			아티스트 이미지 : <input type="file" name="file1"><br>
			
			<input type="reset" value="취소">
			<input type="submit" value="등록">
		</fieldset>
	</form>

</body>
</html>
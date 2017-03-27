<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="lineupUpdate.do?lno=${updateLineup.lno }" method="post" enctype="multipart/form-data">
		<fieldset>
			<legend>라인업 수정</legend>
			출연진 번호 : <input type="text" name="lno" value="${updateLineup.lno }" readonly="readonly"><br>
			일정 번호 : <input type="text" name="dno" value="${updateLineup.dno }"><br>
			아티스트 이름 : <input type="text" name="aname" value="${updateLineup.aname }"><br>
			아티스트 설명 : <textarea rows="10" cols="30" name="contents" value="${updateLineup.contents}"></textarea><br>
			대표곡1 : <input type="text" name="song1" value="${updateLineup.song1 }"><br>
			대표곡2 : <input type="text" name="song2" value="${updateLineup.song2 }"><br>
			대표곡3 : <input type="text" name="song3" value="${updateLineup.song3 }"><br>
			라인업 이미지 : <input type="file" name="file"><br>
			<input type="reset" value="취소">
			<input type="submit" value="등록">
		</fieldset>
	</form>

</body>
</html>
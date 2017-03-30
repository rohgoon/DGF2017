<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

	table{
		table-layout: fixed !important;
		width:500px !important;
		margin-left: 0 !important;
		
	}
	table th, td{
		border: 1px solid black;
	}
	td{
		text-align: left;
	}
	#aith{
	    vertical-align: middle;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript">
	

</script>
</head>
<body>
	<div id="wrapContent">
		<form action="registerUpload.do" method="post" enctype="multipart/form-data" class="lineUP">
		<fieldset>			
			<table>
				<tr>
					<th colspan="2">뉴 라인업 등록</th>
				</tr>
				<tr>
					<th>일정 번호</th>
					<td><input type="text" name="dno" value="${dno }" disabled="disabled"></td>
				</tr>
				<tr>
					<th>아티스트 명</th>
					<td><input type="text" name="aname"></td>
				</tr>
				<tr>
					<th id="aith">아티스트 설명</th>
					<td><textarea rows="10" cols="30" name="contents"></textarea></td>
				</tr>
				<tr>
					<th>대표곡1</th>
					<td><input type="text" name="song1"></td>
				</tr><tr>
					<th>대표곡2</th>
					<td><input type="text" name="song2"></td>
				</tr><tr>
					<th>대표곡3</th>
					<td><input type="text" name="song3"></td>
				</tr><tr>
					<th>아티스트 이미지</th>
					<td><input type="file" name="file1"></td>
				</tr>			
			</table>
			<input type="reset" value="취소">
			<input type="submit" value="등록">
		</fieldset>
		</form>
	</div>
</body>
</html>
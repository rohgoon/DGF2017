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
</head>
<body>
<div id="wrapContent">
	<form action="lineupUpdate.do?lno=${updateLineup.lno }" method="post" enctype="multipart/form-data" class="lineUP">
		<fieldset>
			<table>
				<tr>
					<th colspan="2">라인업 수정</th>
				</tr>
				<tr>
					<th>출연진 번호</th>
					<td><input type="text" name="lno" value="${updateLineup.lno }" readonly="readonly"></td>
				</tr>
				<tr>
					<th>일정 번호</th>
					<td><input type="text" name="dno" value="${updateLineup.dno }"></td>
				</tr>
				<tr>
					<th>아티스트 이름</th>
					<td><input type="text" name="aname" value="${updateLineup.aname }"></td>
				</tr>
				<tr>
					<th id="aith">아티스트 설명</th>
					<td><textarea rows="10" cols="30" name="contents" value="${updateLineup.contents}"></textarea></td>
				</tr>
				<tr>
					<th>대표곡1</th>
					<td><input type="text" name="song1" value="${updateLineup.song1 }"></td>
				</tr>
				<tr>
					<th>대표곡2</th>
					<td><input type="text" name="song2" value="${updateLineup.song2 }"></td>
				</tr>
				<tr>
					<th>대표곡3</th>
					<td><input type="text" name="song3" value="${updateLineup.song3 }"></td>
				</tr>
				<tr>
					<th>라인업 이미지</th>
					<td><input type="file" name="file"></td>
				</tr>
				<tr>					
					<th colspan="2"><input type="reset" value="취소"> / <input type="submit" value="등록"></th>
				</tr>
			</table>
		</fieldset>
	</form>
</div>
</body>
</html>
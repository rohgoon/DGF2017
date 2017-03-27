<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<input type="text" id="id" name="id" placeholder="ID"  class="inpJoin">
	<input type="text" id="name" name="name" placeholder="name"  class="inpJoin"><br>
	<input type="password" id="password" name="password" placeholder="Password" class="inpJoin">
	<input type="password" id="repassword" name="repassword" placeholder="Password repeat"  class="inpJoin"><br>
	<input type="text" id="email" name="email" placeholder="E-mail"  class="inpJoin"><br>
	<input type="text" id="phone1" name="phone1" placeholder="010" class="inpPhone inpJoin">-<input type="text" id="phone2" name="phone2" placeholder="0000"  class="inpPhone inpJoin">-<input type="text" id="phone3" name="phone3" placeholder="0000"  class="inpPhone inpJoin"><br>
	<input type="button" value="가입" onclick="join()" class="inpJoin">
	<input type="button" value="취소" onclick="backToLogin()" class="inpJoin">

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<input type="text" id="id" name="id" placeholder="ID"  class="inpJoin" onblur="checkJoinId(this)" required="required">
	<input type="text" id="name" name="name" placeholder="name"  class="inpJoin" required="required"><br>
	<input type="password" id="password" name="password" placeholder="Password" class="inpJoin" required="required">
	<input type="password" id="repassword" name="repassword" placeholder="Password repeat"  class="inpJoin" required="required"><br>
	<input type="text" id="email" name="email" placeholder="E-mail"  class="inpJoin" required="required"><br>
	<input type="text" id="phone1" name="phone1" placeholder="010" class="inpPhone inpJoin">-<input type="text" id="phone2" name="phone2" placeholder="0000"  class="inpPhone inpJoin">-<input type="text" id="phone3" name="phone3" placeholder="0000"  class="inpPhone inpJoin" required="required"><br>
	<input type="button" value="Join" onclick="join()" class="inpJoin">
	<input type="button" value="Back" onclick="backToLogin()" class="inpJoin">

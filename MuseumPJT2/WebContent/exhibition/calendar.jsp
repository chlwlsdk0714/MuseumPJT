<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>캘린더</title>
</head>
<style>
	[date] {display: inline;} 
</style>
<script>
	function showList(){
		
	}	
</script>
<body>
	<form action="frm">
		<input type="date" name="start_date" min="2019-01-01" max="2021-12-31">부터
		<input type="date" name="end_date" min="2019-01-01" max="2021-12-31">까지
		<input type="submit" value="검색" onclick="showList()">
	</form>
</body>
</html>
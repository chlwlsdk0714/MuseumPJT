<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>공지사항 글쓰기</title>
	<link rel="stylesheet" href="css/notice_insert.css" type="text/css">
</head>
<body>
	<form name="noti-insert-form" action="noticeController" method="post">
		<div class="title-wrap">
			<div class="title">공지사항</div>
		</div>
        
		<div class="table-wrap">
			<table class="insert-table">
	            <thead>
	                <tr>
	                    <td colspan="2">콜백뮤지엄의 새로운 소식을 전하세요!</td>
	                </tr>
	            </thead>
	            <tbody>
	                <tr>
	                    <th>제목</th>
	                    <td>
	                        <input type="text" name="subject" class="input-subject" placeholder="제목을 입력하세요.">
	                    </td>
	                </tr>
	                <tr>
	                    <th>내용</th>
	                    <td>
	                        <textarea name="content" cols="30" rows="20"></textarea>
	                    </td>
	                </tr>
	            </tbody>
	            <tfoot>
	                <tr>
	                    <td colspan="2">
	                        <input type="submit" value="발행하기">
	                        <input type="hidden" name="type" value="insert">
	                        <button type="button" class="gray-btn" onclick="goBack()">이전으로</button>
	                    </td>
	                </tr>
	            </tfoot>
	        </table>
        </div>
    </form>
</body>
<script>
	function goBack() {
		history.back();
	}
</script>
</html>
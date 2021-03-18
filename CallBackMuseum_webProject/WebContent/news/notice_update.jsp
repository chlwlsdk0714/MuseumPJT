<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>공지사항 글쓰기</title>
	<link rel="stylesheet" href="css/notice_update.css" type="text/css">
</head>
<body>
	<form name="noti-update-form" action="noticeController" method="post">
		<div class="title-wrap">
			<div class="title">공지사항</div>
		</div>
        
		<div class="table-wrap">
			<table class="update-table">
	            <thead>
	                <tr>
	                    <td colspan="2">수정을 마친 뒤 '수정완료' 버튼을 눌러 저장해주세요.</td>
	                </tr>
	            </thead>
	            <tbody>
	                <tr>
	                    <th>제목</th>
	                    <td>
	                        <input type="text" name="subject" class="input-subject" 
	                        	   placeholder="제목을 입력하세요." value="${nvo.noti_subject}">
	                    </td>
	                </tr>
	                <tr>
	                    <th>내용</th>
	                    <td>
	                        <textarea name="content" cols="30" rows="20">${nvo.noti_content}</textarea>
	                    </td>
	                </tr>
	            </tbody>
	            <tfoot>
	                <tr>
	                    <td colspan="2">
	                        <input type="submit" value="수정완료">
	                        <input type="hidden" name="type" value="updateProc">
	                        <input type="hidden" name="noti_idx" value="${nvo.noti_idx}">
	                        <input type="hidden" name="cPage" value="${cPage}">
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
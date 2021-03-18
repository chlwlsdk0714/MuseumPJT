<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>관람 후기 글쓰기</title>
	<link rel="stylesheet" href="css/review_insert.css" type="text/css">
</head>
<body>
	<form method="post" enctype="multipart/form-data">
		<div class="title-wrap">
			<div class="title">관람 후기</div>
		</div>
        
		<div class="table-wrap">
			<table class="insert-table">
				<thead>
					<tr>
					    <td colspan="2">콜백뮤지엄 콘텐츠를 감상한 뒤 후기를 남겨주세요.</td>
					</tr>
				</thead>
	            <tbody>
					<tr>
	                    <th>분류</th>
	                    <td>
	                        <select name="rev_category" title="분류">
	                            <option>공연</option>
	                            <option>전시</option>
	                            <option>행사</option>
	                        </select>
	                    </td>
	                </tr>
	                <tr>
	                    <th>제목</th>
	                    <td>
	                        <input type="text" name="rev_subject" class="input-subject" 
	                        	title="제목" placeholder="제목을 입력하세요.">
	                    </td>
	                </tr>
	                <tr>
	                    <th>사진 첨부</th>
	                    <td>
	                        <input type="file" name="rev_file_name">
	                    </td>
	                </tr>
	                <tr>
	                    <th>내용</th>
	                    <td>
	                        <textarea name="rev_content" cols="30" rows="20" title="내용"></textarea>
	                    </td>
	                </tr>
	            </tbody>
	            <tfoot>
	                <tr>
	                    <td colspan="2">
	                        <input type="button" value="발행하기" onclick="sendData(this.form)">
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
	function sendData(frm) {
		for (var i = 0; i < 4; i++) {
			console.log(frm.elements[i]);
			if (i == 2) continue; // file은 옵션이므로 제외
			if (frm.elements[i].value.trim() == "") {
				alert(frm.elements[i].title + "을 입력하세요.");
				frm.elements[i].focus();
				return;
			}
		}
		frm.action="reviewController?type=insertReview";
		frm.submit();
	}
</script>
</html>
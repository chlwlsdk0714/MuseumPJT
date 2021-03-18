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
	<div class="title-wrap">
		<div class="title">관람 후기</div>
	</div>
	
	<form method="post" enctype="multipart/form-data">
		<div class="table-wrap">
			<table class="insert-table">
				<thead>
					<tr>
					    <td colspan="2">수정을 마친 뒤 '수정완료' 버튼을 눌러 저장해주세요.</td>
					</tr>
				</thead>
	            <tbody>
					<tr>
	                    <th>분류</th>
	                    <td>
	                        <select name="rev_category" title="분류" id="category">
	                            <option value="공연">공연</option>
	                            <option value="전시">전시</option>
	                            <option value="행사">행사</option>
	                        </select>
	                    </td>
	                </tr>
	                
	                <tr>
	                    <th>제목</th>
	                    <td>
	                        <input type="text" name="rev_subject" class="input-subject" 
								title="제목" placeholder="제목을 입력하세요." value="${rvo.rev_subject}">
	                    </td>
	                </tr>
	                <tr>
	                    <th>사진 첨부</th>
	                    <td>
	                        <input type="file" name="rev_file_name"><i class="far fa-file-image"></i>&nbsp;&nbsp;${rvo.rev_ori_name}
	                    </td>
	                </tr>
	                <tr>
	                    <th>내용</th>
	                    <td>
	                        <textarea name="rev_content" cols="30" rows="20" title="내용">${rvo.rev_content}</textarea>
	                    </td>
	                </tr>
	            </tbody>
	            <tfoot>
	                <tr>
	                    <td colspan="2">
	                        <input type="button" value="발행하기" onclick="sendForm(this.form, '${cPage}', '${rvo.rev_idx}')">
	                        <button type="button" class="gray-btn" onclick="goBack()">이전으로</button>
	                    </td>
	                </tr>
	            </tfoot>
	        </table>
        </div>
    </form>
</body>
<script>
 	let cate = document.getElementById("category");
	let cateString = "${rvo.rev_category}";
	for (var i = 0; i < cate.length; i++) {
		console.log("cate[" + i + "].value: " + cate[i].value);
		if(cateString == cate[i].value) {
			cate[i].selected = true;
		}
	}
	function sendForm(frm, cPage, idx) {
		frm.action="reviewController?type=updateReviewProc&cPage=" + cPage + "&rev_idx=" + idx;
		frm.submit();
	}
	
	
	function goBack() {
		history.back();
	}
	
</script>
</html>
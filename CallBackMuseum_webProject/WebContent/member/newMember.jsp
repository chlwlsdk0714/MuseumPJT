<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원가입</title>
	<link rel="stylesheet" href="css/newMember.css">
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
	//비밀번호 중복체크
	$(function(){
		$("#pwcheck").keyup(function(){
			if($("#pw").val() == $("#pwcheck").val()) {
				$("#spanhere").html("※ 암호가 일치합니다");
				$("#spanhere").removeClass("red");
				$("#spanhere").addClass("black");
			} else {
				$("#spanhere").html("※ 암호가 일치하지 않습니다");
				$("#spanhere").addClass("red");
				}
		});
	});

	// DB의 NOT NULL 해당 컬럼들 값 안넣으면 경고띄우기
	function checkValue() {
		let form = document.querySelector("form");
		let labels = ["아이디는", "비밀번호는", "비밀번호는", "이름은", "휴대전화 번호는", "이메일은"];
		let items = document.querySelectorAll(".must + td > input");
		
		for (let i=0; i<items.length; i++) {
			let item = items[i];
			
			if (i == 4) {
				let gender = form.gender;
				if(!gender.value){
					alert("성별은 필수입력 항목입니다.");
					event.preventDefault(); 
					return;
				}
			}
			
			if (item.value == null || item.value.trim().length == 0) {
				console.log("i : " + i);
				console.log(labels[i]);
				console.log(labels);
				alert(labels[i] + " 필수 입력 항목입니다");
				item.value = "";
				item.focus();
				event.preventDefault(); 
				return;		
			}
		}	
	}

	
	$(function(){
		let timer;
		// 아이디 중복체크
		document.querySelector("#id").addEventListener("keyup", function() {
			let idString = this.value;
			let warning = this.nextElementSibling;
			
			clearTimeout(timer);
			timer = setTimeout(function() {
				$.ajax({
					url: "checkId",
					method: "get",
					data: {
						id: idString
					},
					dataType: "json",
					success: function(hasId) {
						if (hasId) {
							// 중복
							// 경고메시지 표시(classList.remove("hidden"))
							warning.classList.remove("hidden");
							document.querySelector("#id").classList.add("red-border");
							
						} else {
							// 중복없음
							warning.classList.add("hidden");
							document.querySelector("#id").classList.remove("red-border");
						}
					}
				});
			}, 300);
		});
	});
</script>

</head>
<body>
	<div>
		<div id="hhh1">
			<div id="hh1">회원가입</div>
		</div>
	</div>
	<div class="texth">
		<h3>기본정보</h3>
		<h4>(<span class="redstar"> *</span>는 필수정보입니다. )</h4>
	</div>

	<form action="join" method="post" name="joinform">
	<div class="memtable-wrap">
		<table class="member-table">
			<tbody>
				<tr>
					<th class="must">아이디</th>
					<td>
						<label for="id" class="blind"></label>
						<input type="text" name="id" id="id"
						pattern="^[A-Za-z0-9]{4,12}$"
						title="아이디는 4글자이상 12글자 이하로 입력하세요!">
						<div class="hidden warning">※ 이미 사용중인 아이디입니다.</div>
					</td>
				</tr>
				<tr>
					<th class="must">비밀번호</th>
					<td>
						<label for="pw" class="blind"></label> 
						<input type="password" name="pw" id="pw"
						pattern="[A-Za-z0-9]{4,}"
						title="비밀번호는 4글자이상 입력하세요!">
						<a class="forred">※ 비밀번호는 4글자 이상 입력해야 합니다.</a>
					</td>
				</tr>
				<tr>
					<th class="must">비밀번호 확인</th>
					<td>
						<label for="pwcheck" class="blind"></label> 
						<input type="password" name="pwcheck" id="pwcheck"
						pattern="[A-Za-z0-9]{4,}"
						title="비밀번호는 4글자이상 입력하세요!">
						<a class="forred"><span id="spanhere">※ 비밀번호 확인을 위해 비밀번호를 한번 더 입력해주세요.</span></a>
					</td>
				</tr>
				<tr>
					<th class="must">이름</th>
					<td>
						<label for="name" class="blind"></label>
						<input type="text" name="name" id="name"
						pattern="[ㄱ-힣]{2,8}"
						title="이름을 정확히 입력해주세요">
					</td>
				</tr>
				<tr>
					<th class="must">성별</th>
					<td>
						<div class="genderradio">
							<input type="radio" name="gender" value="male" id="male">
							<label for="male">남성</label>
						
							<input type="radio" name="gender" value="female" id="female">
							<label for="female">여성</label>
						</div>
					</td>
				</tr>
				<tr>
					<th>연락처</th>
					<td>
						<select name="area">
							<option value="02" selected="selected">02(서울)</option>
							<option value="051">051(부산)</option>
							<option value="053">053(대구)</option>
							<option value="032">032(인천)</option>
							<option value="062">062(광주)</option>
							<option value="042">042(대전)</option>
							<option value="052">052(울산)</option>
							<option value="044">044(세종)</option>
							<option value="031">031(경기)</option>
							<option value="033">033(강원)</option>
							<option value="043">043(충북)</option>
							<option value="041">041(충남)</option>
							<option value="063">063(전북)</option>
							<option value="061">061(전남)</option>
							<option value="054">054(경북)</option>
							<option value="055">055(경남)</option>
							<option value="064">064(제주)</option>
						</select>
						<label for="phone" class="blind"></label>
						<input type="text" name="phone" id="phone"
							pattern="\d{3,4}-\d{4}"
							title="1234-5678형식으로 입력해주세요">
					</td>
				</tr>
				<tr>
					<th  class="must">휴대전화</th>
					<td>
						<select name="cellphone_prefix">
							<option value="010" selected="selected">010</option>
							<option value="011">011</option>
							<option value="016">016</option>
							<option value="017">017</option>
							<option value="018">018</option>
							<option value="019">019</option>
						</select>
						<label for="cellphone" class="blind"></label>
						<input type="text" name="cellphone" id="cellphone"
							pattern="\d{3,4}-\d{4}"
							title="1234-5678형식으로 입력해주세요">
					</td>
				</tr>
				<tr>
					<th class="must">이메일</th>
					<td>
						<label for="email" class="blind"></label>
						<input type="text" name="email" id="email"
						pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}"
						title="callback@museum.com형식으로 입력해주세요">
					</td>
				</tr>
				<tr>
					<th>주소</th>
					<td>
						<label for="address" class="blind"></label>
						<input type="text" name="address" id="address"
						maxlength="30"
						pattern="[ㄱ-힣0-9\s-]{5,}"
						title="주소를 정확히 입력해주세요">
						<!-- pattern -> 기호 [ '<>{} $?! "]를 제외하고 최소 3 글자 [az] {3,} 
							다른 모든 문자는 허용 -->
					</td>
				</tr>
			</tbody>
		</table>
		</div>
		<div class="btn">
			<input type="hidden" name="type" value="joinInput">
			<button class="joinbtn" id="newmemBtn" name="newbtn" 
					type="submit" onclick="checkValue(event)">회원가입</button>
		</div>
	</form>
	<script>
		let msg = "${param.msg}";
		if(msg) {
			alert(msg);
		}
		
		// phone 앞부분을 회원가입했을 때 select한게 selected 되어있게 처리하기
		let prefixPhone = "${sessionScope.login.prefixPhone()}";
		let options = document.querySelectorAll("#area > option");
		for (let option of options) {
			if (option.value === prefixPhone) {
				option.setAttribute("selected", true);
				break;
			}
		}
		
		// cellphone 앞부분을 회원가입했을 때 select한게 selected 되어있게 처리하기
		let prefixCellphone = "${sessionScope.login.prefixCellphone()}";
		let cellOptions = document.querySelectorAll("#cp > option");
		for (let option of cellOptions) {
			if(option.value === prefixCellphone) {
				option.setAttribute("selected", true);
				break;
			}
		}
		
		// 알맞는 형식에 안맞는경우 red-border처리해주고 경고메세지 띄우기
		//validation messege는 경고창에 뜨는 메세지. 위에 imput태그안의 title에 입력할 메세지 적는다
		let validTargets = document.querySelectorAll("input[pattern]");
		for (let target of validTargets) {
			target.validationMessage = target.title;
			target.addEventListener("change", function(){
				let valid = this.checkValidity();
				if (valid) {
					this.classList.remove("red-border");
				} else {
					this.classList.add("red-border");
					this.reportValidity();
				}
			});
		}
	</script>
</body>
</html>
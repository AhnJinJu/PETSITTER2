<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Document</title>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">

<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>
.wrap {
	padding-right: 15px;
	padding-left: 15px;
	margin-right: auto;
	margin-left: auto;
	margin-top: 30px
	width: 700px;
}
* {
	box-sizing: border-box;
}

.menu {
	text-align: left;
}

.ans {
	text-align: left;
}

input[type=text], input[type=password] {
	width:70%;
}
i{ color: #81DAD6;  }
.btns {
  background-color: #4CAF50; /* Green */
  border: none;
  color: white;
  padding: 6px 10px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  -webkit-transition-duration: 0.4s; /* Safari */
  transition-duration: 0.4s;
  cursor: pointer;
  border-radius: 10px; 
    }
    
  .btns1{  
  background-color: #4CAF50; /* Green */
  border: none;
  color: white;
  padding: 13px 25px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  -webkit-transition-duration: 0.4s; /* Safari */
  transition-duration: 0.4s;
  cursor: pointer;
  border-radius: 10px; 
  
  }  
.btn1 {
  background-color: #81DAD6; 
  color: white; 
   border-radius: 10px;
   
}

.btn1:hover {
  background-color: turquoise;
  color: white;
}
@font-face { font-family: 'IBMPlexSansKR-Regular'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-07@1.0/IBMPlexSansKR-Regular.woff') format('woff'); font-weight: normal; font-style: normal; }

.title, .menu, .menu1{
	font-family: 'IBMPlexSansKR-Regular';
}

</style>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet"> <!--CDN 링크 -->

</head>

<body>

	<jsp:include page="/WEB-INF/views/member/header.jsp" />
	<div class="container">
		<div class="wrap col-8" style="margin-top: 80px;">
		<div class="row header">
			<div class="col-12 title">
				<h2><i class="fas fa-user"></i> 회원가입</h2>
			</div>
		</div>
		<form action="/member/signupProc" method="post">
			<div class="row">
				<div class="col-12 menu">ID</div>
				<div class="col-12 ans">
					<input type="text" id="id" name="mem_id"
						placeholder="영문 대소문자, 숫자/최소 6글자~12글자"> 
				</div>
				<div class="col-12 menu">
				<span id="idregx"
						style="display: none;">사용 가능한 ID입니다.</span> <span id="idok"
						style="display: none;">사용 가능한 ID입니다.</span> <span id="idfail"
						style="display: none;">사용 중인 ID입니다. 새로운 ID를 입력하세요.</span>
				</div>

			</div>
			<div class="row">
				<div class="col-12 menu">비밀번호</div>
				<div class="col-12 ans">
					<input type="password" id="pw" name="mem_pw"
						placeholder="영문 대소문자, 숫자, 특수문자 하나 이상/최소 8~16자">
				</div>
			</div>
			<div class="row">
				<div class="col-12 menu">비밀번호 확인</div>
				<div class="col-12 ans">
					<input type="password" id="pwcheck"> 
				</div>
				<div class="col-12 menu">
				<span id="pwok"
						style="display: none; color: green;">비밀번호가 일치합니다.</span> <span
						id="pwfail"
						style="display: none; color: #d92742; font-weight: bold;">비밀번호가
						일치하지 않습니다.</span>				
				</div>
			</div>
			<div class="row">
				<div class="col-12 menu">이름</div>
				<div class="col-12 ans">
					<input type="text" id="name" name="mem_name">
				</div>
			</div>
			<div class="row">
				<div class="col-12 menu">Email</div>
				<div class="col-12 ans">
					<input type="text" id="email" name="mem_email"
						placeholder="abcd@kh.com 형식으로 입력">
				</div>
				
				<div class="col-12 menu">				
				 <span id="emok"
						style="display: none;">사용 가능한 Email입니다.</span> <span id="emfail"
						style="display: none;">사용 중인 Email입니다. 새로운 Email을 입력하세요.</span>							
				</div>

			</div>
			<div class="row">
				<div class="col-12 menu">연락처</div>
				<div class="col-12 ans">
					<input type="text" id="phone" name="mem_phone"
						placeholder="-를 제외한 숫자 입력">
				</div>
			</div>
			<div class="row">
				<div class="col-12 menu">우편번호</div>
				<div class="col-12 ans">
					<input type="text" id="zipcode" name="mem_zipcode" readonly>
					<button type="button" class="btns btn1" onclick="sample4_execDaumPostcode()">우편번호
						찾기</button>
				</div>
			</div>
			<div class="row">
				<div class="col-12 menu">주소</div>
				<div class="col-12 ans">
					<input type="text" id="add1" name="mem_address1" readonly>
				</div>
			</div>
			<div class="row">
				<div class="col-12 menu">상세주소</div>
				<div class="col-12 ans">
					<input type="text" id="add2" name="mem_address2">
				</div>
			</div>
			<br>
			<div class="row">
				<div class="col-12 menu1">
					<button type="submit" id="signup"  class="btns1 btn1">회원가입</button>
					<button type="reset"  class="btns1 btn1">취소</button>
				</div>
			</div>
		</form>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/member/footer.jsp" />
	<script>
		function sample4_execDaumPostcode() {
			new daum.Postcode({
				oncomplete : function(data) {
					var roadAddr = data.roadAddress; // 도로명 주소 변수
					document.getElementById('zipcode').value = data.zonecode;
					document.getElementById("add1").value = roadAddr;
					document.getElementById("add2").value = data.jibunAddress;
				}
			}).open();
		}
	</script>
	<script>
		$(function() {

			$("#id").on(
					"focusout",
					function() {
						var userIdCheck = RegExp(/^[A-Za-z0-9]{6,12}$/);
						var id = $("#id").val()

						if (id != null && id != "") {

							if (userIdCheck.test(id)) {

								$
										.ajax({
											url : "/member/idDuplCheck",
											type : "post",
											dataType : "json",
											data : {
												"id" : $("#id").val()
											},
											success : function(data) {
												if (data == 1) {
													$("#idok").css('display',
															'none');
													$("#idfail").css('display',
															'inline-block');
												} else if (data == 0) {
													$("#idok").css('display',
															'inline-block');
													$("#idfail").css('display',
															'none');
												}
											}
										})
							} else {
								alert("ID는 영문 대소문자, 숫자/최소 6글자~12글자로 입력해주세요!");
								$("#id").val("");
								$("#id").focus();
							}

						}
					})

			$("#pw")
					.on(
							"focusout",
							function() {
								var passwdCheck = RegExp(/^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/g);
								var pw = $("#pw").val();

								if (pw != null && pw != "") {

									if (!passwdCheck.test(pw)) {
										alert("비밀번호는 영문 대소문자, 숫자, 특수문자 하나 이상 포함/최소 8~16자로 입력해야합니다.")
										$("#pw").val("");
									}
								}

							})

			$("#email")
					.on(
							"focusout",
							function() {
								var emailCheck = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
								var email = $("#email").val();

								if (email != null && email != "") {

									if (emailCheck.test(email)) {
										$.ajax({
											url : "/member/emailDuplCheck",
											type : "post",
											dataType : "json",
											data : {
												"email" : $("#email").val()
											},
											success : function(data) {
												if (data == 1) {
													$("#emok").css('display',
															'none');
													$("#emfail").css('display',
															'inline-block');
												} else if (data == 0) {
													$("#emok").css('display',
															'inline-block');
													$("#emfail").css('display',
															'none');
												}
											}
										})

									} else {
										alert("Email 양식은 ****@***.*** 입니다.")
										$("#email").val("")
									}
								}

							})

			$("#pwcheck").on("focusout", function() { //비밀번호 입력 체크
				var pw1 = $("#pw").val();
				var pw2 = $("#pwcheck").val();

				if (pw1 != "" || pw2 != "") {
					if (pw1 == pw2) {
						$("#pwok").css('display', 'inline-block');
						$("#pwfail").css('display', 'none');
					} else {
						alert("비밀번호가 일치하지 않습니다. 비밀번호를 재확인해주세요.");
						$("#pwok").css('display', 'none');
						$("#pwfail").css('display', 'inline-block');
						$("#pwcheck").val("");

					}
				}

			})

			$("#name").on("focusout", function() {
				var name = $("#name").val();
				var nameCheck = RegExp(/^[가-힣]{2,6}$/);

				if (name != null && name != "") {
					if (!nameCheck.test(name)) {
						alert("이름은 한글 2-6자로만 입력 가능합니다.");
						$("#name").val("");
					}
				}
			})

			$("#phone").on("focusout", function() {
				var phonNumberCheck = RegExp(/^01[0179][0-9]{7,8}$/);
				var phone = $("#phone").val();

				if (phone != null && phone != "") {
					if (!phonNumberCheck.test(phone)) {
						alert("연락처는 01로 시작하여 -없이 숫자만 입력하세요.")
					}
				}
			})

		}) //function 끝
	</script>
</body>
</html>
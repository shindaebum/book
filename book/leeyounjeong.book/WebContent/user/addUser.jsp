<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="leeyounjeong.book.user.service.UserService" %>
<%@ page import="leeyounjeong.book.user.service.UserServiceImpl" %>
<%@ page import="leeyounjeong.book.user.domain.User" %>
<%
	request.setCharacterEncoding("utf-8");
	UserService userService = new UserServiceImpl();
%>
<!DOCTYPE html>
<html lang='ko'>
<head>
<title>BoB</title>
<meta charset='utf-8'>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
<script>
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var roadAddr = data.roadAddress;
                var extraRoadAddr = '';
                
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                
                if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();      
    }
</script>
<style>
	.logo{
		text-align: left;
		font-weight: bold; 
		font-size: 5em;
		line-height: 1.0em; 
		color: navy;
		font-family: arial;
	}
	
	.area{
		display: inline;
		text-align: right;
	}
	
	.title{
	   padding: 10 0 0 10px;
	   border-bottom: 1.5px solid #0B2161;
	   letter-spacing: -0.07em
	}
	
	h1{
	   font-size: 32px;
	   padding-left: 20px;
	   color: #000;
	   line-height: 1;
	   font-family: 'Montserrat', 'Noto Sans KR', Verdana, Dotum, AppleGothic, sans-serif;
	}
	
	.title span{
	   font-size: 21px;
	   color: #d2d2d2;
	   font-weight: 500;
	   letter-spacing: 0em;
	   margin-left: 3px;
	}
	
	table{
		margin: 0 auto;
		border-spacing:10px;
		font-size: 13pt;
	}
	
	.signbutton{
		width: 200px;
		heigth: 200px;
		margin: 0 auto;
	}
	
	.text, .number{
		border-bottom: 10px solid #fff;
	}
	
	#userid, #sample4_postcode {
		width: 50%;
		display:inline-block; 
		margin-right:15px;	
	}
	
	.form-control{
		width: 50%;
	}
	
	th{
		padding-right: 15px;
		padding: 10px 7px;
	}
	
	h3{
		margin-left: 100px;
	}
	
	.btn-sm{
		margin-bottom: 8px;
	}
	
	.sign{
		display:inline-block;
		margin: 0px 0px 0px 150px;
	}
</style>
<body>
<br>
<div class='container'>
	<div class='area'>
		<div class='top_menu'>
			<a href='login.jsp'>로그인</a> <span>|</span>
			<a href='addUser.jsp'>회원가입</a> <span>|</span>
			<a href='login.jsp'>마이페이지</a> <span>|</span>
			<a href='login.jsp'>장바구니</a> <span>|</span>
			<a href='login.jsp'>고객센터</a> 
		</div>
	</div>
	<br>

	<div class='logo'>
		<a href='../main.jsp'  >BoB<i class="fas fa-book-open" aria-hidden="true"></i></a>
	</div>
	<br>
	<!-- header -->
	<div class='title'>
		<a href='addUser.jsp' style="text-decoration:none">
			<h1>회원가입
			<span>Sign Up</span>
			</h1>
		</a>
	</div> <br><br>
<%
		String a = request.getParameter("msg");
		if(a == null) a = "";
%>
	<div class='sign'>
		<form action="addProc.jsp">
			<table class='sign'>
				<tr class='text'>
					<th>아이디<span>(*)</span></th>
					<td><input type='text' class="form-control" name="userId" placeholder="아이디를 입력하세요." required/>&nbsp;<%= a %></td>
				</tr>
				
				<tr class='text'>
					<th>이름<span>(*)</span></th>
					<td><input type='text' class="form-control" placeholder="사용자 이름을 입력하세요." name="userName" required/></td>
				</tr>
				
				<tr class='text'>
					<th>비밀번호<span>(*)</span></th>
					<td><input type='password' class="form-control" placeholder="비밀번호를 입력하세요." name="userPwd" required/></td>
				</tr>
			
				<tr class='number'>
					<th>휴대폰 번호<span>(*)</span></th>
					<td>
						<input type='text' name="phoneNum" class="form-control onlyNumber" placeholder="-를 포함하여 번호를 입력하세요."  
						onKeypress="if(event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" style="IME-MODE:disabled;" required/>
					</td>
				</tr>
				
				
				<tr class="text">
					<th>주소<span>(*)</span></th>
					<td><input type="text" id="sample4_postcode" placeholder="우편번호" name="address1" required>
						<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
						<input type="text" id="sample4_roadAddress" placeholder="도로명주소" name="address2" required>
						<input type="text" id="sample4_jibunAddress" placeholder="지번주소" name="address3">
						<span id="guide" style="color:#999;display:none"></span>
						<input type="text" id="sample4_detailAddress" placeholder="상세주소" name="address4" required>
					</td>
				</tr>
			</table>
			<br>
			
			<div class='signbutton'>
				<button type='submit' class='btn btn-success btn-lg' formaction="addProc.jsp">가입 신청</button>
			</div>
<!-- 우편번호 API -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();      
    }
</script>
</form>
</div>
</div>
</body>
</html>
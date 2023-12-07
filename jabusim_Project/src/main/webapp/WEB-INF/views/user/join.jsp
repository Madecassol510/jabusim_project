<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var='root' value="${pageContext.request.contextPath }/" />
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>미니 프로젝트</title>
<!-- Bootstrap CDN -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
	
<style>

	/* ==========================페이지 공용================================== */

	body{
		width:100%;
		min-height : 1200px;
	}
	
	ul{
		list-style:none;
		padding : 5px;
	}
	
	li{
	
	}
	
	.pageContainer{
		position: relative;
	    width: 1250px;
	    min-height: 700px;
	    margin: 0 auto;
	   	padding-top: 80px;
	    border: 1px solid red;
	}
	.module{
		min-height : 600px;
		width:100%;
		border: 1px solid blue;
		text-align:center;
		padding-top: 50px;
		padding-bottom: 50px;
	}
	
	.article{	
		display : inline-block;
		margin: 0 auto;
		
	}
	
	/* =========================================================================== */
	
	/*top_module*/
	
	#join_module .article{
		width : 60%;
		min-height : 650px;
		border: 1px solid black;
		text-align:left;
		padding: 30px 50px;
	}
	
	
	#join_module .join_hd{
		width:100%;
		display: inline-block;
		padding-bottom : 5px;
		margin-bottom : 20px;
		border-bottom: 1px solid black;
		
	} 
	
	#join_module .join_input{
		display: inline-block;
		width: 100%;
		
	}
	
	
	#join_module .input_box{
		display: inline-block;	
		width: 100%;
		min-height: 60px;
		padding-left : 40px;
	}
	
	#join_module .input_box div{
		padding-left: 10px;
		padding-top: 15px;
	}
	
	
	#join_module .input_box .input_name{
		display: inline-block;
		width : 140px;
		height:100%;
		float: left;
		padding-top: 20px;
	}
	
	#join_module .input_box .input_place{
		display: inline-block;
		min-height:100%;
		float: left;
		width: 60%;
	}
	
	#join_module .input_box .input_place .input_placeTop{
		padding-left:0;
		padding-top:0;
		display:inline-block;
		width:100%;
	}
	
	#join_module .input_box .input_place .input_placeBottom{
		padding-left:0;
		padding-top:0;
		display:inline-block;
		width:100%;
	}
	
	#join_module .input_box .input_place input{
		width:200px;
		height: 35px;
	}
	
	
	#join_module .input_box .input_check{
		width: 100px;
		height: 35px;
	}
	
	#join_module .input_footer{
		margin-top: 30px;
		padding-top:30px;
		width : 100%;
		display: inline-block;
		text-align: center;
		border-top: 1px solid black;
	}
	
	#join_module .input_footer .input_footerDiv{
		display: inline-block;
	} 
	
	
	#join_module .input_footer button{
		width: 100px;
		height: 40px;
	}
	
</style>	
	

<script>
   function checkUserIdExist() {

      var user_id = $("#user_id").val();

      if (user_id.length == 0) {
         alert('아이디를 입력하세요');
         return;
      }

      $.ajax({
         type : 'GET',
         url : '${root}user/checkUserIdExist/'+user_id,
         dataType : 'text',
         success : function(result) {
            if (result.trim() === 'true') {
               alert('사용할 수 있는 아이디입니다.');
               $("#userIdExist").val('true');
            } else {
               alert('사용할 수 없는 아이디입니다.');
               $("#userIdExist").val('false');
            }
         }
      });

   }

   function resetUserIdExist() {

      $("#userIdExist").val('false');
   }
   
   // 현재 날짜를 얻기 위해 Date 객체를 생성
   var currentDate = new Date();

   // 년, 월, 일을 가져오기
   var year = currentDate.getFullYear();
   var month = currentDate.getMonth() + 1; // 월은 0부터 시작하므로 1을 더함
   var day = currentDate.getDate();
   
   var joinDate = (year + "-" + month + "-" + day);
   
   document.getElementById("user_joinDate").value = joinDate;
   
</script>
</head>
<body>
	<c:import url="/WEB-INF/views/include/top_menu.jsp" />


	<div class="pageContainer">
		<div class="module" id="join_module">
			<div class="article">
				<div class="join_hd">
					<h3>회원가입</h3>
					<!-- <span>*필수입력사항</span> -->
				</div>
					<form:form action="${root}user/join_pro" method="post" class="join_input" modelAttribute="joinUserBean">
						<form:hidden path="userIdExist" />
						<form:hidden path="user_joinDate"/>
						<form:hidden path="user_role" value="회원"/>
						<form:hidden path="user_visitCount" value="${1}"/>
						<div class="input_box"> 
							<div class="input_name">
								<span>이름</span>
							</div>
							<div class="input_place">
								<div class="input_placeTop">
									<form:input path="user_name" />
								</div>
								<div class="input_placeBottom">
									<form:errors path="user_name" style="color:red"/>
								</div>
							</div>
						</div>
						<div class="input_box"> 
							<div class="input_name">
								<span>아이디</span>
							</div>
							<div class="input_place">
								<div class="input_placeTop">
									<form:input path="user_id" onkeypress="resetUserIdExist()"/>
									<button type="button" onclick='checkUserIdExist()'>중복확인</button>
								</div>
								<div class="input_placeBottom">
									<form:errors path="user_id" style="color:red"/>
								</div>						
							</div>
						</div>
						<div class="input_box"> 
							<div class="input_name">
								<span>패스워드</span>
							</div>
							<div class="input_place">
								<div class="input_placeTop">
									<form:input path="user_pw" type="password" />
								</div>
								<div class="input_placeBottom">
									<form:errors path="user_pw" style="color:red"/>
								</div>
							</div> 
						</div>
						<div class="input_box"> 
							<div class="input_name">
								<span>패스워드 확인</span>
							</div>
							<div class="input_place">
								<div class="input_placeTop">
									<form:input path="user_pw2" type="password" />
								</div>
								<div class="input_placeBottom">
									<form:errors path="user_pw2" style="color:red"/>
									
								</div>				
							</div>
						</div>

						<div class="input_box"> 
							<div class="input_name">
								<span>생년월일</span>
							</div>
							<div class="input_place">
								<div class="input_placeTop">
									<form:input path="user_birthdate" />
								</div>
								<div class="input_placeBottom">
									<form:errors path="user_birthdate" style="color:red"/>
								</div>
							</div>
						</div>
						<div class="input_box"> 
							<div class="input_name">
								<span>휴대전화</span>
							</div>
							<div class="input_place">
								<div class="input_placeTop">
									<form:input path="user_phoneNum" placeholder=" ex) 010-0000-0000" />
									<button type="button" class="input_check">본인확인</button>
								</div>
								<div class="input_placeBottom">
									<form:errors path="user_phoneNum" style="color:red"/>
								</div>
								
							</div>
						</div>
						
						<div class = "input_footer">
							<div class="input_footerDiv">
								<button type="button" onClick="location.href='${root}main'">취소</button>
								<form:button type="submit" style="margin-left: 20px;">회원가입</form:button>
							</div>
						</div>
					</form:form>									
			</div>
		</div>
	</div>
	<c:import url="/WEB-INF/views/include/buttom_info.jsp" />


</body>
</html>









